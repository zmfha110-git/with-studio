# Test Log

이미지 생성 실행과 QA 판정을 재현하기 위한 기록입니다. 테스트마다 아래 템플릿을 복사하고 ID를 1씩 올립니다. 관찰한 사실과 원인 추정은 분리해서 적습니다.

## Status

- `PASS`: 필수 보존 항목과 스타일 기준을 모두 충족
- `REVISE`: 필수 보존 항목은 유지됐으나 스타일·마감 수정 필요
- `FAIL`: 비율·실루엣·로고·한글 텍스트·인쇄 배치 중 하나 이상 변경

---

## TEST-001

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation tool
- Source Image: `products/with-wipes/original/with-wipes-individual-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-box-studio-v1-01.png`
- Previous Test: 없음

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 원본의 가로로 긴 박스 비율과 폭·높이 관계가 유지됨 |
| 외곽 실루엣·접힘 구조 | PASS | 정면 외곽선, 상단 면, 좌우 모서리와 접힘 구조가 원본과 대응함 |
| 로고 | PASS | 중앙 `with 위드.물티슈` 로고의 형태·색상·위치가 유지됨 |
| 모든 한글 텍스트 | PASS | `위생용품`, `위드.물티슈`, `400매`, `개별포장`이 원문대로 확인됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 좌상단 표시, 중앙 로고, 우하단 수량 표기의 크기 관계와 배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 거의 정면이며 과한 3D 회전이나 원근 변형이 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 정사각형 캔버스 중앙에 충분한 흰 여백으로 배치됨 |
| 배경 | PASS | 경계·소품·반사·질감 없는 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | REVISE | 후속 제품과 나란히 비교했을 때 마스터의 정면 중심 조명각과 통일 재작업이 필요함 |
| 그림자 | REVISE | 마스터와 동일한 접지 그림자 방향·확산 범위로 재조정이 필요함 |
| 크라프트 톤·표면 질감 | PASS | 밝은 웜 베이지의 매끄러운 무광 종이 표면으로 보임 |
| 생성 흔적·오염 | PASS | 가장자리와 텍스트 주변에 뚜렷한 생성 흔적·주름·얼룩·먼지가 보이지 않음 |

### 결과

- Status: REVISE
- Observed Issue: 제품군 전체에서 마스터 레퍼런스와 조명각·그림자 방향을 동일하게 맞출 필요가 있음
- Suspected Cause: 초기 생성에서 조명 방향과 그림자 통일 조건이 충분히 고정되지 않음
- Next Action: 제품과 인쇄는 고정하고 조명 방향·접지 그림자만 마스터에 맞춰 재생성
- Retest ID: TEST-005

---

## TEST-002

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation tool
- Source Image: `products/with-wipes/original/with-wipes-common-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-studio-v1-01.png`
- Previous Test: 없음

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | FAIL | 원본보다 결과 박스의 폭이 높이에 비해 줄어 가로로 긴 비율이 충분히 유지되지 않음 |
| 외곽 실루엣·접힘 구조 | PASS | 정면 외곽선과 좌우 접힘 구조는 원본과 대응함 |
| 로고 | PASS | 중앙 `with 위드.물티슈` 로고의 형태·색상이 유지됨 |
| 모든 한글 텍스트 | PASS | `위생용품`, `위드.물티슈`, `400~600매`가 원문대로 확인됨 |
| 글자 형태·인쇄 위치·레이아웃 | FAIL | 박스 폭 변화에 따라 중앙 로고와 우하단 수량 표기의 상대 위치·크기 관계가 원본과 달라짐 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 거의 정면이며 과한 3D 회전은 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 정사각형 캔버스 중앙에 배치됨 |
| 배경 | PASS | 경계·소품·반사 없는 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | PASS | 부드러운 하이키 확산광과 중립적인 노출이 확인됨 |
| 그림자 | PASS | 박스 아래에 옅고 짧은 접지 그림자만 있음 |
| 크라프트 톤·표면 질감 | PASS | 밝은 웜 베이지의 매끄러운 무광 표면으로 보임 |
| 생성 흔적·오염 | PASS | 뚜렷한 오염이나 가장자리 생성 흔적이 보이지 않음 |

### 결과

- Status: FAIL
- Observed Issue: 박스의 가로세로 비율과 인쇄 요소의 상대 배치가 원본에서 벗어남
- Suspected Cause: 정사각형 캔버스에 맞추는 과정에서 제품 폭이 기준 레퍼런스 쪽으로 수렴함
- Next Action: 원본 박스 비율과 인쇄 상대 위치만 우선 고정해 재생성
- Retest ID: TEST-003

---

## TEST-003

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation tool + FFmpeg 균일 비율 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-studio-v1-02.png`
- Previous Test: TEST-002

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 색상 경계 측정 기준 원본 2.2766, 결과 2.2768로 가로세로 비율이 사실상 일치함 |
| 외곽 실루엣·접힘 구조 | PASS | 매우 넓고 낮은 정면 실루엣과 좌우 접힘·모서리 구조가 원본과 대응함 |
| 로고 | PASS | 중앙 `with 위드.물티슈` 로고의 형태·색상·위치가 유지됨 |
| 모든 한글 텍스트 | PASS | `위생용품`, `위드.물티슈`, `400~600매`가 마침표와 물결표를 포함해 원문대로 확인됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 좌상단 표시, 중앙 로고, 우하단 수량 표기의 크기 관계와 박스 내 상대 위치가 원본과 대응함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 거의 정면이며 과한 3D 회전이나 원근 변형이 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 정사각형 캔버스 중앙에 충분한 상하좌우 여백으로 배치됨 |
| 배경 | PASS | 경계·소품·반사·질감 없는 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | REVISE | 전체 노출은 적절하지만 마스터보다 측면 방향성이 강해 동일한 조명각으로 보이지 않음 |
| 그림자 | REVISE | 접지 그림자가 마스터보다 오른쪽으로 길게 퍼져 조명 방향 차이가 드러남 |
| 크라프트 톤·표면 질감 | REVISE | 후속 비교에서 마스터보다 밝은 톤으로 확인됨 |
| 생성 흔적·오염 | PASS | 가장자리와 텍스트 주변에 뚜렷한 생성 흔적·주름·얼룩·먼지가 보이지 않음 |

### 결과

- Status: REVISE
- Observed Issue: 마스터 레퍼런스와 조명 방향 및 그림자 확산 방향이 다름
- Suspected Cause: 생성 과정에서 측면 방향광과 오른쪽 그림자가 강화됨
- Next Action: 제품과 인쇄는 고정하고 조명 방향·접지 그림자만 마스터에 맞춰 재생성
- Retest ID: TEST-004

---

## TEST-004

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation tool + FFmpeg 균일 비율 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-studio-v1-03.png`
- Previous Test: TEST-003

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 색상 경계 측정 기준 원본 2.2766, 결과 2.2794로 오차 약 0.12% 범위임 |
| 외곽 실루엣·접힘 구조 | PASS | 매우 넓고 낮은 정면 실루엣과 좌우 접힘·모서리 구조가 원본과 대응함 |
| 로고 | PASS | 중앙 `with 위드.물티슈` 로고의 형태·색상·위치가 유지됨 |
| 모든 한글 텍스트 | PASS | `위생용품`, `위드.물티슈`, `400~600매`가 마침표와 물결표를 포함해 원문대로 확인됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 좌상단 표시, 중앙 로고, 우하단 수량 표기의 크기 관계와 박스 내 상대 위치가 원본과 대응함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 거의 정면이며 과한 3D 회전이나 원근 변형이 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 정사각형 캔버스 중앙에 충분한 상하좌우 여백으로 배치됨 |
| 배경 | PASS | 경계·소품·반사·질감 없는 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | PASS | 마스터와 같은 정면 중심의 부드러운 하이키 확산광과 낮은 명암 대비가 확인됨 |
| 그림자 | PASS | 마스터처럼 박스 바로 아래에 짧고 옅게 모이는 접지 그림자이며 오른쪽으로 길게 퍼지지 않음 |
| 크라프트 톤·표면 질감 | REVISE | 중앙색 `#DAC4B0`으로 마스터 `#CCB39B`보다 밝음 |
| 생성 흔적·오염 | PASS | 가장자리와 텍스트 주변에 뚜렷한 생성 흔적·주름·얼룩·먼지가 보이지 않음 |

### 결과

- Status: REVISE
- Observed Issue: 크라프트 박스 톤이 마스터보다 밝음
- Suspected Cause: 생성 과정에서 박스 중간톤의 명도가 높아짐
- Next Action: 글자·배경·형태를 고정하고 크라프트 영역만 선택 보정
- Retest ID: TEST-009

---

## TEST-005

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation tool
- Source Image: `products/with-wipes/original/with-wipes-individual-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-box-studio-v1-02.png`
- Previous Test: TEST-001

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 색상 경계 측정 기준 원본 1.1935, 결과 1.1960으로 오차 약 0.21% 범위임 |
| 외곽 실루엣·접힘 구조 | PASS | 정면 외곽선, 상단 면, 좌우 접힘·모서리 구조가 원본과 대응함 |
| 로고 | PASS | 중앙 `with 위드.물티슈` 로고의 형태·색상·위치가 유지됨 |
| 모든 한글 텍스트 | PASS | `위생용품`, `위드.물티슈`, `400매`, `개별포장`이 마침표를 포함해 원문대로 확인됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 좌상단 표시, 중앙 로고, 우하단 수량·포장 표기의 크기 관계와 상대 위치가 원본과 대응함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 거의 정면이며 과한 3D 회전이나 원근 변형이 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 정사각형 캔버스 중앙에 충분한 상하좌우 여백으로 배치됨 |
| 배경 | PASS | 경계·소품·반사·질감 없는 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | PASS | 마스터와 같은 정면 중심의 부드러운 하이키 확산광과 낮은 명암 대비가 확인됨 |
| 그림자 | PASS | 마스터처럼 박스 바로 아래에 짧고 옅게 모이는 접지 그림자이며 긴 측면 그림자가 없음 |
| 크라프트 톤·표면 질감 | REVISE | 중앙색 `#D9C1AC`으로 마스터 `#CCB39B`보다 밝음 |
| 생성 흔적·오염 | PASS | 가장자리와 텍스트 주변에 뚜렷한 생성 흔적·주름·얼룩·먼지가 보이지 않음 |

### 결과

- Status: REVISE
- Observed Issue: 크라프트 박스 톤이 마스터보다 밝음
- Suspected Cause: 생성 과정에서 박스 중간톤의 명도가 높아짐
- Next Action: 글자·배경·형태를 고정하고 크라프트 영역만 선택 보정
- Retest ID: TEST-008

---

