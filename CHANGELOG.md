# Changelog

WITH Studio의 운영 기준, 프롬프트, 레퍼런스, 폴더 구조 변경을 기록합니다.

## [1.0.3] — 2026-08-01

### Added

- `쿠팡 대표이미지 만들어줘` 요청을 즉시 처리하는 `COUPANG_MAIN_PRESET.md`
- 상품 우측 배치, 박스+상품 80% 점유, 결합 영역 중앙 정렬 기준
- 승인 전 빠른 임시 시안과 승인 후 저장·QA를 분리한 실행 규칙

## [1.0.2] — 2026-08-01

### Changed

- 출력 파일명을 `{product}-{variant}-{image-type}-{composition}-studio-v{prompt-version}-{number}` 구조로 세분화
- 상품 종류를 `individual`, `individual-plain`, `bulk`, `mini`, `dry-tissue`로 고정
- 대표이미지의 우측 배치를 기본값으로 정하고 파일명에서는 배치 방향을 생략
- 위치·크기 조정은 임시 시안으로 확인하고 최종 승인본에만 저장·QA를 수행하도록 작업 절차 변경

### Added

- macOS 한글 정규화와 외부 연동 문제를 피하기 위한 영문 kebab-case 파일명 기준
- 박스와 상품의 합성 구성을 나타내는 `box-product` 값

## [1.0.1] — 2026-07-31

### Added

- 전경 제품 합성 시 실제 `RGBA PNG` 사용 기준
- 제품 외곽의 원본 배경·흰색/회색 띠·임의 그림자 검사 항목

### Changed

- 전경 제품은 별도 그림자 없이 원본 알파로 직접 합성하도록 스타일 가이드와 QA 체크리스트를 명료화

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
