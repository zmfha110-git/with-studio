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