## TEST-006

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation tool + FFmpeg 균일 비율 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-1000-1200-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-1000-1200-studio-v1-01.png`
- Previous Test: 없음

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 색상 경계 측정 기준 원본 1.5333, 결과 1.5326으로 오차 약 0.05% 범위임 |
| 외곽 실루엣·접힘 구조 | PASS | 넓은 정면 실루엣, 상단 면, 좌우 모서리 구조가 원본과 대응함 |
| 로고 | PASS | 중앙 `with 위드.물티슈` 로고의 형태·색상·위치가 유지됨 |
| 모든 한글 텍스트 | PASS | `위생용품`, `위드.물티슈`, `1000~1200매`가 마침표와 물결표를 포함해 원문대로 확인됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 좌상단 표시, 중앙 로고, 우하단 수량 표기의 크기 관계와 박스 내 상대 위치가 원본과 대응함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 거의 정면이며 과한 3D 회전이나 원근 변형이 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 정사각형 캔버스 중앙에 충분한 상하좌우 여백으로 배치됨 |
| 배경 | PASS | 경계·소품·반사·질감 없는 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | PASS | 마스터와 같은 정면 중심의 부드러운 하이키 확산광과 낮은 명암 대비가 확인됨 |
| 그림자 | PASS | 마스터처럼 박스 바로 아래에 짧고 옅게 모이는 접지 그림자이며 긴 측면 그림자가 없음 |
| 크라프트 톤·표면 질감 | REVISE | 중앙색 `#DFC5AC`으로 마스터 `#CCB39B`보다 밝음 |
| 생성 흔적·오염 | PASS | 가장자리와 텍스트 주변에 뚜렷한 생성 흔적·주름·얼룩·먼지가 보이지 않음 |

### 결과

- Status: REVISE
- Observed Issue: 크라프트 박스 톤이 마스터보다 밝음
- Suspected Cause: 생성 과정에서 박스 중간톤의 명도가 높아짐
- Next Action: 글자·배경·형태를 고정하고 크라프트 영역만 선택 보정
- Retest ID: TEST-010

---

## TEST-007

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: 생성 없음 — FFmpeg SSIM·PSNR 픽셀 동일성 검증 후 원본 보존
- Source Image: `products/with-wipes/original/with-wipes-dry-tissue-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-dry-tissue-box-studio-v1-01.png`
- Previous Test: 없음

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 결과가 원본과 동일 파일 내용이며 측정 비율 1.2507이 그대로 유지됨 |
| 외곽 실루엣·접힘 구조 | PASS | 결과가 원본과 픽셀 단위로 동일해 외곽선·상단 면·접힘·모서리가 유지됨 |
| 로고 | PASS | 중앙 `with 위드.건티슈` 로고가 원본 그대로 유지됨 |
| 모든 한글 텍스트 | PASS | `위드.건티슈`가 마침표를 포함해 원문대로 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 결과가 원본과 픽셀 단위로 동일해 글자 형태와 중앙 배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 마스터와 픽셀 단위로 동일한 정면 촬영각임 |
| 중앙 배치·여백·1:1 | PASS | 마스터와 동일한 1254×1254 정사각형 캔버스와 여백임 |
| 배경 | PASS | 마스터와 동일한 순백에 가까운 심리스 배경임 |
| 조명·노출·화이트밸런스 | PASS | 마스터와 SSIM 1.0, PSNR 무한대로 픽셀 단위 동일함 |
| 그림자 | PASS | 마스터와 동일한 짧고 옅은 접지 그림자임 |
| 크라프트 톤·표면 질감 | PASS | 마스터와 동일한 밝은 웜 베이지 고급 무광 종이 표면임 |
| 생성 흔적·오염 | PASS | 이미지 생성을 수행하지 않아 추가 생성 흔적이 없음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 원본과 동일한 결과물을 승인본으로 유지
- Retest ID: 없음

---
## TEST-008

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Swift 선택적 크라프트 톤 보정
- Source Image: `products/with-wipes/original/with-wipes-individual-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-box-studio-v1-03.png`
- Previous Test: TEST-005

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 픽셀 좌표 이동 없이 색상만 보정함 |
| 외곽 실루엣·접힘 구조 | PASS | 형태 픽셀의 위치를 변경하지 않음 |
| 로고 | PASS | 로고 위치·형태가 유지됨 |
| 모든 한글 텍스트 | PASS | 모든 문구가 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 인쇄 요소의 좌표와 배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 변경 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254와 배치가 유지됨 |
| 배경 | PASS | 흰 배경이 유지됨 |
| 조명·노출·화이트밸런스 | PASS | 기존 마스터 조명각이 유지됨 |
| 그림자 | PASS | 기존 접지 그림자가 유지됨 |
| 크라프트 톤·표면 질감 | REVISE | 중앙색 `#D5BFAA`로 낮아졌지만 마스터 `#CCB39B`보다 여전히 밝음 |
| 생성 흔적·오염 | REVISE | 색공간 변환으로 검은 인쇄 픽셀에도 최대 20단계 변화가 확인됨 |

### 결과

- Status: REVISE
- Observed Issue: 크라프트 톤이 충분히 낮아지지 않았고 검은 인쇄 픽셀도 변함
- Suspected Cause: 이미지 저장 과정의 색공간 변환이 선택 영역 밖 픽셀에도 적용됨
- Next Action: 검정·흰색 픽셀을 완전히 잠그는 FFmpeg 선택 보정으로 재처리
- Retest ID: TEST-011

---

## TEST-009

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Swift 선택적 크라프트 톤 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-studio-v1-04.png`
- Previous Test: TEST-004

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 픽셀 좌표 이동 없이 색상만 보정함 |
| 외곽 실루엣·접힘 구조 | PASS | 형태 픽셀의 위치를 변경하지 않음 |
| 로고 | PASS | 로고 위치·형태가 유지됨 |
| 모든 한글 텍스트 | PASS | 모든 문구가 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 인쇄 요소의 좌표와 배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 변경 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254와 배치가 유지됨 |
| 배경 | PASS | 흰 배경이 유지됨 |
| 조명·노출·화이트밸런스 | PASS | 기존 마스터 조명각이 유지됨 |
| 그림자 | PASS | 기존 접지 그림자가 유지됨 |
| 크라프트 톤·표면 질감 | REVISE | 중앙색 `#D6BFAB`로 낮아졌지만 마스터 `#CCB39B`보다 여전히 밝음 |
| 생성 흔적·오염 | REVISE | 색공간 변환으로 검은 인쇄 픽셀에도 최대 20단계 변화가 확인됨 |

### 결과

- Status: REVISE
- Observed Issue: 크라프트 톤이 충분히 낮아지지 않았고 검은 인쇄 픽셀도 변함
- Suspected Cause: 이미지 저장 과정의 색공간 변환이 선택 영역 밖 픽셀에도 적용됨
- Next Action: 검정·흰색 픽셀을 완전히 잠그는 FFmpeg 선택 보정으로 재처리
- Retest ID: TEST-012

---

## TEST-010

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Swift 선택적 크라프트 톤 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-1000-1200-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-1000-1200-studio-v1-02.png`
- Previous Test: TEST-006

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 픽셀 좌표 이동 없이 색상만 보정함 |
| 외곽 실루엣·접힘 구조 | PASS | 형태 픽셀의 위치를 변경하지 않음 |
| 로고 | PASS | 로고 위치·형태가 유지됨 |
| 모든 한글 텍스트 | PASS | 모든 문구가 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 인쇄 요소의 좌표와 배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 변경 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254와 배치가 유지됨 |
| 배경 | PASS | 흰 배경이 유지됨 |
| 조명·노출·화이트밸런스 | PASS | 기존 마스터 조명각이 유지됨 |
| 그림자 | PASS | 기존 접지 그림자가 유지됨 |
| 크라프트 톤·표면 질감 | REVISE | 중앙색 `#D6C0AA`로 낮아졌지만 마스터 `#CCB39B`보다 여전히 밝음 |
| 생성 흔적·오염 | REVISE | 색공간 변환으로 검은 인쇄 픽셀에도 최대 20단계 변화가 확인됨 |

### 결과

- Status: REVISE
- Observed Issue: 크라프트 톤이 충분히 낮아지지 않았고 검은 인쇄 픽셀도 변함
- Suspected Cause: 이미지 저장 과정의 색공간 변환이 선택 영역 밖 픽셀에도 적용됨
- Next Action: 검정·흰색 픽셀을 완전히 잠그는 FFmpeg 선택 보정으로 재처리
- Retest ID: TEST-013

---

## TEST-011

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 선택적 RGB 크라프트 톤 보정
- Source Image: `products/with-wipes/original/with-wipes-individual-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-box-studio-v1-05.png`
- Previous Test: TEST-008

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 픽셀 좌표와 캔버스 크기를 변경하지 않음 |
| 외곽 실루엣·접힘 구조 | PASS | 원본 결과의 형태가 유지됨 |
| 로고 | PASS | 검은 픽셀 변경 0건으로 로고가 유지됨 |
| 모든 한글 텍스트 | PASS | 검은 픽셀 변경 0건으로 문구가 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 인쇄 요소의 좌표·형태·배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 변경 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254와 배치가 유지됨 |
| 배경 | PASS | 흰 배경 픽셀 변경 0건 |
| 조명·노출·화이트밸런스 | PASS | 조명 방향과 명암 구조를 유지함 |
| 그림자 | PASS | 접지 그림자를 유지함 |
| 크라프트 톤·표면 질감 | PASS | 중앙색 `#CCB39B`로 마스터와 일치함 |
| 생성 흔적·오염 | PASS | 선택 영역 밖 픽셀을 변경하지 않음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 색톤 통일 승인본으로 유지
- Retest ID: 없음

---

## TEST-012

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 선택적 RGB 크라프트 톤 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-studio-v1-06.png`
- Previous Test: TEST-009

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 픽셀 좌표와 캔버스 크기를 변경하지 않음 |
| 외곽 실루엣·접힘 구조 | PASS | 원본 결과의 형태가 유지됨 |
| 로고 | PASS | 검은 픽셀 변경 0건으로 로고가 유지됨 |
| 모든 한글 텍스트 | PASS | 검은 픽셀 변경 0건으로 문구가 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 인쇄 요소의 좌표·형태·배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 변경 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254와 배치가 유지됨 |
| 배경 | PASS | 흰 배경 픽셀 변경 0건 |
| 조명·노출·화이트밸런스 | PASS | 조명 방향과 명암 구조를 유지함 |
| 그림자 | PASS | 접지 그림자를 유지함 |
| 크라프트 톤·표면 질감 | PASS | 중앙색 `#CDB39C`로 마스터와 채널별 1단계 이내임 |
| 생성 흔적·오염 | PASS | 선택 영역 밖 픽셀을 변경하지 않음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 색톤 통일 승인본으로 유지
- Retest ID: 없음

---

## TEST-013

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 선택적 RGB 크라프트 톤 보정
- Source Image: `products/with-wipes/original/with-wipes-common-box-1000-1200-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-common-box-1000-1200-studio-v1-04.png`
- Previous Test: TEST-010

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 픽셀 좌표와 캔버스 크기를 변경하지 않음 |
| 외곽 실루엣·접힘 구조 | PASS | 원본 결과의 형태가 유지됨 |
| 로고 | PASS | 검은 픽셀 변경 0건으로 로고가 유지됨 |
| 모든 한글 텍스트 | PASS | 검은 픽셀 변경 0건으로 문구가 유지됨 |
| 글자 형태·인쇄 위치·레이아웃 | PASS | 인쇄 요소의 좌표·형태·배치가 유지됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 변경 없음 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254와 배치가 유지됨 |
| 배경 | PASS | 흰 배경 픽셀 변경 0건 |
| 조명·노출·화이트밸런스 | PASS | 조명 방향과 명암 구조를 유지함 |
| 그림자 | PASS | 접지 그림자를 유지함 |
| 크라프트 톤·표면 질감 | PASS | 중앙색 `#CEB49B`로 마스터와 채널별 2단계 이내임 |
| 생성 흔적·오염 | PASS | 선택 영역 밖 픽셀을 변경하지 않음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 색톤 통일 승인본으로 유지
- Retest ID: 없음

---

