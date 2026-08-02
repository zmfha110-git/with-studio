# WITH Studio 작업 규칙

이 파일은 이 저장소에서 작업하는 AI 에이전트의 실행 기준입니다. 충돌이 있으면 사용자 요청, 이 파일, 각 운영 문서 순으로 따릅니다.

## 목표

- 제품 원본을 훼손하지 않고 WITH Studio v1.0 촬영 스타일로 보정합니다.
- 원본·결과물·실행 조건·QA 판정을 다시 추적할 수 있게 관리합니다.
- 문서와 폴더 구조를 실제 운영 상태와 일치시킵니다.

## 단일 기준

- 활성 마스터 레퍼런스: `references/MASTER_REFERENCE_v1.png`
- 활성 마스터 프롬프트: `prompts/MASTER_PROMPT.md` v1.0
- 단축 프롬프트: `prompts/SHORT_PROMPT.md` v1.0
- 스타일: `docs/STYLE_GUIDE.md`
- 파일명: `docs/FILE_NAMING.md`
- QA: `tests/QA_CHECKLIST.md`, `tests/TEST_LOG.md`

## 보호 대상

`references/MASTER_REFERENCE_v1.png`는 삭제·수정·덮어쓰기·이름 변경·포맷 변환하지 않습니다. 새 레퍼런스가 필요하면 기존 파일을 보존한 채 별도 버전 파일을 추가하고, 활성 기준 변경 전에 사용자 확인을 받습니다.

작업 전후에 아래 명령으로 보호 파일의 SHA-256이 `465b1d520044a88866a6d4bf7ffca644003ef851397f225d588158ba8c21a54c`인지 확인합니다.

```bash
shasum -a 256 references/MASTER_REFERENCE_v1.png
```

## 제품 폴더

- 실제 제품은 `products/{product}/original`과 `products/{product}/output`을 한 쌍으로 둡니다.
- `{product}`는 영문 소문자 kebab-case를 사용합니다.
- 원본은 `original`에만 저장하고 생성 결과로 덮어쓰지 않습니다.
- 결과물은 `output`에만 저장합니다.
- 새 제품은 `products/_template`을 복사해 시작합니다.

## 이미지 작업

1. 마스터 레퍼런스를 첫 번째 이미지, 제품 원본을 두 번째 이미지로 사용합니다.
2. 레퍼런스에서는 배경·조명·그림자·노출·화이트밸런스·색감·표면 촬영 질감만 참고합니다.
3. 원본의 비율·실루엣·접힘 구조·로고·모든 한글 텍스트·인쇄 배치는 잠급니다.
4. 충돌 시 원본 보존을 촬영 스타일보다 우선합니다.
5. 원본과 결과물의 대응 관계를 파일명과 테스트 ID로 남깁니다.

## 쿠팡 대표이미지 바로 실행

- 사용자가 박스 이미지와 상품 이미지를 함께 전달하며 `쿠팡 대표이미지 만들어줘`라고 요청하면 `prompts/COUPANG_MAIN_PRESET.md`를 즉시 적용합니다.
- 입력 두 개가 모두 있으면 배치·크기·파일명을 다시 질문하지 않습니다.
- 먼저 임시 시안을 빠르게 보여주고, 사용자 승인 후에만 `output` 저장과 QA를 수행합니다.
- 기본 구도는 상품 우측 배치, 박스+상품 가로 점유율 약 80%, 결합 영역 정중앙 정렬입니다.

## 프롬프트와 버전

- `MASTER_PROMPT.md`가 원문 기준이고 `SHORT_PROMPT.md`는 축약본입니다.
- 마스터 프롬프트를 바꾸면 단축 프롬프트와 `CHANGELOG.md`의 동기화 여부를 확인합니다.
- 의미·우선순위 변경은 Major, 조건 추가·명료화는 Minor, 오탈자는 Patch로 올립니다.
- 과거 버전은 삭제하거나 덮어쓰지 않고 보존합니다.

## QA와 기록

- 결과물마다 `tests/QA_CHECKLIST.md` 전체를 확인합니다.
- 비율·실루엣·로고·한글 텍스트·인쇄 배치 변경은 즉시 `FAIL`입니다.
- 실행 조건, 입력·출력 파일, 사용 프롬프트, 판정 근거, 다음 행동을 `tests/TEST_LOG.md`에 기록합니다.
- 실패 결과 사본은 `tests/failure`에 저장합니다.
- 검증 기록 없이 `PASS`로 보고하지 않습니다.

## 문서와 Git

- 프로젝트 명칭은 `WITH Studio`로만 표기합니다.
- 경로·버전·폴더를 바꾸면 README와 관련 문서를 함께 갱신합니다.
- 요청과 무관한 파일 정리나 이미지 보정은 하지 않습니다.
- 파일 삭제와 기존 활성 기준의 교체는 사용자 확인 후 진행합니다.
- Git 커밋은 사용자가 명시적으로 요청한 경우에만 수행합니다.

## 완료 검증

```bash
bash scripts/validate-repository.sh
git diff --check
git status --short
```

완료 보고에는 변경 파일, 검증 결과, 마스터 레퍼런스 해시 보존 여부를 포함합니다.
