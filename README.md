# WITH Studio

WITH 제품 이미지를 같은 스튜디오에서 촬영한 것처럼 보정하고, 원본·결과물·프롬프트·QA 기록을 함께 관리하는 운영 저장소입니다.

## v1.0 운영 기준

| 구분 | 기준 |
| --- | --- |
| 마스터 레퍼런스 | `references/MASTER_REFERENCE_v1.png` |
| 마스터 프롬프트 | `prompts/MASTER_PROMPT.md` |
| 단축 프롬프트 | `prompts/SHORT_PROMPT.md` |
| 스타일 기준 | `docs/STYLE_GUIDE.md` |
| 출력 비율 | 1:1 |
| 배경 | 순백 `#FFFFFF` |
| 표면 | 밝은 웜 베이지의 매끄러운 무광 크라프트 |

마스터 레퍼런스는 촬영 환경만 판단하는 기준입니다. 제품의 형태·비율·로고·텍스트·인쇄 배치는 항상 원본을 우선합니다.

## 저장소 구조

```text
.
├── references/              # 변경 금지 마스터 레퍼런스와 기준 정보
├── prompts/                 # 활성 프롬프트
├── products/
│   ├── README.md            # 제품 폴더 생성·운영 규칙
│   └── _template/
│       ├── original/        # 입력 원본
│       └── output/          # 생성 결과
├── docs/                    # 스타일·파일명·작업 절차
├── tests/
│   ├── QA_CHECKLIST.md      # 결과물 1건별 검수 기준
│   ├── TEST_LOG.md          # 실행 조건·판정·후속 조치 기록
│   └── failure/             # 실패 결과 사본
├── scripts/validate-repository.sh
├── AGENTS.md                # AI 작업 규칙
└── CHANGELOG.md
```

## 작업 시작

### 1. 제품 폴더 생성

`{product}`는 영문 소문자 kebab-case를 사용합니다.

```bash
cp -R products/_template products/{product}
```

원본은 `products/{product}/original`, 생성 결과는 `products/{product}/output`에 저장합니다. 상세 규칙은 `products/README.md`와 `docs/FILE_NAMING.md`를 따릅니다.

### 2. 이미지 생성

1. `references/MASTER_REFERENCE_v1.png`를 첫 번째 이미지로 첨부합니다.
2. 제품의 `original` 이미지를 두 번째 이미지로 첨부합니다.
3. 기본 작업에는 `prompts/MASTER_PROMPT.md`를 사용합니다.
4. 빠른 반복이 필요할 때만 동일 버전의 `prompts/SHORT_PROMPT.md`를 사용합니다.
5. 결과를 제품의 `output` 폴더에 저장합니다.

박스 이미지와 상품 이미지를 함께 전달하며 `쿠팡 대표이미지 만들어줘`라고 요청하면 `prompts/COUPANG_MAIN_PRESET.md`의 우측 중첩·88~90% 권장 점유(최소 85%)·중앙 정렬 구도를 바로 적용합니다. 위치·크기 시안은 임시로 빠르게 확인하고 승인본만 저장·QA합니다.

입력 순서가 바뀌면 프롬프트의 “첫 번째 이미지/두 번째 이미지” 지시가 반대로 적용되므로 실행을 중단하고 다시 첨부합니다.

### 3. QA와 기록

1. `tests/QA_CHECKLIST.md`를 위에서 아래로 확인합니다.
2. 실행 조건과 결과를 `tests/TEST_LOG.md`에 추가합니다.
3. `FAIL` 결과는 `tests/failure`에도 사본을 저장합니다.
4. 프롬프트를 수정했다면 같은 테스트 조건으로 다시 실행하고 `CHANGELOG.md`를 갱신합니다.

## 판정 원칙

- `PASS`: 필수 보존 항목이 모두 유지되고 스타일 기준을 충족함
- `REVISE`: 보존 항목은 유지됐지만 촬영 스타일이나 마감에 수정이 필요함
- `FAIL`: 비율·실루엣·로고·한글 텍스트·인쇄 배치 중 하나라도 바뀜

`FAIL`은 스타일 완성도와 관계없이 즉시 재작업합니다.

## 변경 규칙

- `references/MASTER_REFERENCE_v1.png`는 삭제·수정·덮어쓰기·이름 변경하지 않습니다.
- 마스터 레퍼런스를 교체해야 하면 기존 파일을 보존하고 새 버전 파일을 추가합니다.
- 마스터 프롬프트의 의미나 우선순위가 바뀌면 버전을 올리고 `CHANGELOG.md`에 이유를 기록합니다.
- `SHORT_PROMPT.md`는 독립 기준이 아니라 활성 마스터 프롬프트의 축약본입니다.
- 작업 전후에 아래 검증을 실행합니다.

```bash
bash scripts/validate-repository.sh
```

## 관련 문서

- [작업 절차](docs/WORKFLOW.md)
- [스타일 기준](docs/STYLE_GUIDE.md)
- [파일명 규칙](docs/FILE_NAMING.md)
- [마스터 레퍼런스 기준](references/README.md)
- [QA 체크리스트](tests/QA_CHECKLIST.md)
- [테스트 기록](tests/TEST_LOG.md)