## TEST-014

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Built-in image generation tool, `compositing`
- Source Images: `products/with-wipes/original/with-wipes-bulk-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-bulk-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-bulk-coupang-composite-studio-v1-01.png`
- Failure Copy: `tests/failure/FAIL-TEST-014-with-wipes-bulk-coupang-composite.png`
- Authorized Composition Exception: 전경 물티슈 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·외곽 실루엣 | PASS | 가로형 박스 비율과 정면 형태가 유지됨 |
| 중앙 박스 로고 | PASS | `with 위드.물티슈` 전체가 가려지지 않음 |
| 우측 수량 문구 | PASS | `덕용 400매` 전체가 가려지지 않음 |
| 좌측 문구 가림 범위 | PASS | 허용된 `위생용품` 영역만 전경 제품이 가림 |
| 물티슈 로고·한글 텍스트 | FAIL | 확대 검사에서 작은 법정 표기의 글자 형태가 뭉개지거나 원본과 다르게 생성됨 |
| 인쇄 위치·디자인 레이아웃 | FAIL | 물티슈 포장 세부 문구가 생성형 처리로 재구성됨 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 두 제품 모두 거의 정면으로 배치됨 |
| 중앙 배치·여백·1:1 | PASS | 1254×1254 PNG와 충분한 여백을 충족함 |
| 배경·조명·화이트밸런스 | PASS | 순백 배경과 부드러운 하이키 확산광을 충족함 |
| 그림자 | PASS | 두 제품 아래에 옅은 접지 그림자가 적용됨 |
| 생성 흔적·오염 | FAIL | 물티슈의 작은 텍스트에 생성 흔적이 확인됨 |

### 결과

- Status: FAIL
- Observed Issue: 물티슈 포장 법정 표기의 정확한 문자 보존 실패
- Suspected Cause: 생성형 합성 과정에서 작은 텍스트를 다시 렌더링함
- Next Action: 원본 포장 이미지를 FFmpeg로 직접 축소·합성해 텍스트 재생성을 차단
- Retest ID: TEST-015

---

## TEST-015

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성
- Source Images: `products/with-wipes/original/with-wipes-bulk-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-bulk-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-bulk-coupang-composite-studio-v1-02.png`
- Failure Copy: `tests/failure/FAIL-TEST-015-with-wipes-bulk-coupang-composite.png`
- Authorized Composition Exception: 전경 물티슈 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·외곽 실루엣 | PASS | 박스 원본의 좌표·비율·형태를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 물티슈 오른쪽 끝을 중앙 로고 왼쪽에 제한함 |
| 우측 수량 문구 | PASS | 합성 영역 밖이라 원본 그대로 유지됨 |
| 물티슈 로고·모든 한글 텍스트 | PASS | 원본 포장 픽셀을 Lanczos 축소해 생성형 재작성 없음 |
| 좌측 문구 가림 | REVISE | 포장 몸체가 미세하게 반투명해 뒤쪽 `위생용품` 문구가 비쳐 보임 |

### 결과

- Status: REVISE
- Observed Issue: 전경 포장 몸체를 통해 가려야 할 박스 문구가 비침
- Suspected Cause: 포장 전체에 투명 비닐용 알파 마스크가 적용됨
- Next Action: 포장 몸체는 완전 불투명, 상단 투명 비닐은 기존 알파를 유지하도록 마스크 분리
- Retest ID: TEST-016

---

## TEST-016

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성 + 영역별 알파 마스크
- Source Images: `products/with-wipes/original/with-wipes-bulk-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-bulk-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-bulk-coupang-composite-studio-v1-03.png`
- Previous Test: TEST-015
- Authorized Composition Exception: 전경 물티슈 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 박스 원본의 1254×1254 캔버스와 모든 좌표를 유지함 |
| 외곽 실루엣·접힘 구조 | PASS | 합성 영역 밖 박스 픽셀을 변경하지 않음 |
| 중앙 박스 로고 | PASS | 중앙 로고 검사 영역의 원본·결과 MD5가 `3938430d0bf5b89e38dec5e39395e405`로 일치함 |
| 우측 `덕용 400매` | PASS | 우측 검사 영역의 원본·결과 MD5가 `05cfe498c67b2d4e8f6233c8d89a73f3`로 일치함 |
| 물티슈 로고·모든 한글 텍스트 | PASS | 원본 포장 픽셀을 직접 축소해 내용·행 구성·인쇄 배치를 유지함 |
| 좌측 문구 가림 범위 | PASS | `위생용품`은 불투명한 포장 몸체 뒤로 가려지고 중앙 로고는 침범하지 않음 |
| 새 요소 생성 여부 | PASS | 사용자 요청으로 승인된 원본 물티슈 제품 1개만 추가하고 임의 요소는 생성하지 않음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 박스와 물티슈 모두 정면 촬영각을 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG, 좌측 전경 배치, 충분한 외곽 여백을 충족함 |
| 배경 | PASS | 입력 이미지의 순백에 가까운 스튜디오 배경을 유지함 |
| 조명·노출·화이트밸런스 | PASS | 두 입력의 하이키 확산광과 중립 화이트밸런스를 유지함 |
| 그림자·접지 | PASS | 원본 접지 그림자를 유지해 두 제품이 같은 바닥면에 놓여 보임 |
| 크라프트 톤·표면 질감 | PASS | 입력 박스의 밝은 웜 베이지 크라프트 톤과 표면을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 1차 결과를 사용하지 않고 원본 픽셀 합성으로 마감함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 쿠팡 대표 합성 이미지 승인 후보로 사용
- Retest ID: 없음

---

## TEST-017

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성 + 영역별 알파 마스크
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-01.png`
- Failure Copy: `tests/failure/FAIL-TEST-017-with-wipes-individual-coupang-composite.png`
- Authorized Composition Exception: 전경 개별 포장 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·외곽 실루엣 | PASS | 박스 원본의 좌표·크기·형태를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 개별 포장 오른쪽 끝을 중앙 로고 왼쪽에 제한함 |
| 우측 수량 문구 | PASS | `400매 개별포장`이 전부 노출됨 |
| 개별 포장 로고·텍스트 | PASS | 원본 포장 픽셀을 직접 축소해 생성형 재작성 없음 |
| 하단 실링 마감 | REVISE | 알파 마스크가 과하게 제거되어 톱니 사이로 뒤 박스의 베이지색이 부자연스럽게 비침 |

### 결과

- Status: REVISE
- Observed Issue: 개별 포장 하단 톱니 실링의 베이지색 비침
- Suspected Cause: 포장 몸체 불투명 마스크가 하단 실링까지 충분히 덮지 못함
- Next Action: 하단 불투명 마스크를 16px 확장
- Retest ID: TEST-018

---

## TEST-018

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성 + 확장 알파 마스크
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-02.png`
- Failure Copy: `tests/failure/FAIL-TEST-018-with-wipes-individual-coupang-composite.png`
- Authorized Composition Exception: 전경 개별 포장 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·외곽 실루엣 | PASS | 박스 원본을 변경하지 않음 |
| 중앙 박스 로고·우측 문구 | PASS | 전경 제품이 두 인쇄 영역을 침범하지 않음 |
| 개별 포장 로고·텍스트 | PASS | 원본 포장 픽셀을 직접 축소함 |
| 하단 실링 마감 | REVISE | 톱니 틈이 박스 바닥선과 겹쳐 베이지색과 흰색이 교차해 보임 |

### 결과

- Status: REVISE
- Observed Issue: 포장 하단과 박스 바닥선의 시각적 충돌
- Suspected Cause: 두 제품의 바닥 좌표가 동일해 전후 관계가 모호함
- Next Action: 개별 포장을 15px 아래로 내려 앞쪽 바닥면에 놓인 관계를 명확히 함
- Retest ID: TEST-019

---

## TEST-019

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성 + 영역별 알파 마스크
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-03.png`
- Previous Test: TEST-018
- Authorized Composition Exception: 전경 개별 포장 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 입력 박스의 1254×1254 캔버스와 박스 좌표를 유지함 |
| 외곽 실루엣·접힘 구조 | PASS | 합성 영역 밖 박스 픽셀을 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 MD5가 `3d9288997075bfed292d186047170201`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 MD5가 `b1afad5b8902bd8bb45c4ce0504726e3`로 일치함 |
| 개별 포장 로고·모든 한글 텍스트 | PASS | 원본 포장 픽셀을 직접 축소해 내용·인쇄 배치를 유지함 |
| 좌측 문구 가림 범위 | PASS | 박스 `위생용품` 영역은 전경 제품 뒤로 가려지고 중앙 로고는 침범하지 않음 |
| 새 요소 생성 여부 | PASS | 사용자 요청으로 승인된 원본 개별 포장 제품 1개만 추가함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 박스와 개별 포장 모두 정면 촬영각을 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG, 좌측 전경 배치, 충분한 외곽 여백을 충족함 |
| 배경 | PASS | 순백에 가까운 기존 스튜디오 배경을 유지함 |
| 조명·노출·화이트밸런스 | PASS | 두 입력의 하이키 확산광과 중립 화이트밸런스를 유지함 |
| 그림자·접지 | PASS | 개별 포장을 박스보다 15px 아래에 두어 앞쪽 바닥면에 자연스럽게 접지함 |
| 크라프트 톤·표면 질감 | PASS | 입력 박스의 웜 베이지 크라프트 톤과 표면을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 원본 픽셀 합성만 사용해 글자 재생성 흔적이 없음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 개별 포장 쿠팡 대표 합성 이미지 승인 후보로 사용
- Retest ID: 없음

---

## TEST-020

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: 사용자 피드백 기반 확대 재검사
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-03.png`
- Failure Copy: `tests/failure/FAIL-TEST-020-with-wipes-individual-coupang-white-gap.png`
- Previous Test: TEST-019

### 결과

- Status: REVISE
- Observed Issue: 개별 포장 오른쪽 외곽과 박스 사이에 원본 배경이 포함된 얇은 흰 띠가 남음
- Suspected Cause: 불투명 몸체 마스크가 실제 제품 외곽보다 오른쪽으로 약 8px 넓음
- Next Action: 몸체 마스크 오른쪽 경계를 8px 축소
- Retest ID: TEST-021

---

## TEST-021

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성 + 축소 알파 마스크
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-04.png`
- Failure Copy: `tests/failure/FAIL-TEST-021-with-wipes-individual-coupang-white-gap.png`
- Previous Test: TEST-020

### 결과

- Status: REVISE
- Observed Issue: 불투명 마스크는 줄었지만 원본 배경의 반투명 픽셀이 외곽 밖에 남아 흰 띠가 지속됨
- Suspected Cause: 색상 키로 만든 알파가 제품 실제 오른쪽 끝 이후에도 6px가량 남음
- Next Action: 실제 제품 오른쪽 끝 이후의 알파 값을 0으로 강제
- Retest ID: TEST-022

---

## TEST-022

### 실행 정보

- Date: 2026-07-30
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 합성 + 외곽 알파 제한
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-05.png`
- Previous Test: TEST-021
- Authorized Composition Exception: 전경 개별 포장 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 입력 박스의 캔버스·크기·좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 MD5가 `3d9288997075bfed292d186047170201`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 MD5가 `b1afad5b8902bd8bb45c4ce0504726e3`로 일치함 |
| 개별 포장 로고·모든 한글 텍스트 | PASS | 원본 포장 픽셀을 직접 축소해 인쇄 내용을 유지함 |
| 포장·박스 경계 | PASS | 실제 포장 외곽 이후 알파를 제거해 흰 배경 띠 없이 박스 면이 바로 이어짐 |
| 새 요소 생성 여부 | PASS | 원본 개별 포장 제품 1개만 합성하고 임의 요소를 생성하지 않음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 두 제품의 정면 촬영각을 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG와 좌측 전경 배치를 유지함 |
| 배경·조명·화이트밸런스 | PASS | 기존 하이키 스튜디오 촬영 조건을 변경하지 않음 |
| 그림자·접지 | PASS | 개별 포장이 박스 앞 바닥면에 놓인 관계가 유지됨 |
| 크라프트 톤·표면 질감 | PASS | 박스 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 재작업 없이 경계 알파만 수술적으로 수정함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 흰 경계 제거 최종본으로 사용
- Retest ID: 없음

