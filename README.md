# WITH Image Library

위드 제품 이미지를 동일한 스튜디오 촬영 톤으로 관리하기 위한 이미지 저장소입니다.

## 목적

- 제품별 원본 이미지와 결과물 관리
- 마스터 레퍼런스와 마스터 프롬프트 관리
- 제품 사진 스타일 기준 통일
- 성공/실패 테스트 기록
- 프롬프트 버전 변경 이력 관리

## 현재 기준

- Master Reference: `references/MASTER_REFERENCE_v1.png`
- Master Prompt: `prompts/MASTER_PROMPT.md`
- Style Guide: `docs/STYLE_GUIDE.md`
- Output Ratio: 1:1
- Background: Pure White
- Surface: Smooth Matte Kraft

## 사용 방법

1. `references/MASTER_REFERENCE_v1.png`를 첫 번째 이미지로 첨부합니다.
2. 보정할 원본 박스 사진을 두 번째 이미지로 첨부합니다.
3. `prompts/MASTER_PROMPT.md`의 프롬프트를 사용합니다.
4. 원본은 제품별 `original` 폴더에 저장합니다.
5. 결과물은 제품별 `output` 폴더에 저장합니다.
6. 실패하거나 수정이 필요한 사례는 `tests/failure`와 `tests/TEST_LOG.md`에 기록합니다.

## 기본 작업 요청

> 첫 번째 이미지를 마스터 레퍼런스로 사용하고, 두 번째 이미지를 동일한 스튜디오 제품 촬영 스타일로 보정해줘.

## 운영 원칙

- 레퍼런스는 촬영 환경만 참고합니다.
- 원본 박스의 비율과 디자인을 우선합니다.
- 로고와 한글 텍스트는 변경하지 않습니다.
- 프롬프트 수정 시 `CHANGELOG.md`를 함께 갱신합니다.
