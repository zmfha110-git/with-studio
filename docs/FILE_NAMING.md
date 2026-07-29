# File Naming Guide

## Master Reference

`MASTER_REFERENCE_v1.png`

## Original

`{product}-{type}-original-{number}.png`

예시:

`dry-tissue-box-original-01.png`

## Output

`{product}-{type}-studio-v{prompt-version}-{number}.png`

예시:

`dry-tissue-box-studio-v1-01.png`

## Failed Test

`FAIL-{number}-{product}-{issue}.png`

예시:

`FAIL-003-dry-tissue-box-ratio.png`

## Version Rules

- 프롬프트의 의미가 바뀌면 Major 버전 변경
- 문장 보완이나 조건 추가는 Minor 버전 변경
- 오탈자 수정은 Patch 버전 변경
