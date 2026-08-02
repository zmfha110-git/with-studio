# Coupang Main Image Preset

WITH Studio의 쿠팡 대표이미지를 빠르게 반복 제작하기 위한 실행 프리셋입니다. 이 문서는 `MASTER_PROMPT.md` v1.0을 대체하지 않고, 박스+상품 합성의 구도와 작업 순서만 고정합니다.

## Trigger

사용자가 박스 이미지와 상품 이미지를 함께 전달하며 `쿠팡 대표이미지 만들어줘`라고 요청하면 추가 확인 없이 이 프리셋을 적용합니다.

입력 파일이 두 개 모두 제공됐다면 배치·크기·파일명에 대해 다시 질문하지 않습니다. 상품 종류만 판별할 수 없을 때에만 한 번 질문합니다.

## Input Roles

1. 박스 이미지: 배경과 박스 원본
2. 상품 이미지: 박스 우측 전경에 배치할 실제 상품
3. 마스터 레퍼런스: `references/MASTER_REFERENCE_v1.png`
4. 활성 프롬프트: `prompts/MASTER_PROMPT.md` v1.0

## Standard Composition

- 최종 캔버스: 1254×1254 PNG, 1:1
- 박스와 상품을 포함한 결합 영역: 캔버스 가로 폭의 약 80%
- 결합 영역 중심: 캔버스 정중앙, X/Y 627px 기준
- 상품: 박스 우측 전경에 크게 배치
- 중첩: 우측 수량·포장 문구는 상품이 가릴 수 있음
- 잠금 영역: 박스 중앙 로고와 좌상단 표시 문구는 사용자 요청 없이는 가리지 않음
- 그림자·음영: 박스와 상품 외부의 접지 그림자·투영 그림자·음영을 모두 제거
- 배경: `#FFFFFF` 단색 순백. 그라데이션·비네팅·바닥선·반사 없음

상품 비율이 세로형이 아니면 상품 형태에 맞춰 크기를 조정하되, 우측 배치·80% 점유·중앙 정렬 원칙은 유지합니다.

## Product Extraction

- 상품은 실제 투명 채널을 가진 RGBA PNG로 분리한 뒤 합성
- 상품 로고·한글 텍스트·인쇄 배치는 원본 픽셀 사용
- 상품 외곽의 원본 배경·흰색/회색 띠·사각형 배경 제거
- 외곽 후광이나 전체 소프트 그림자 추가 금지

## Fast Preview Flow

1. 입력과 기존 승인 누끼를 확인
2. 가능한 경우 기존 승인 알파 마스크를 재사용해 원본 픽셀 누끼 생성
3. 최초 시안만 이미지 생성 도구로 만들고, 이후 위치·크기 수정은 `scripts/compose-coupang-main.sh`의 좌표 합성으로 처리
4. 시안 이미지만 먼저 사용자에게 표시
5. 반드시 질문형으로 승인 여부를 안내: `이 시안으로 확정할까요? 답변 전까지 최종 저장과 QA는 멈춥니다.`
6. 사용자 승인 전에는 `output` 저장, QA 기록, 저장소 전체 검증을 실행하지 않음
7. 승인 후 `scripts/check-coupang-main.sh`로 일괄 검사하고 `scripts/append-test-log.sh`로 충돌 없이 기록

## Interaction Gate

- 사용자 입력이 필요한 모든 지점은 물음표가 있는 질문형으로 안내합니다.
- 질문 직후에는 어떤 작업이 멈추는지 한 문장으로 명시합니다.
- 위치·크기 피드백은 새 이미지를 생성하지 않고 승인된 RGBA 제품의 `x`, `y`, `product-width` 값만 바꿉니다.
- 위치 수정 목표 시간은 5초 이내, 승인 후 저장·QA·기록 목표 시간은 30초 이내입니다.

## Fast Path Commands

좌표 합성:

```bash
bash scripts/compose-coupang-main.sh \
  --box products/with-wipes/original/{box}.png \
  --product products/with-wipes/output/{approved-cutout}.png \
  --product-width 380 \
  --x 760 \
  --y 760 \
  --output /tmp/with-wipes-coupang-preview.png
```

일괄 검사:

```bash
bash scripts/check-coupang-main.sh /tmp/with-wipes-coupang-preview.png --preview
```

테스트 기록은 `## TEST-AUTO` 헤더를 가진 임시 항목 파일을 만든 뒤 아래 명령으로 추가합니다.

```bash
bash scripts/append-test-log.sh /tmp/test-entry.md
```

## Final Naming

`with-wipes-{variant}-main-box-product-studio-v1-{number}.png`

상품 종류 값:

- 개별: `individual`
- 개별(무지): `individual-plain`
- 덕용: `bulk`
- 미니: `mini`
- 건티슈: `dry-tissue`

대표이미지의 우측 배치는 기본값이므로 파일명에 `right`를 넣지 않습니다.
