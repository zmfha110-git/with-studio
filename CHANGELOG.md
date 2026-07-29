# Changelog

WITH Studio의 운영 기준, 프롬프트, 레퍼런스, 폴더 구조 변경을 기록합니다.

## [1.0.0] — 2026-07-30

### Added

- 저장소 작업 규칙 `AGENTS.md`
- 마스터 레퍼런스 v1.0 메타데이터와 SHA-256 보호 기준
- `products/{product}/original|output` 운영 구조와 `_template`
- 결과물별 `tests/QA_CHECKLIST.md`
- 실패 결과 보관 규칙
- 저장소 구조·프로젝트 명칭·마스터 이미지 해시 검증 스크립트

### Changed

- 프로젝트 명칭을 `WITH Studio`로 통일
- README를 제품 추가부터 이미지 생성·QA·변경 관리까지 포함하는 운영 문서로 개편
- 마스터 프롬프트와 단축 프롬프트의 v1.0 상태·입력 순서·관계를 명시
- 테스트 로그를 실행 조건, 필수 보존 항목, 촬영 스타일, 판정 근거가 남도록 개편
- 파일명과 작업 절차를 실제 제품 폴더 구조에 맞게 정리

### Verified

- 활성 마스터 레퍼런스 `references/MASTER_REFERENCE_v1.png`는 변경하지 않음
- 활성 마스터 프롬프트 기준은 v1.0으로 유지