---

## TEST-023

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 보존 + 기하 알파 마스크
- Source Image: `products/with-wipes/original/with-wipes-individual-coupang-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png` 해시만 확인, 누끼 작업에는 촬영 스타일 미적용
- Prompt File: `prompts/MASTER_PROMPT.md` Active 상태 확인
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-01.png`
- Use Case: `background-extraction`

### 원본 보존·투명도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 제품 비율·실루엣 | PASS | 원본 제품 영역을 480×1080으로 타이트하게 자르고 폭·높이를 변형하지 않음 |
| 로고·한글 텍스트 | PASS | 내부 검사 영역의 원본·결과 RGB MD5가 `adaf21ec80c6fa748f378617d2902d90`로 일치함 |
| 상·하단 톱니 실링 | PASS | 기하 마스크로 톱니 외곽을 유지함 |
| 좌우 제품 외곽 | PASS | 제품 바깥 흰 배경을 제거하고 직선 외곽을 유지함 |
| 알파 채널 | PASS | 출력 픽셀 포맷이 `rgba`임 |
| 투명 모서리 | PASS | 좌상단 알파 값이 `0`임 |
| 불투명 제품 몸체 | PASS | 제품 중앙 알파 값이 `255`임 |
| 흰색 잔여 배경 | PASS | 보라색 진단 배경 합성에서 제품 외곽 밖 흰 띠가 확인되지 않음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 박스 합성 시 이 투명 PNG를 전경 제품 원본으로 사용
- Retest ID: 없음

---

## TEST-024

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 투명 PNG 원본 픽셀 합성 + 알파 기반 소프트 그림자
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-06.png`
- Previous Test: TEST-022
- Authorized Composition Exception: 전경 개별 포장 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 입력 박스의 1254×1254 캔버스·크기·좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 MD5가 `3d9288997075bfed292d186047170201`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 MD5가 `b1afad5b8902bd8bb45c4ce0504726e3`로 일치함 |
| 개별 포장 로고·모든 한글 텍스트 | PASS | TEST-023에서 승인한 투명 PNG 원본을 Lanczos 축소해 인쇄 내용을 유지함 |
| 제품·박스 경계 | PASS | 투명 알파를 직접 사용해 제품 외곽 밖 흰 배경 띠가 없음 |
| 새 요소 생성 여부 | PASS | 원본 개별 포장 제품과 알파 기반 소프트 그림자만 추가함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 박스와 개별 포장 모두 정면 촬영각을 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG와 좌측 전경 배치를 충족함 |
| 배경·조명·화이트밸런스 | PASS | 입력 이미지의 하이키 스튜디오 조건을 유지함 |
| 그림자·접지 | PASS | 투명 알파에서 만든 14% 소프트 그림자로 앞뒤 관계와 접지를 보완함 |
| 크라프트 톤·표면 질감 | PASS | 박스 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 처리 없이 승인된 투명 PNG를 직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 투명 PNG 기반 개별 포장 최종 합성본으로 사용
- Retest ID: 없음

---

## TEST-025

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: 사용자 피드백 기반 확대 재검사
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-01.png`
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-06.png`
- Failure Copy: `tests/failure/FAIL-TEST-025-with-wipes-individual-shadow-band.png`
- Previous Test: TEST-024

### 결과

- Status: REVISE
- Observed Issue: 개별 포장 오른쪽에 세로로 번진 밝은 회색 띠가 확인됨
- Suspected Cause: 접지감을 위해 추가한 14% 소프트 그림자가 오른쪽으로 확산됨
- Next Action: 인공 그림자 레이어를 완전히 제거하고 투명 PNG만 직접 합성
- Retest ID: TEST-026

---

## TEST-026

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-01.png`
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-07.png`
- Failure Copy: `tests/failure/FAIL-TEST-026-with-wipes-individual-source-edge-band.png`
- Previous Test: TEST-025

### 결과

- Status: REVISE
- Observed Issue: 인공 그림자 제거 후에도 제품 오른쪽에 약 4–6px의 세로선이 남음
- Suspected Cause: 누끼 PNG 안에 원본 사진의 오른쪽 그림자·배경 픽셀이 포함됨
- Next Action: 투명 PNG의 오른쪽 알파 경계를 원본 기준 10px 안쪽으로 재설정 후 다시 합성
- Retest ID: TEST-027

---

## TEST-027

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 수정 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-02.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-studio-v1-08.png`
- Previous Test: TEST-026
- Authorized Composition Exception: 전경 개별 포장 제품 추가와 박스 좌측 `위생용품` 문구 가림은 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 입력 박스의 1254×1254 캔버스·크기·좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 MD5가 `3d9288997075bfed292d186047170201`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 MD5가 `b1afad5b8902bd8bb45c4ce0504726e3`로 일치함 |
| 개별 포장 로고·모든 한글 텍스트 | PASS | 원본 픽셀을 유지한 수정 투명 PNG를 사용함 |
| 제품·박스 경계 | PASS | 인공 그림자와 원본 사진의 잔여 오른쪽 그림자를 모두 제거해 세로 띠가 없음 |
| 새 요소 생성 여부 | PASS | 수정 투명 PNG 제품 1개만 직접 합성함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 두 제품의 정면 촬영각을 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG와 좌측 전경 배치를 유지함 |
| 배경·조명·화이트밸런스 | PASS | 입력 이미지의 하이키 스튜디오 조건을 변경하지 않음 |
| 그림자·접지 | PASS | 별도 그림자를 생성하지 않고 원본 바닥선 관계만 사용함 |
| 크라프트 톤·표면 질감 | PASS | 박스 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 처리 없이 투명 알파 경계만 수술적으로 수정함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 그림자·흰 세로 띠 제거 최종본으로 사용
- Retest ID: 없음

---

## TEST-028

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 보존 + 기하 알파 마스크
- Source Image: `products/with-wipes/original/with-wipes-individual-plain-pack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png` 해시만 확인, 누끼 작업에는 촬영 스타일 미적용
- Prompt File: `prompts/MASTER_PROMPT.md` Active 상태 확인
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-plain-pack-cutout-v1-01.png`
- Use Case: `background-extraction`

### 원본 보존·투명도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 제품 비율·실루엣 | PASS | 원본 제품 영역을 950×440으로 자르고 회전·비율 변경 없이 유지함 |
| 로고·한글 텍스트 | PASS | 내부 검사 영역의 원본·결과 RGB MD5가 `5ab86d579eb0b500b856605645ef48fb`로 일치함 |
| 좌우 톱니 실링 | PASS | 기하 알파 마스크로 톱니 외곽을 유지함 |
| 원본 외곽 그림자 | PASS | 제품 바깥 오른쪽·하단 그림자를 알파 영역에서 제외함 |
| 알파 채널 | PASS | 출력 픽셀 포맷이 `rgba`임 |
| 투명 모서리 | PASS | 좌상단 알파 값이 `0`임 |
| 불투명 제품 몸체 | PASS | 제품 중앙 알파 값이 `255`임 |
| 흰색·회색 잔여 띠 | PASS | 보라색 진단 배경에서 외곽 밖 잔여 띠가 확인되지 않음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 가로형 무지 개별 포장 합성 원본으로 사용
- Retest ID: 없음

---

## TEST-029

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-plain-pack-cutout-v1-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-plain-coupang-composite-studio-v1-01.png`
- Authorized Composition Exception: 전경 가로형 무지 개별 포장 제품 추가는 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS | 입력 박스의 1254×1254 캔버스·크기·좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 MD5가 `3d9288997075bfed292d186047170201`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 MD5가 `b1afad5b8902bd8bb45c4ce0504726e3`로 일치함 |
| 가로형 제품 한글 텍스트 | PASS | TEST-028에서 승인한 원본 픽셀 투명 PNG를 사용함 |
| 제품·박스 경계 | PASS | 제품 외곽 다음 픽셀부터 박스 또는 스튜디오 배경이 바로 이어짐 |
| 새 요소 생성 여부 | PASS | 원본 가로형 제품 1개만 추가하고 그림자·후광을 생성하지 않음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 박스와 제품의 정면 촬영각을 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG에 가로형 제품을 좌측 하단 전경으로 배치함 |
| 중앙 로고·수량 문구 가림 | PASS | 제품을 중앙 로고 아래쪽으로 분리해 두 잠금 영역을 가리지 않음 |
| 배경·조명·화이트밸런스 | PASS | 입력 이미지의 하이키 스튜디오 조건을 변경하지 않음 |
| 그림자·접지 | PASS | 별도 그림자 없이 제품 하단을 박스 바닥선보다 5px 아래에 배치함 |
| 크라프트 톤·표면 질감 | PASS | 박스 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 처리 없이 투명 PNG를 직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 가로형 무지 개별 포장 최종 합성본으로 사용
- Retest ID: 없음

---

## TEST-030

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-plain-pack-cutout-v1-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-plain-coupang-composite-studio-v1-02.png`
- Authorized Composition Exception: TEST-029의 가로형 무지 개별 포장을 사용자 승인에 따라 약 15% 확대

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·크기·좌표 | PASS | 입력 박스의 1254×1254 캔버스와 원본 픽셀 좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 RGB MD5가 `fbdd9f1d2a8c5f15dd25e641c99a7da9`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 RGB MD5가 `ff4c77a978c8c9552fa57690c6314339`로 일치함 |
| 가로형 제품 한글 텍스트 | PASS | TEST-028에서 승인한 투명 PNG를 비율 고정해 확대함 |
| 제품 비율 | PASS | 950×440 원본 비율을 유지해 500×232로 확대함 |
| 제품 외곽 | PASS | 투명 PNG를 직접 합성해 흰색·회색 잔여 배경과 후광이 없음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 배치·시인성 | PASS | 제품을 좌측 하단에 500×232px로 배치해 TEST-029보다 약 15% 크게 보임 |
| 중앙 로고·수량 문구 가림 | PASS | 두 잠금 영역 모두 가리지 않음 |
| 배경·조명·화이트밸런스 | PASS | 박스와 배경 원본 픽셀을 변경하지 않음 |
| 그림자·접지 | PASS | 별도 그림자 없이 기존 하단 기준선을 유지함 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 원본 투명 제품 픽셀만 확대·합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 15% 확대본을 최종 합성본으로 사용
- Retest ID: 없음

---

