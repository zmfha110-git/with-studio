# File Naming Guide

모든 파일명은 영문 소문자 kebab-case를 기본으로 하고, 테스트 ID와 버전 표기만 대문자를 허용합니다.

한글 파일명은 사용하지 않습니다. macOS의 한글 유니코드 정규화 차이로 같은 이름이 서로 다른 파일로 인식될 수 있고, URL·외부 업로드·스크립트 처리에서 호환성 문제가 생길 수 있기 때문입니다.

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

`products/{product}/output/{product}-{variant}-{image-type}-{composition}-studio-v{prompt-version}-{number}.png`

예시:

`with-wipes-individual-main-box-product-studio-v1-01.png`

### Variant

| 상품 종류 | 값 |
| --- | --- |
| 개별 | `individual` |
| 개별(무지) | `individual-plain` |
| 덕용 | `bulk` |
| 미니 | `mini` |
| 건티슈 | `dry-tissue` |

### Image Type

| 이미지 용도 | 값 |
| --- | --- |
| 대표이미지 | `main` |
| 상세이미지 | `detail` |
| 박스이미지 | `box` |

### Composition

- 박스와 상품을 함께 보여주는 이미지는 `box-product`를 사용합니다.
- 상품만 보여주는 이미지는 `product`를 사용합니다.
- 박스이미지는 구성이 자명하므로 `composition`을 생략할 수 있습니다.
- 정면·후면처럼 구분이 필요할 때만 `front`, `back`, `side`, `top`을 구성 뒤에 추가합니다.
- 대표이미지의 상품 배치는 우측을 기본값으로 하며 파일명에는 배치 방향을 넣지 않습니다.

예시:

- `with-wipes-individual-main-box-product-studio-v1-01.png`
- `with-wipes-individual-plain-main-box-product-studio-v1-01.png`
- `with-wipes-bulk-main-box-product-studio-v1-01.png`
- `with-wipes-mini-main-box-product-studio-v1-01.png`
- `with-wipes-dry-tissue-main-box-product-studio-v1-01.png`
- `with-wipes-individual-box-studio-v1-01.png`
- `with-wipes-individual-detail-product-front-studio-v1-01.png`

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
