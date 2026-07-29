# Test Log

이미지 생성 실행과 QA 판정을 재현하기 위한 기록입니다. 테스트마다 아래 템플릿을 복사하고 ID를 1씩 올립니다. 관찰한 사실과 원인 추정은 분리해서 적습니다.

## Status

- `PASS`: 필수 보존 항목과 스타일 기준을 모두 충족
- `REVISE`: 필수 보존 항목은 유지됐으나 스타일·마감 수정 필요
- `FAIL`: 비율·실루엣·로고·한글 텍스트·인쇄 배치 중 하나 이상 변경

---

## TEST-001

### 실행 정보

- Date:
- Operator:
- Product:
- Tool / Model:
- Source Image:
- Reference: `references/MASTER_REFERENCE_v1.png`
- Prompt File: `prompts/MASTER_PROMPT.md`
- Prompt Version: 1.0
- Output File:
- Previous Test: 없음

### 필수 보존 항목

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 박스 비율·폭/높이 관계 | PASS / FAIL | |
| 외곽 실루엣·접힘 구조 | PASS / FAIL | |
| 로고 | PASS / FAIL | |
| 모든 한글 텍스트 | PASS / FAIL | |
| 글자 형태·인쇄 위치·레이아웃 | PASS / FAIL | |

### 촬영 스타일

| 항목 | 판정 | 관찰 |
| --- | --- | --- |
| 촬영각·원근 | PASS / REVISE | |
| 중앙 배치·여백·1:1 | PASS / REVISE | |
| 배경 | PASS / REVISE | |
| 조명·노출·화이트밸런스 | PASS / REVISE | |
| 그림자 | PASS / REVISE | |
| 크라프트 톤·표면 질감 | PASS / REVISE | |
| 생성 흔적·오염 | PASS / REVISE | |

### 결과

- Status: PASS / REVISE / FAIL
- Observed Issue:
- Suspected Cause:
- Next Action:
- Retest ID:

---