## TEST-031

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 픽셀 보존 + 기하 알파 마스크
- Source Image: `products/with-wipes/original/with-wipes-dry-tissue-sheet-stack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png` 해시만 확인, 누끼 작업에는 촬영 스타일 미적용
- Prompt File: `prompts/MASTER_PROMPT.md` Active 상태 확인
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-dry-tissue-sheet-stack-cutout-v1-01.png`
- Use Case: `background-extraction`

### 원본 보존·투명도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 제품 비율·실루엣 | PASS | 원본 제품 영역을 960×660으로 자르고 회전·비율 변경 없이 유지함 |
| 건티슈 표면·적층 질감 | PASS | 내부 검사 영역의 원본·결과 RGB MD5가 `bdfb4f32e71939c93edd7d68d6a32f74`로 일치함 |
| 알파 채널 | PASS | 출력 픽셀 포맷이 `rgba`임 |
| 투명 모서리 | PASS | 좌상단 알파 값이 `0`임 |
| 불투명 제품 몸체 | PASS | 제품 중앙 알파 값이 `255`임 |
| 원본 배경·그림자 제거 | PASS | 제품의 여섯 외곽면을 따라 기하 마스크를 적용함 |
| 흰색·회색 잔여 띠 | PASS | 보라색 진단 배경에서 외곽 밖 잔여 띠가 확인되지 않음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 건티슈 박스 합성 원본으로 사용
- Retest ID: 없음

---

## TEST-032

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-dry-tissue-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-dry-tissue-sheet-stack-cutout-v1-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-dry-tissue-coupang-composite-studio-v1-01.png`
- Authorized Composition Exception: 전경 건티슈 낱장 제품 추가는 사용자 요청에 따른 허용 변경

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·크기·좌표 | PASS | 입력 박스의 1254×1254 캔버스와 원본 픽셀 좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 RGB MD5가 `86e889562a7b6d5e6406b8778eaee3e4`로 일치함 |
| 건티슈 실루엣·질감 | PASS | TEST-031에서 승인한 원본 픽셀 투명 PNG를 사용함 |
| 제품 비율 | PASS | 960×660 원본 비율을 유지해 520×358로 축소함 |
| 제품·박스 경계 | PASS | 제품 외곽 다음 픽셀부터 박스 또는 스튜디오 배경이 바로 이어짐 |
| 새 요소 생성 여부 | PASS | 원본 건티슈 1개만 추가하고 별도 그림자·후광을 생성하지 않음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS | 박스 정면과 건티슈의 원본 사선 촬영각을 그대로 유지함 |
| 배치·여백·1:1 | PASS | 1254×1254 PNG에 건티슈를 좌측 하단 전경으로 배치함 |
| 중앙 로고 가림 | PASS | 건티슈 상단이 중앙 로고 아래에 위치해 로고를 가리지 않음 |
| 배경·조명·화이트밸런스 | PASS | 박스와 배경 원본 픽셀을 변경하지 않음 |
| 그림자·접지 | PASS | 별도 그림자 없이 건티슈 하단을 박스 바닥선 아래에 배치함 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 투명 PNG를 직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 건티슈 박스+낱장 최종 합성본으로 사용
- Retest ID: 없음

---

## TEST-033

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 투명 PNG 회전·합성
- Source Images: `products/with-wipes/original/with-wipes-dry-tissue-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-dry-tissue-sheet-stack-cutout-v1-02.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Failure Copy: `tests/failure/FAIL-TEST-033-with-wipes-dry-tissue-logo-overlap.png`

### 결과

- Status: FAIL
- Observed Issue: 정면 보정한 건티슈를 520×299px로 배치하면서 중앙 로고 하단 일부가 가려짐
- Suspected Cause: 제품 높이와 Y 좌표가 중앙 로고 잠금 영역을 침범함
- Next Action: 제품을 축소하고 아래로 이동하되 바닥 접지는 유지
- Retest ID: TEST-034

---

## TEST-034

### 실행 정보

- Date: 2026-07-31
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 원본 투명 PNG 회전·직접 합성
- Source Images: `products/with-wipes/original/with-wipes-dry-tissue-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-dry-tissue-sheet-stack-cutout-v1-02.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-dry-tissue-coupang-composite-studio-v1-03.png`
- Authorized Composition Exception: 사용자 요청에 따라 건티슈 앞면을 수평 정렬하고 제품 아래에만 얕은 접지 그림자를 추가함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·크기·좌표 | PASS | 입력 박스의 1254×1254 캔버스와 원본 픽셀 좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 RGB MD5가 `86e889562a7b6d5e6406b8778eaee3e4`로 일치함 |
| 건티슈 표면·적층 질감 | PASS | TEST-031의 원본 픽셀 누끼를 생성형 재구성 없이 회전함 |
| 제품 정면 정렬 | PASS | 제품을 반시계 방향 10.45도로 회전해 앞면의 상·하단 선을 수평으로 맞춤 |
| 제품 비율 | PASS | 회전 후 910×524 투명 PNG를 470×271로 비율 고정 축소함 |
| 제품 외곽 | PASS | 투명 PNG를 직접 합성해 흰색·회색 잔여 배경과 외곽 후광이 없음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 배치·시인성 | PASS | 정면 정렬한 건티슈를 좌측 하단 전경에 배치함 |
| 중앙 로고 가림 | PASS | TEST-033보다 제품을 축소·하향 이동해 중앙 로고 잠금 영역을 침범하지 않음 |
| 바닥 접지 | PASS | 제품 하단을 박스 바닥선과 맞추고 제품 아래쪽에만 16% 농도의 얕은 접지 그림자를 적용함 |
| 배경·조명·화이트밸런스 | PASS | 접지 그림자 이외의 박스와 배경 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 원본 누끼의 회전·축소·직접 합성만 수행함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 정면·접지 보정본을 최종 합성본으로 사용
- Retest ID: 없음

---

## TEST-035

### 실행 정보

- Date: 2026-08-01
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 승인 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-02.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-right-studio-v1-01.png`
- Authorized Composition Exception: 사용자 요청에 따라 개별 포장 물티슈를 박스 우측 전경에 배치하고 제품 아래에만 얕은 접지 그림자를 추가함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·크기·좌표 | PASS | 입력 박스의 1254×1254 캔버스와 원본 픽셀 좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 RGB MD5가 `fbdd9f1d2a8c5f15dd25e641c99a7da9`로 일치함 |
| 우측 `400매 개별포장` | PASS | 검사 영역의 원본·결과 RGB MD5가 `b690382f0501f41c744818c764ab43d2`로 일치함 |
| 좌상단 `위생용품` | PASS | 검사 영역의 원본·결과 RGB MD5가 `5555a0608316cbca85fcad59b5c65cde`로 일치함 |
| 개별 포장 로고·한글 텍스트 | PASS | 기존 승인된 원본 픽셀 투명 PNG를 사용함 |
| 제품 비율 | PASS | 480×1080 원본 비율을 유지해 235×529로 축소함 |
| 제품 외곽 | PASS | 투명 PNG를 직접 합성해 흰색·회색 잔여 배경과 외곽 후광이 없음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 우측 배치 | PASS | 개별 포장을 박스 오른쪽 가장자리와 살짝 겹치는 전경에 세워 배치함 |
| 핵심 문구 가림 | PASS | 중앙 로고와 `400매 개별포장`을 모두 가리지 않음 |
| 바닥 접지 | PASS | 제품 하단에만 14% 농도의 얕은 접지 그림자를 적용함 |
| 배경·조명·화이트밸런스 | PASS | 접지 그림자 이외의 박스와 배경 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 승인된 투명 PNG를 축소·직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 우측 배치 합성본을 최종본으로 사용
- Retest ID: 없음

---

## TEST-036

### 실행 정보

- Date: 2026-08-01
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 승인 투명 PNG 직접 합성
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-02.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-coupang-composite-right-studio-v1-02.png`
- Authorized Composition Exception: 사용자 요청에 따라 개별 포장 물티슈가 박스 우측 `400매 개별포장` 문구를 대부분 가리도록 배치함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·크기·좌표 | PASS | 입력 박스의 1254×1254 캔버스와 원본 픽셀 좌표를 변경하지 않음 |
| 중앙 박스 로고 | PASS | 검사 영역의 원본·결과 RGB MD5가 `fbdd9f1d2a8c5f15dd25e641c99a7da9`로 일치함 |
| 좌상단 `위생용품` | PASS | 검사 영역의 원본·결과 RGB MD5가 `5555a0608316cbca85fcad59b5c65cde`로 일치함 |
| 우측 `400매 개별포장` | PASS (승인 예외) | 사용자가 문구가 잘 보이지 않도록 요청해 개별 포장으로 의도적으로 대부분 가림 |
| 개별 포장 로고·한글 텍스트 | PASS | 기존 승인된 원본 픽셀 투명 PNG를 사용함 |
| 제품 비율 | PASS | 480×1080 원본 비율을 유지해 280×630으로 축소함 |
| 제품 외곽 | PASS | 투명 PNG를 직접 합성해 흰색·회색 잔여 배경과 외곽 후광이 없음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 우측 중첩 배치 | PASS | 개별 포장을 박스 우측 전경으로 옮겨 수량 문구를 가림 |
| 중앙 로고 가림 | PASS | 제품 왼쪽 경계가 중앙 로고 오른쪽에 위치해 중앙 로고를 가리지 않음 |
| 바닥 접지 | PASS | 제품 하단에만 14% 농도의 얕은 접지 그림자를 적용함 |
| 배경·조명·화이트밸런스 | PASS | 승인된 중첩·접지 그림자 이외의 박스와 배경 원본 픽셀을 변경하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 승인된 투명 PNG를 축소·직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 수량 문구 중첩 우측 배치본을 최종본으로 사용
- Retest ID: 없음

---

## TEST-037

### 실행 정보

- Date: 2026-08-01
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 승인 투명 PNG 직접 합성 + 캔버스 크롭·균일 확대
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/output/with-wipes-individual-pack-cutout-v1-02.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-main-box-product-studio-v1-01.png`
- Authorized Composition Exception: 사용자 승인에 따라 제품을 확대하고 박스+상품 영역을 캔버스 가로 폭의 약 80%로 맞춰 중앙 정렬함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율 | PASS | 박스와 전체 캔버스를 동일 비율로 균일 확대해 폭/높이 관계를 유지함 |
| 중앙 박스 로고 | PASS | 동일 변환을 적용한 박스 기준본과 결과의 검사 영역 RGB MD5가 `fb04e005898200dc33cae4ec74db5a18`로 일치함 |
| 개별 포장 로고·한글 텍스트 | PASS | 기존 승인된 원본 픽셀 투명 PNG를 사용함 |
| 제품 비율 | PASS | 480×1080 원본 비율을 유지해 320×720으로 축소한 뒤 전체를 균일 확대함 |
| 우측 `400매 개별포장` | PASS (승인 예외) | 개별 포장으로 의도적으로 대부분 가림 |
| 제품 외곽 | PASS | 투명 PNG를 직접 합성해 흰색·회색 잔여 배경과 외곽 후광이 없음 |

### 촬영 스타일·구도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스+상품 점유율 | PASS | 합성 전 결합 영역 950px을 1.0556배 확대해 최종 가로 폭 약 1003px, 캔버스의 약 80%로 맞춤 |
| 중앙 정렬 | PASS | 결합 영역의 최종 X 범위가 약 126~1128px로 중심 X=627px에 정렬됨 |
| 제품 크기 | PASS | TEST-036보다 개별 포장을 확대해 상품 시인성을 높임 |
| 바닥 접지 | PASS | 제품 하단에만 14% 농도의 얕은 접지 그림자를 적용함 |
| 배경·조명·화이트밸런스 | PASS | 전체 캔버스를 동일 변환하고 추가 색 보정을 하지 않음 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 승인된 투명 PNG를 직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 새 네이밍 규칙의 개별 대표이미지 최종본으로 사용
- Retest ID: 없음

