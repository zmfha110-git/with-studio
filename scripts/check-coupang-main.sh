#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: bash scripts/check-coupang-main.sh <image.png> [--preview]

Checks canvas, approximate 80% horizontal occupancy, center alignment,
output filename, master-reference SHA-256, and reports the next test ID.
Text fidelity and interior shadows remain visual QA items.
EOF
}

image_file="${1:-}"
preview=0
[[ -n "$image_file" ]] || { usage >&2; exit 2; }
shift || true

while [[ $# -gt 0 ]]; do
  case "$1" in
    --preview) preview=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "FAIL: unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

for command_name in ffmpeg ffprobe rg; do
  command -v "$command_name" >/dev/null || {
    echo "FAIL: required command missing: $command_name" >&2
    exit 1
  }
done

[[ -f "$image_file" ]] || { echo "FAIL: image missing: $image_file" >&2; exit 1; }

image_size="$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$image_file")"
[[ "$image_size" == "1254x1254" ]] || {
  echo "FAIL: canvas must be 1254x1254, got $image_size" >&2
  exit 1
}

if [[ "$preview" -ne 1 ]]; then
  output_name="$(basename "$image_file")"
  [[ "$output_name" =~ ^with-wipes-(individual|individual-plain|bulk|mini|dry-tissue)-main-box-product-studio-v[0-9]+-[0-9]{2}\.png$ ]] || {
    echo "FAIL: output filename does not match Coupang naming rule: $output_name" >&2
    exit 1
  }
fi

expected_reference_sha="465b1d520044a88866a6d4bf7ffca644003ef851397f225d588158ba8c21a54c"
actual_reference_sha="$(shasum -a 256 references/MASTER_REFERENCE_v1.png | awk '{print $1}')"
[[ "$actual_reference_sha" == "$expected_reference_sha" ]] || {
  echo "FAIL: master reference SHA-256 changed" >&2
  exit 1
}

crop_line="$(ffmpeg -hide_banner -loglevel info -loop 1 -i "$image_file" \
  -vf 'format=gray,negate,cropdetect=limit=0.01:round=1:reset=0' \
  -frames:v 2 -f null - 2>&1 | rg 'crop=' | tail -1 || true)"

[[ -n "$crop_line" ]] || {
  echo "FAIL: could not detect the product area against the background" >&2
  exit 1
}

crop_value="$(sed -E 's/.*crop=([0-9]+:[0-9]+:[0-9]+:[0-9]+).*/\1/' <<< "$crop_line")"
IFS=: read -r crop_width crop_height crop_x crop_y <<< "$crop_value"

[[ "$crop_width" =~ ^[0-9]+$ && "$crop_height" =~ ^[0-9]+$ && "$crop_x" =~ ^[0-9]+$ && "$crop_y" =~ ^[0-9]+$ ]] || {
  echo "FAIL: invalid crop detection result: $crop_value" >&2
  exit 1
}

occupancy="$(awk -v width="$crop_width" 'BEGIN { printf "%.2f", width / 1254 * 100 }')"
center_x="$(awk -v x="$crop_x" -v width="$crop_width" 'BEGIN { printf "%.1f", x + width / 2 }')"
center_delta="$(awk -v center="$center_x" 'BEGIN { delta=center-627; if (delta<0) delta=-delta; printf "%.1f", delta }')"

awk -v value="$occupancy" 'BEGIN { exit !(value >= 78 && value <= 82) }' || {
  echo "FAIL: horizontal occupancy must be 78-82%, got ${occupancy}%" >&2
  exit 1
}

awk -v value="$center_delta" 'BEGIN { exit !(value <= 20) }' || {
  echo "FAIL: horizontal center must be within 20px of x=627, delta=${center_delta}px" >&2
  exit 1
}

echo "PASS: canvas 1254x1254"
echo "PASS: horizontal occupancy ${occupancy}% (target 78-82%)"
echo "PASS: horizontal center x=${center_x}, delta=${center_delta}px"
echo "PASS: master reference SHA-256 $actual_reference_sha"
echo "NEXT_TEST_ID: $(bash scripts/next-test-id.sh)"
echo "MANUAL_QA: exact text, logo, internal product fidelity, and interior shadow check"
