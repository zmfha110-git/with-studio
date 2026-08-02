#!/usr/bin/env bash

set -euo pipefail

log_file="${1:-tests/TEST_LOG.md}"
[[ -f "$log_file" ]] || { echo "FAIL: test log missing: $log_file" >&2; exit 1; }

last_number="$({ rg '^## TEST-[0-9]{3}$' "$log_file" || true; } \
  | sed -E 's/^## TEST-([0-9]{3})$/\1/' \
  | sort -n \
  | tail -1)"

if [[ -z "$last_number" ]]; then
  next_number=1
else
  next_number=$((10#$last_number + 1))
fi

printf 'TEST-%03d\n' "$next_number"