---

## TEST-038

### 실행 정보

- Date: 2026-08-01
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: FFmpeg 승인 투명 PNG 직접 합성 + 쿠팡 대표이미지 프리셋
- Source Images: `products/with-wipes/original/with-wipes-individual-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-individual-product-original-02.png`
- Derived Cutout: `products/with-wipes/output/with-wipes-individual-product-cutout-v1-03.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt Files: `prompts/MASTER_PROMPT.md`, `prompts/COUPANG_MAIN_PRESET.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-main-box-product-studio-v1-02.png`
- Authorized Composition Exception: 사용자 승인에 따라 상품을 박스 우측 전경에 겹치고 `400매 개별포장` 표기를 대부분 가림

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율 | PASS | 승인된 TEST-037과 동일한 박스 변환값을 사용해 폭/높이 관계를 유지함 |
| 중앙 박스 로고 | PASS | TEST-037 최종본과 중앙 검사 영역 RGB MD5가 `ba3eae65b8b21a45591449bc424cb528`로 일치함 |
| 개별 포장 로고·한글 텍스트 | PASS | 새 원본의 실제 픽셀을 투명 PNG로 분리해 직접 합성함 |
| 제품 비율 | PASS | 480×1080 컷아웃을 320×720으로 비례 축소한 뒤 전체를 균일 확대함 |
| 우측 `400매 개별포장` | PASS (승인 예외) | 개별 포장으로 의도적으로 대부분 가림 |
| 제품 외곽 | PASS | 실제 알파 채널을 사용해 흰색·회색 잔여 배경과 외곽 후광이 없음 |

### 촬영 스타일·구도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스+상품 점유율 | PASS | 결합 영역 최종 가로 폭 약 1003px로 캔버스의 약 80%를 차지함 |
| 중앙 정렬 | PASS | 결합 영역의 최종 X 범위가 약 126~1128px로 중심 X=627px에 정렬됨 |
| 우측 배치 | PASS | 상품을 박스 우측 전경에 배치하고 중앙 로고는 침범하지 않음 |
| 바닥 접지 | PASS | 상품 하단에만 얕은 접지 그림자를 적용해 떠 보이지 않음 |
| 배경·조명·화이트밸런스 | PASS | 박스와 상품에 동일한 스튜디오 톤을 유지하고 추가 색 왜곡이 없음 |
| 생성 흔적·오염 | PASS | 생성형 재구성 없이 원본 픽셀을 직접 합성함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: `쿠팡 대표이미지 만들어줘` 요청의 개별 상품 기준 결과물로 사용
- Retest ID: 없음

---

## TEST-039

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, 2-pass style transfer and preservation repair
- Source Image: `products/with-wipes/original/with-wipes-individual-detail-product-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md` 기준을 파우치 플랫레이 보정에 맞게 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-01.png`
- Composition Exception: 박스 정면 촬영 기준 대신 원본의 탑뷰 대각선 플랫레이 구도와 가장자리 크롭을 그대로 유지함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 파우치 수·비율·실루엣 | PASS | 원본과 동일한 9개 파우치 및 부분 노출 개수, 폭·높이 관계, 외곽 형태를 유지함 |
| 배열·회전·크롭 | PASS | 대각선 배열, 간격, 회전 방향, 캔버스 가장자리에서 잘리는 위치를 원본과 동일하게 유지함 |
| 접힘·실링 구조 | PASS | 파우치 주름, 상하 실링, 미세 격자와 톱니형 절단선을 확대 대조해 유지됨을 확인함 |
| 로고·포인트 색상 | PASS | 검정 `with` 로고와 파란 사각 포인트의 형태·위치·방향을 유지함 |
| 한글·규격 문구 | PASS | `위생 물티슈`와 작은 규격 문구의 내용·위치·방향을 확대 대조해 유지됨을 확인함 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품·문구·소품의 추가나 누락이 없음 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 배경 | PASS | 기존의 차가운 회색 질감 배경을 경계·소품·반사 없는 순백에 가까운 심리스 배경으로 보정함 |
| 조명·화이트밸런스 | PASS | 부드러운 하이키 확산광과 중립적인 화이트밸런스를 적용하고 은색 파우치의 하이라이트를 억제함 |
| 그림자 | PASS | 파우치 바로 아래의 짧고 옅은 접지 그림자만 유지함 |
| 색상 보존 | PASS | 마스터 레퍼런스의 크라프트 베이지는 적용하지 않고 원본의 은백색 포장과 검정·파랑 인쇄색을 유지함 |
| 생성 흔적·오염 | PASS | 2차 보존 보정 후 텍스트 주변, 실링 가장자리, 배경에서 눈에 띄는 생성 흔적이 없음 |

### 결과

- Status: PASS
- Observed Issue: 1차 생성에서 작은 인쇄 문구가 흐려져 2차 보존 보정을 수행함
- Suspected Cause: 배경·조명 스타일 전이 과정에서 작은 인쇄 영역의 디테일이 함께 평활화됨
- Next Action: 2차 보존 보정본을 최종 상세 이미지로 사용
- Retest ID: 없음

---

## TEST-040

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, natural-light atmosphere edit
- Source Images: `products/with-wipes/original/with-wipes-individual-detail-product-original-01.png`, `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 사용자 승인 감성 자연광 방향 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-02.png`
- Authorized Style Exception: 순백·균일광 대신 따뜻한 아이보리 배경, 좌상단 자연광의 완만한 노출 변화와 방향성 있는 접지 그림자를 적용함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 파우치 수·비율·실루엣 | PASS | 9개 파우치와 부분 노출 개수, 폭·높이 관계, 외곽 형태를 유지함 |
| 배열·회전·크롭 | PASS | 대각선 배열, 간격, 회전, 네 변의 크롭 위치를 이전 보정본과 동일하게 유지함 |
| 접힘·실링 구조 | PASS | 파우치 주름, 상하 실링, 격자와 톱니형 절단선이 유지됨 |
| 로고·포인트 색상 | PASS | 검정 `with` 로고와 파란 사각 포인트의 형태·위치·방향을 유지함 |
| 한글·규격 문구 | PASS | `위생 물티슈`와 작은 규격 문구의 내용·위치·방향을 유지함 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품이나 소품의 추가·누락 없이 촬영 환경만 조정함 |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 배경 | PASS | 순백보다 따뜻한 아이보리 무광 표면과 미세한 자연 질감을 적용함 |
| 자연광 | PASS | 좌상단에서 우하단으로 완만하게 흐르는 확산 자연광과 노출 변화를 적용함 |
| 그림자·공간감 | PASS | 모든 파우치에 동일한 광원 방향의 짧고 부드러운 우하단 접지 그림자를 적용해 배경과 제품을 연결함 |
| 색상 보존 | PASS | 배경은 따뜻하게 조정하되 파우치는 은백색, 인쇄는 검정·파랑으로 유지함 |
| 생성 흔적·오염 | PASS | 텍스트·실링 가장자리와 배경에서 눈에 띄는 생성 흔적이 없음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 감성 자연광 버전을 최종 후보로 사용
- Retest ID: 없음

---

## TEST-042

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, 박스+건티슈 합성 및 2-pass 그림자 제거
- Source Images: `products/with-wipes/original/with-wipes-dry-tissue-coupang-box-original-01.png`, `products/with-wipes/original/with-wipes-dry-tissue-sheet-stack-original-01.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`, `prompts/COUPANG_MAIN_PRESET.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-dry-tissue-main-box-product-studio-v1-01.png`
- Previous Test: TEST-034
- User Approval: 사용자가 제공한 최종 후보 파일을 변경 없이 승인함
- Authorized Background Exception: 제품 외부 그림자와 눈에 띄는 음영은 없으나 배경 픽셀은 RGB 253~255 범위임. 사용자가 해당 파일 그대로 사용하도록 명시 승인함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·실루엣·접힘 구조 | PASS | 원본의 정면 박스 비율, 상단 면, 좌우 모서리와 접힘 구조가 유지됨 |
| 중앙 박스 로고 | PASS | `with 위드.건티슈` 로고의 형태·색상·위치가 유지되고 전경 제품이 가리지 않음 |
| 모든 한글 텍스트 | PASS | `위드.건티슈`가 마침표를 포함해 원문대로 확인됨 |
| 건티슈 비율·실루엣 | PASS | 가로로 긴 적층 비율, 두께, 외곽 형태와 정면 수평 정렬이 유지됨 |
| 건티슈 표면·적층 질감 | PASS | 흰색 적층 구조와 가로 결이 유지되고 사각형 잔여 배경이나 후광이 없음 |
| 새 요소 생성·기존 요소 누락 | PASS | 박스와 건티슈 외의 소품·문구가 추가되거나 기존 요소가 누락되지 않음 |

### 촬영 스타일·구도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 RGB PNG로 저장함 |
| 박스+상품 점유율 | PASS | 결합 영역 가로 폭 약 1021px로 캔버스의 약 81.4%를 차지해 약 80% 기준에 들어옴 |
| 중앙 정렬 | PASS | 결합 영역 중심이 캔버스 중심에서 약 15px 이내이며 시각적으로 중앙 정렬됨 |
| 우측 배치·로고 시인성 | PASS | 건티슈를 박스 우측 전경에 배치하고 중앙 로고 전체를 노출함 |
| 그림자·음영 | PASS | 박스와 건티슈 외부에 눈에 띄는 접지 그림자·투영 그림자·바닥선이 없음 |
| 배경 | PASS (승인 예외) | 배경은 시각적으로 균일한 순백이며 측정값 RGB 253~255 편차를 사용자가 승인함 |
| 박스 색상·표면 | PASS | 밝고 중립적인 웜 베이지 크라프트 톤과 미세한 무광 표면 질감이 유지됨 |
| 생성 흔적·오염 | PASS | 제품 외곽, 텍스트 주변과 배경에서 눈에 띄는 생성 흔적·오염이 없음 |

### 결과

- Status: PASS
- Observed Issue: 배경이 수치상 완전한 단색 `#FFFFFF`는 아니지만 눈에 띄는 그림자·음영이 없고 사용자가 결과 파일을 명시 승인함
- Suspected Cause: 생성형 이미지 출력에서 순백 배경에 RGB 2 이내의 미세한 톤 편차가 남음
- Next Action: 승인된 파일을 건티슈 쿠팡 대표이미지 최종본으로 사용
- Retest ID: 없음

---

## TEST-041

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, shadow and packaging-surface refinement
- Source Images: `products/with-wipes/original/with-wipes-individual-detail-product-original-01.png`, `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-02.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 사용자 요청 음영·주름 완화 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-03.png`
- Authorized Surface Exception: 포장 구조는 유지하면서 본체의 큰 눌림과 깊은 구김만 완화하고 미세 굴곡은 재질감으로 남김

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 파우치 수·비율·실루엣 | PASS | 9개 파우치와 부분 노출 개수, 폭·높이 관계, 외곽 형태를 유지함 |
| 배열·회전·크롭 | PASS | 대각선 배열, 간격, 회전과 네 변의 크롭 위치를 유지함 |
| 실링 구조 | PASS | 상하 실링, 격자와 톱니형 절단선의 형태와 위치를 유지함 |
| 로고·포인트 색상 | PASS | 검정 `with` 로고와 파란 사각 포인트의 형태·위치·방향을 유지함 |
| 한글·규격 문구 | PASS | `위생 물티슈`와 작은 규격 문구의 내용·위치·방향을 유지함 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품이나 소품의 추가·누락 없이 표면과 음영만 조정함 |

