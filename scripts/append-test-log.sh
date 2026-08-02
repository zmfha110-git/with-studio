#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: bash scripts/append-test-log.sh <entry-file> [--log <test-log>]

The entry file must contain exactly one heading: ## TEST-AUTO
The script allocates the next ID and appends the entry while holding a lock.
EOF
}

entry_file="${1:-}"
[[ -n "$entry_file" ]] || { usage >&2; exit 2; }
shift || true

log_file="tests/TEST_LOG.md"
while [[ $# -gt 0 ]]; do
  case "$1" in
    --log) log_file="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "FAIL: unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

[[ -f "$entry_file" ]] || { echo "FAIL: entry file missing: $entry_file" >&2; exit 1; }
[[ -f "$log_file" ]] || { echo "FAIL: test log missing: $log_file" >&2; exit 1; }

placeholder_count="$(rg -c '^## TEST-AUTO$' "$entry_file" || true)"
[[ "$placeholder_count" == "1" ]] || {
  echo "FAIL: entry must contain exactly one '## TEST-AUTO' heading" >&2
  exit 1
}

lock_directory="${log_file}.lock"

if ! mkdir "$lock_directory" 2>/dev/null; then
  echo "FAIL: test log is being updated by another process: $lock_directory" >&2
  exit 1
fi

temp_entry=""
cleanup() {
  [[ -z "$temp_entry" || ! -e "$temp_entry" ]] || rm -f "$temp_entry"
  rmdir "$lock_directory" 2>/dev/null || true
}
trap cleanup EXIT

test_id="$(bash scripts/next-test-id.sh "$log_file")"
temp_entry="$(mktemp "${TMPDIR:-/tmp}/with-studio-test-entry.XXXXXX")"
sed "s/^## TEST-AUTO$/## $test_id/" "$entry_file" > "$temp_entry"

{
  printf '\n'
  cat "$temp_entry"
  printf '\n'
} >> "$log_file"

echo "$test_id"
