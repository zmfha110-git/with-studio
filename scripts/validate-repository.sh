#!/usr/bin/env bash

set -euo pipefail

readonly EXPECTED_REFERENCE_SHA="465b1d520044a88866a6d4bf7ffca644003ef851397f225d588158ba8c21a54c"
readonly REFERENCE_FILE="references/MASTER_REFERENCE_v1.png"

required_files=(
  "README.md"
  "AGENTS.md"
  "CHANGELOG.md"
  "docs/FILE_NAMING.md"
  "docs/STYLE_GUIDE.md"
  "docs/WORKFLOW.md"
  "prompts/MASTER_PROMPT.md"
  "prompts/SHORT_PROMPT.md"
  "references/README.md"
  "tests/QA_CHECKLIST.md"
  "tests/TEST_LOG.md"
  "$REFERENCE_FILE"
)

required_directories=(
  "products/_template/original"
  "products/_template/output"
  "tests/failure"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$file" ]]; then
    echo "FAIL: required file missing: $file" >&2
    exit 1
  fi
done

for directory in "${required_directories[@]}"; do
  if [[ ! -d "$directory" ]]; then
    echo "FAIL: required directory missing: $directory" >&2
    exit 1
  fi
done

actual_reference_sha="$(shasum -a 256 "$REFERENCE_FILE" | awk '{print $1}')"
if [[ "$actual_reference_sha" != "$EXPECTED_REFERENCE_SHA" ]]; then
  echo "FAIL: master reference SHA-256 changed" >&2
  exit 1
fi

if rg -n --glob "*.md" "WITH Image Library" . >/dev/null; then
  echo "FAIL: legacy project name remains in Markdown files" >&2
  rg -n --glob "*.md" "WITH Image Library" . >&2
  exit 1
fi

while IFS= read -r product_directory; do
  [[ "$(basename "$product_directory")" == "_template" ]] && continue

  if [[ ! -d "$product_directory/original" || ! -d "$product_directory/output" ]]; then
    echo "FAIL: product folder requires original/output pair: $product_directory" >&2
    exit 1
  fi
done < <(find products -mindepth 1 -maxdepth 1 -type d -print)

echo "PASS: WITH Studio repository structure is valid"
echo "PASS: master reference SHA-256 $actual_reference_sha"