### 촬영 스타일·표면

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 배경·자연광 | PASS | 따뜻한 아이보리 무광 배경과 좌상단 확산 자연광을 유지함 |
| 그림자 | PASS | 우하단 방향은 유지하면서 농도를 낮추고 바깥쪽 경계를 넓고 부드럽게 풀어냄 |
| 접지감 | PASS | 제품 바로 아래의 옅은 접지선을 남겨 파우치가 뜨지 않게 함 |
| 포장지 주름 | PASS | 본체의 큰 눌림과 깊은 구김은 완화하고 가장자리·실링 주변의 미세 굴곡은 남김 |
| 재질 자연스러움 | PASS | 완전한 평면이나 플라스틱 렌더처럼 보이지 않고 유연한 포장재의 낮은 굴곡과 미세 질감을 유지함 |
| 생성 흔적·오염 | PASS | 텍스트·실링 가장자리와 배경에서 눈에 띄는 생성 흔적이 없음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 음영과 포장 표면을 정리한 `-03` 버전을 최종 후보로 사용
- Retest ID: 없음

---

## TEST-043

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, user tone-reference style transfer
- Source Images: `products/with-wipes/original/with-wipes-individual-detail-product-original-01.png`, `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-03.png`
- Style Reference: `/Users/mgrv/work/with-wipes/images/대표이미지/대표이미지/개별.png`
- Master Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 사용자 제공 톤 레퍼런스 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-detail-product-studio-v1-04.png`
- Previous Test: TEST-041
- Authorized Tone Exception: 마스터의 박스 크라프트 톤 대신 사용자 제공 개별 파우치 사진의 중립 화이트 배경·저대비 음영을 우선 적용함

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 파우치 수·비율·실루엣 | PASS | 9개 파우치와 부분 노출 개수, 폭·높이 관계, 외곽 형태를 유지함 |
| 배열·회전·크롭 | PASS | 대각선 배열, 간격, 회전과 네 변의 크롭 위치를 유지함 |
| 실링 구조 | PASS | 상하 실링, 격자와 톱니형 절단선의 형태와 위치를 유지함 |
| 로고·포인트 색상 | PASS | 검정 `with` 로고와 파란 사각 포인트의 형태·위치·방향을 유지함 |
| 한글·규격 문구 | PASS | `위생 물티슈`와 작은 규격 문구의 내용·위치·방향을 유지함 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품이나 소품의 추가·누락 없이 톤과 촬영 환경만 조정함 |

### 촬영 스타일·톤

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 배경 | PASS | 크림색과 표면 질감을 제거하고 레퍼런스처럼 거의 순백인 중립 화이트 심리스 배경으로 조정함 |
| 조명·화이트밸런스 | PASS | 밝은 정면 확산광, 낮은 대비와 중립적인 화이트밸런스를 적용함 |
| 그림자 | PASS | 레퍼런스와 유사한 짧고 옅은 중립 회색 접지 그림자만 남김 |
| 포장지 재질 | PASS | 밝은 백색 반무광 포장 톤과 자연스러운 미세 굴곡을 유지하고 큰 구김은 억제함 |
| 제품·배경 분리 | PASS | 흰색 제품과 흰색 배경 사이에 얕은 명암차와 접지선이 남아 외곽이 소실되지 않음 |
| 생성 흔적·오염 | PASS | 텍스트·실링 가장자리와 배경에서 눈에 띄는 생성 흔적이 없음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- Next Action: 사용자 제공 개별 파우치 톤과 맞춘 `-04` 버전을 최종 후보로 사용
- Retest ID: 없음

---

## TEST-044

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, product-mockup edit
- Source Images: `references/MASTER_REFERENCE_v1.png`, `products/with-wipes/original/with-wipes-mini-box-original-01.png`, `products/with-wipes/output/with-wipes-common-box-studio-v1-06.png`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 기존 박스 결과물의 정면 스튜디오 구도 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-mini-box-studio-v1-02.png`
- Previous Draft: `products/with-wipes/output/with-wipes-mini-box-studio-v1-01.png`

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·실루엣 | PASS | 원본의 가로로 길고 낮은 폭·높이 관계와 전면 외곽 형태를 유지함 |
| 접힘 구조·모서리 | PASS | 상단 덮개, 전면 경계, 좌우 모서리와 하단 접지 형태를 유지함 |
| 포장 테이프 | PASS | 상단을 가로지르는 흰색 밀봉 테이프의 방향과 위치를 유지함 |
| 수량·분류 문구 | PASS | `500매`, `(1매 포장형)`, `위생용품`의 내용과 상단 좌우 배치를 유지함 |
| 로고·제품명 | PASS | `with`, `위드.미니물티슈`의 검정 인쇄와 중앙 배치를 유지함 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품이나 소품의 추가·누락 없이 촬영 환경과 표면 톤만 정리함 |

### 촬영 스타일·구도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 정면 구도·중앙 배치 | FAIL | 카메라가 박스보다 높아 상판과 흰 테이프가 넓게 노출됨. 사용자 제공 정면 레퍼런스와 불일치함 |
| 배경 | PASS | 경계·소품·반사·질감이 없는 순백에 가까운 심리스 배경을 적용함 |
| 조명·화이트밸런스 | PASS | 부드러운 하이키 확산광과 중립적인 웜 베이지 크라프트 톤을 적용함 |
| 그림자 | PASS | 박스 바로 아래에 짧고 옅은 접지 그림자만 남김 |
| 표면 마감 | PASS | 과한 광택 없이 미세하고 불규칙한 무광 종이 질감을 유지함 |
| 생성 흔적·오염 | PASS | 주요 한글·로고 가장자리와 배경에서 눈에 띄는 생성 흔적이나 오염이 없음 |

### 결과

- Status: FAIL
- Observed Issue: 상판과 흰 테이프가 넓게 보여 정면 촬영 조건을 충족하지 못함
- Suspected Cause: 카메라 높이가 박스 전면 중앙보다 높고 아래를 향한 각도가 남음
- Next Action: 사용자 제공 정면 박스 이미지를 각도 레퍼런스로 추가해 카메라 높이와 축을 재설정함
- Retest ID: TEST-045

---

## TEST-045

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, frontal-camera correction
- Source Images: `references/MASTER_REFERENCE_v1.png`, `products/with-wipes/original/with-wipes-mini-box-original-01.png`
- Camera Reference: `/Users/mgrv/work/with-wipes/images/대표이미지/박스이미지/개별_박스이미지.png`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 사용자 지정 정면 카메라 조건 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-mini-box-studio-v1-03.png`
- Previous Test: TEST-044

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·실루엣 | PASS | 원본의 가로로 길고 낮은 폭·높이 관계와 전면 외곽 형태를 유지함 |
| 전면 모서리·접힘 | PASS | 좌우 수직 모서리와 상하 전면 경계를 유지하고 측면 노출을 최소화함 |
| 수량·분류 문구 | PASS | `500매`, `(1매 포장형)`, `위생용품`의 내용과 상단 좌우 배치를 유지함 |
| 로고·제품명 | PASS | `with`, `위드.미니물티슈`와 점 표기의 내용·검정 인쇄·중앙 배치를 유지함 |
| 새 요소 생성·기존 요소 누락 | PASS | 전면 제품 정보의 추가·누락 없이 카메라 각도와 촬영 환경만 변경함 |

### 촬영 스타일·구도

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 카메라 높이 | PASS | 카메라 축을 전면 중앙 높이에 맞춰 위에서 내려다보는 각도를 제거함 |
| 정면 평행 | PASS | 좌우 모서리는 수직, 전면 상하 경계는 수평으로 화면 가장자리와 평행함 |
| 상판·테이프 노출 | PASS | 상판 면, 흰 테이프와 상단 인쇄가 보이지 않고 얇은 상단 모서리만 남음 |
| 측면 노출 | PASS | 좌우 측면이 거의 보이지 않는 정면 구도를 적용함 |
| 배경·조명 | PASS | 순백에 가까운 심리스 배경과 부드러운 하이키 확산광을 유지함 |
| 그림자 | PASS | 박스 바로 아래에 짧고 옅은 접지 그림자만 남김 |
| 표면 마감 | PASS | 밝은 웜 베이지 크라프트 톤과 미세한 무광 종이 질감을 유지함 |

### 결과

- Status: REVISE
- Observed Issue: 정면 각도는 통과했으나 덕용 박스 레퍼런스보다 크라프트 색이 진하고 노란빛이 강하며, 표면 결·그림자 대비와 화면 점유율이 큼
- Suspected Cause: 각도 보정 과정에서 기존 박스의 어두운 웜 톤과 거친 질감이 유지됨
- Next Action: 정면 구도와 제품 문구는 잠그고 색감·표면·점유율·그림자만 덕용 레퍼런스에 맞춰 재보정함
- Retest ID: TEST-046

---

## TEST-046

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, tone and surface refinement
- Source Images: `references/MASTER_REFERENCE_v1.png`, `products/with-wipes/original/with-wipes-mini-box-original-01.png`, `products/with-wipes/output/with-wipes-mini-box-studio-v1-03.png`
- Tone Reference (analysis only): `/Users/mgrv/work/with-wipes/images/대표이미지/박스이미지/덕용_대표이미지_박스.png`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 사용자 제공 덕용 박스의 톤·표면·점유율 기준 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-mini-box-studio-v1-04.png`
- Previous Test: TEST-045

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·실루엣 | PASS | 미니 박스의 가로로 길고 낮은 폭·높이 관계와 전면 외곽 형태를 유지함 |
| 정면 카메라 각도 | PASS | 상판·테이프·측면이 보이지 않고 전면 네 변이 화면 가장자리와 평행함 |
| 수량·분류 문구 | PASS | `500매`, `(1매 포장형)`, `위생용품`의 내용과 상단 좌우 배치를 유지함 |
| 로고·제품명 | PASS | `with`, `위드.미니물티슈`와 점 표기의 내용·검정 인쇄·중앙 배치를 유지함 |
| 다른 제품 정보 혼입 | PASS | `덕용`, `400매` 등 레퍼런스 제품의 문구가 결과물에 들어오지 않음 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품 정보의 추가·누락 없이 촬영 톤과 화면 배치만 조정함 |

### 촬영 스타일·톤

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 화면 점유율 | PASS | 박스 가로 폭이 캔버스의 약 79%로 덕용 레퍼런스의 약 80% 수준과 유사함 |
| 크라프트 색감 | PASS | 기존의 진한 노란빛을 줄이고 밝고 저채도인 중립 웜 베이지로 조정함 |
| 노출·화이트밸런스 | PASS | 전면 밝기를 균일하게 높이고 중립적인 화이트밸런스와 낮은 대비를 적용함 |
| 표면 질감 | PASS | 거친 얼룩과 고대비 섬유 결을 줄이고 미세한 무광 종이 결만 남김 |
| 배경 | PASS | 경계·소품·반사 없는 순백에 가까운 심리스 배경을 유지함 |
| 그림자 | PASS | 박스 바로 아래에 얇고 옅은 중립 회색 접지 그림자만 남김 |
| 생성 흔적·오염 | PASS | 주요 문구·모서리와 배경에서 눈에 띄는 생성 흔적이나 오염이 없음 |

### 결과

