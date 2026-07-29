# File Naming Guide

모든 파일명은 영문 소문자 kebab-case를 기본으로 하고, 테스트 ID와 버전 표기만 대문자를 허용합니다.

## Master Reference

`MASTER_REFERENCE_v1.png`

## Original

경로:

`products/{product}/original/{product}-{type}-original-{number}.{ext}`

예시:

`dry-tissue-box-original-01.png`

원본 확장자는 실제 입력 파일 형식을 유지합니다. 같은 원본을 다른 확장자로 변환해 중복 저장하지 않습니다.

## Output

경로:

`products/{product}/output/{product}-{type}-studio-v{prompt-version}-{number}.png`

예시:

`dry-tissue-box-studio-v1-01.png`

## Failed Test

`FAIL-{test-id}-{product}-{issue}.png`

예시:

`FAIL-TEST-003-dry-tissue-box-ratio.png`

실패 파일은 제품 `output`에 원본 결과를 유지하고, `tests/failure`에 같은 파일의 사본을 둡니다.

## Version Rules

- 프롬프트의 의미가 바뀌면 Major 버전 변경
- 문장 보완이나 조건 추가는 Minor 버전 변경
- 오탈자 수정은 Patch 버전 변경

현재 활성 버전은 v1.0입니다. 파일명에는 `v1`을 사용하고 테스트 로그에는 `1.0`을 기록합니다.

## Number Rules

- `{number}`는 `01`부터 시작하는 두 자리 일련번호
- 테스트 ID는 `TEST-001`부터 시작하는 세 자리 일련번호
- 같은 입력을 다시 실행하면 출력 일련번호를 올리고 기존 파일을 덮어쓰지 않음
