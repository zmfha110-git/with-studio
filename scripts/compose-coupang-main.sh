#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  bash scripts/compose-coupang-main.sh \
    --box <1254x1254-png> \
    --product <rgba-png> \
    --product-width <pixels> \
    --x <pixels> \
    --y <pixels> \
    --output <png> [--force]

Repositions an approved RGBA product without regenerating the box or text.
Change only --x/--y/--product-width for fast layout iterations.
EOF
}

box_file=""
product_file=""
product_width=""
product_x=""
product_y=""
output_file=""
force=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --box) box_file="$2"; shift 2 ;;
    --product) product_file="$2"; shift 2 ;;
    --product-width) product_width="$2"; shift 2 ;;
    --x) product_x="$2"; shift 2 ;;
    --y) product_y="$2"; shift 2 ;;
    --output) output_file="$2"; shift 2 ;;
    --force) force=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "FAIL: unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

for command_name in ffmpeg ffprobe; do
  command -v "$command_name" >/dev/null || {
    echo "FAIL: required command missing: $command_name" >&2
    exit 1
  }
done

for required_value in box_file product_file product_width product_x product_y output_file; do
  [[ -n "${!required_value}" ]] || {
    echo "FAIL: missing required argument: $required_value" >&2
    usage >&2
    exit 2
  }
done

[[ -f "$box_file" ]] || { echo "FAIL: box file missing: $box_file" >&2; exit 1; }
[[ -f "$product_file" ]] || { echo "FAIL: product file missing: $product_file" >&2; exit 1; }
[[ "$product_width" =~ ^[1-9][0-9]*$ ]] || { echo "FAIL: product width must be a positive integer" >&2; exit 2; }
[[ "$product_x" =~ ^-?[0-9]+$ ]] || { echo "FAIL: x must be an integer" >&2; exit 2; }
[[ "$product_y" =~ ^-?[0-9]+$ ]] || { echo "FAIL: y must be an integer" >&2; exit 2; }

box_size="$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$box_file")"
[[ "$box_size" == "1254x1254" ]] || {
  echo "FAIL: box canvas must be 1254x1254, got $box_size" >&2
  exit 1
}

product_pixel_format="$(ffprobe -v error -select_streams v:0 -show_entries stream=pix_fmt -of default=nw=1:nk=1 "$product_file")"
case "$product_pixel_format" in
  rgba|bgra|argb|abgr|ya8|ya16be|ya16le|yuva*|gbrap*) ;;
  *)
    echo "FAIL: product must have an alpha channel, got pixel format $product_pixel_format" >&2
    exit 1
    ;;
esac

if [[ -e "$output_file" && "$force" -ne 1 ]]; then
  echo "FAIL: output exists; choose a new path or pass --force: $output_file" >&2
  exit 1
fi

output_directory="$(dirname "$output_file")"
[[ -d "$output_directory" ]] || {
  echo "FAIL: output directory missing: $output_directory" >&2
  exit 1
}

temp_directory="$(mktemp -d "${TMPDIR:-/tmp}/with-studio-compose.XXXXXX")"
temp_output="$temp_directory/result.png"
cleanup() {
  [[ ! -e "$temp_output" ]] || rm -f "$temp_output"
  rmdir "$temp_directory" 2>/dev/null || true
}
trap cleanup EXIT

ffmpeg -hide_banner -loglevel error -y \
  -i "$box_file" \
  -i "$product_file" \
  -filter_complex "[1:v]scale=${product_width}:-1:flags=lanczos[product];[0:v][product]overlay=x=${product_x}:y=${product_y}:format=auto,format=rgb24[result]" \
  -map "[result]" \
  -frames:v 1 \
  "$temp_output"

mv -f "$temp_output" "$output_file"

echo "PASS: composed without product regeneration"
echo "OUTPUT: $output_file"
echo "PRODUCT: width=$product_width x=$product_x y=$product_y"