- Status: REVISE
- Observed Issue: 시각 검토 후 전면 톤이 덕용 레퍼런스보다 밝고 희게 보임. 측정 밝기 `202.5`로 레퍼런스 `185.7`보다 `16.8` 높고 채도 지표도 `17%`로 레퍼런스 `25%`보다 낮음
- Suspected Cause: 밝기·표면 정리 과정에서 노출을 과하게 높이고 크라프트 색의 갈색 성분을 지나치게 줄임
- Next Action: `-04`의 정면 구도·표면·점유율을 잠그고 `-03`과 `-04`의 중간 톤으로만 보정함
- Retest ID: TEST-047

---

## TEST-047

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation, calibrated tone-only correction
- Source Images: `references/MASTER_REFERENCE_v1.png`, `products/with-wipes/original/with-wipes-mini-box-original-01.png`, `products/with-wipes/output/with-wipes-mini-box-studio-v1-04.png`, `products/with-wipes/output/with-wipes-mini-box-studio-v1-03.png`
- Tone Target: 전면 무문자 영역 median RGB 약 `(208, 182, 156)`, 밝기 약 `185.7`
- Prompt File: `prompts/MASTER_PROMPT.md`의 제품 보존 원칙과 실측 중간 톤 적용
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-mini-box-studio-v1-05.png`
- Previous Test: TEST-046

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·실루엣 | PASS | `-04`의 가로로 길고 낮은 비율과 전면 외곽 형태를 유지함 |
| 정면 카메라 각도 | PASS | 상판·테이프·측면이 보이지 않고 전면 네 변이 화면 가장자리와 평행함 |
| 수량·분류 문구 | PASS | `500매`, `(1매 포장형)`, `위생용품`의 내용과 상단 좌우 배치를 유지함 |
| 로고·제품명 | PASS | `with`, `위드.미니물티슈`와 점 표기의 내용·검정 인쇄·중앙 배치를 유지함 |
| 새 요소 생성·기존 요소 누락 | PASS | 제품 정보의 추가·누락 없이 크라프트 색감만 보정함 |

### 촬영 스타일·톤

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG로 저장함 |
| 화면 점유율 | PASS | `-04`의 약 79% 가로 점유율과 흰 여백을 유지함 |
| 실측 밝기 | PASS | 새 결과 `185.1`, 덕용 레퍼런스 `185.7`로 차이가 `0.6`에 불과함 |
| 실측 RGB | PASS | 새 결과 `(204, 182, 160)`, 레퍼런스 `(208, 182, 156)`으로 채널별 최대 차이가 `4`임 |
| 채도 | PASS | `-04`의 희게 뜬 저채도 톤을 줄이고 중립 웜 크라프트 색을 복원함 |
| 표면 질감 | PASS | `-04`의 매끄러운 무광 표면과 미세한 저대비 종이 결을 유지함 |
| 배경·그림자 | PASS | 순백에 가까운 배경과 얇고 옅은 접지 그림자를 유지함 |
| 생성 흔적·오염 | PASS | 주요 문구·모서리와 배경에서 눈에 띄는 생성 흔적이나 오염이 없음 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- User Approval: 2026-08-02 최종 승인
- Next Action: `-05` 결과를 미니 물티슈 박스 이미지 최종본으로 사용
- Retest ID: 없음

---

## TEST-048

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes`
- Tool / Model: Codex built-in image generation + FFmpeg pixel-preserving composition scale
- Source Images: `/Users/mgrv/work/with-wipes/images/대표이미지/개별(무지)_대표이미지.png`, `/Users/mgrv/work/with-wipes/images/대표이미지/박스이미지/개별_박스이미지.png`
- Prompt File: `prompts/COUPANG_MAIN_PRESET.md`
- Prompt Version: 1.0
- Output File: `products/with-wipes/output/with-wipes-individual-plain-main-box-product-studio-v1-01.png`
- Previous Test: TEST-047

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·실루엣 | PASS | 개별 물티슈 박스의 정면 직사각형 비율과 모서리 구조를 유지함 |
| 박스 로고·인쇄 | PASS | `위생용품`, `with`, `위드.물티슈`의 형태·색상·배치를 유지함 |
| 상품 비율·실루엣 | PASS | 사용자 제공 원본 기준 약 2.3:1의 가로로 긴 포장 비율과 톱니형 마감·실링 구조를 유지함 |
| 상품 문구 | PASS | `위생용품`, `내용량 : 1매(200x220mm, 1겹)`의 내용과 우측 인쇄 배치를 유지함 |
| 승인 중첩 범위 | PASS | 상품을 박스 우측 전경에서 왼쪽으로 깊게 중첩해 `400매`, `개별포장`을 의도적으로 가림 |
| 새 요소 생성·기존 요소 누락 | PASS | 승인된 중첩 외에 로고·문구·제품 요소의 추가나 누락이 없음 |

### 쿠팡 대표이미지 구도·배경

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 캔버스 | PASS | 1254×1254 1:1 PNG, `rgb24`로 저장함 |
| 가로 점유율 | PASS | 박스+상품 결합 영역 80.38%로 목표 범위 78–82%를 충족함 |
| 중앙 정렬 | PASS | 결합 영역 중심 x=626px, 기준 x=627px 대비 오차 1px임 |
| 배경 | PASS | 단색 순백 배경이며 그라데이션·비네팅·바닥선·반사가 없음 |
| 외부 그림자 | PASS | 박스와 상품 외부에 접지 그림자·투영 그림자·후광이 없음 |
| 제품 내부 형태 | PASS | 확정 시안 전체를 균등 확대해 박스와 상품의 상대 크기·중첩·가로세로 비율을 유지함 |

### 결과

- Status: PASS
- Observed Issue: 없음
- Suspected Cause: 해당 없음
- User Approval: 2026-08-02 최종 승인
- Next Action: 해당 파일을 개별(무지) 쿠팡 대표이미지 최종본으로 사용
- Retest ID: 없음

---

## TEST-049

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes individual-plain Coupang main`
- Tool / Model: Codex built-in image generation tool + Pillow 균일 비율 확대·순백 정규화
- Source Image: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/개별 무지 쿠팡 대표이미지.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/COUPANG_MAIN_PRESET.md`, `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/개별 무지 쿠팡 대표이미지_가이드수정.png`

### 필수 보존 및 쿠팡 기준

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 비율·실루엣·접힘 구조 | PASS | 박스와 개별 포장의 가로세로 관계, 모서리, 접힘과 중첩 구도가 유지됨 |
| 로고·한글·인쇄 배치 | PASS | `위생용품`, `with 위드.물티슈`, 내용량 표기가 원문대로 확인됨 |
| 배경 | PASS | 네 모서리와 외부 배경이 `#FFFFFF`임 |
| 화면 점유율·중앙 정렬 | PASS | 가로 점유율 86.76%, 중심 오차 3px |

### 결과

- Status: PASS
- Observed Issue: 없음
- Next Action: 쿠팡 대표이미지 등록


## TEST-050

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes individual Coupang main`
- Tool / Model: Codex built-in image generation tool + Pillow 균일 비율 확대·순백 정규화
- Source Image: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/개별_대표이미지_쿠팡.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/COUPANG_MAIN_PRESET.md`, `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/개별_대표이미지_쿠팡_가이드수정.png`

### 필수 보존 및 쿠팡 기준

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 비율·실루엣·접힘 구조 | PASS | 박스와 세로형 개별 포장의 형태·중첩 관계가 유지됨 |
| 로고·한글·인쇄 배치 | PASS | 박스 로고와 포장지의 `위생용품`, 내용량, `with 위드.` 표기가 유지됨 |
| 배경 | PASS | 네 모서리와 외부 배경이 `#FFFFFF`임 |
| 화면 점유율·중앙 정렬 | PASS | 가로 점유율 88.04%, 중심 오차 1px |

### 결과

- Status: PASS
- Observed Issue: 없음
- Next Action: 쿠팡 대표이미지 등록



## TEST-051

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes dry-tissue Coupang main`
- Tool / Model: Codex built-in image generation tool + Pillow 균일 비율 확대·순백 정규화
- Source Image: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/건티슈_대표이미지_쿠팡.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/COUPANG_MAIN_PRESET.md`, `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/건티슈_대표이미지_쿠팡_가이드수정.png`

### 필수 보존 및 쿠팡 기준

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 비율·실루엣·접힘 구조 | PASS | 박스와 전경 건티슈의 비율·외곽·중첩 구도가 유지됨 |
| 로고·한글·인쇄 배치 | PASS | `with 위드.건티슈` 로고와 인쇄 배치가 유지됨 |
| 배경 | PASS | 네 모서리와 외부 배경이 `#FFFFFF`임 |
| 화면 점유율·중앙 정렬 | PASS | 가로 점유율 88.04%, 중심 오차 1px |

### 결과

- Status: PASS
- Observed Issue: 없음
- Next Action: 쿠팡 대표이미지 등록



## TEST-052

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes bulk Coupang main`
- Tool / Model: Pillow 원본 픽셀 보존 합성·균일 비율 확대·크라프트 선택 보정
- Source Image: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/덕용_대표이미지_쿠팡.png`
- Reference: `references/MASTER_REFERENCE_v1.png`, `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/건티슈_대표이미지_쿠팡.png`
- Prompt File: `prompts/COUPANG_MAIN_PRESET.md`, `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/덕용_대표이미지_쿠팡_가이드수정.png`

### 필수 보존 및 쿠팡 기준

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 비율·실루엣·접힘 구조 | PASS | 원본 전체를 한 단위로 비례 확대해 박스와 덕용 포장의 형태가 유지됨 |
| 로고·한글·인쇄 배치 | PASS | 원본 픽셀 기반 처리로 `위드.물티슈`와 포장지의 모든 인쇄 정보가 유지됨 |
| 배경 | PASS | 네 모서리와 외부 배경이 `#FFFFFF`임 |
| 화면 점유율·중앙 정렬 | PASS | 가로 점유율 86.76%, 중심 오차 1px |

### 결과

- Status: PASS
- Observed Issue: 없음
- Next Action: 쿠팡 대표이미지 등록



## TEST-053

### 실행 정보

- Date: 2026-08-02
- Operator: Codex
- Product: `with-wipes mini Coupang main`
- Tool / Model: Codex built-in image compositing tool + Pillow 균일 비율 확대·순백 정규화
- Source Image: `/Users/mgrv/work/with-wipes/images/대표이미지/박스이미지/미니_박스이미지.png`, `/Users/mgrv/work/with-wipes/images/web/mini.png`
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/COUPANG_MAIN_PRESET.md`, `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File: `/Users/mgrv/work/with-wipes/images/대표이미지/쿠팡대표이미지/미니_대표이미지_쿠팡_가이드수정.png`

### 필수 보존 및 쿠팡 기준

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 비율·실루엣·접힘 구조 | PASS | 실제 미니 박스 원본의 넓은 가로 비율과 개별 포장의 형태가 유지됨 |
| 로고·한글·인쇄 배치 | PASS | `500매`, `(1매 포장형)`, `위생용품`, `with 위드.미니물티슈`가 원문대로 확인됨 |
| 사용자 승인 구도 | PASS | 포장지를 왼쪽으로 당겨 우측 돌출을 줄인 승인 구도를 적용함 |
| 배경 | PASS | 네 모서리와 외부 배경이 `#FFFFFF`임 |
| 화면 점유율·중앙 정렬 | PASS | 가로 점유율 85.49%, 중심 오차 11px |

### 결과

- Status: PASS
- Observed Issue: 없음
- Next Action: 쿠팡 대표이미지 등록
