# Failure Outputs

`FAIL` 판정을 받은 결과물의 사본을 보관합니다.

- 파일명: `FAIL-{test-id}-{product}-{issue}.png`
- 원본 결과는 제품의 `output` 폴더에 유지합니다.
- 실패 원인과 다음 행동은 `tests/TEST_LOG.md`에 기록합니다.
- 실패 파일을 수정해 덮어쓰지 않고 새 테스트 ID로 재실행합니다.
