# Products

제품별 원본과 생성 결과를 한 폴더에서 대응시키는 영역입니다.

## 구조

```text
products/
├── _template/
│   ├── original/
│   └── output/
└── {product}/
    ├── original/
    └── output/
```

`{product}`는 제품을 식별할 수 있는 영문 소문자 kebab-case를 사용합니다.

## 새 제품 추가

```bash
cp -R products/_template products/{product}
```

## 운영 규칙

- 촬영 원본은 `original`에 저장합니다.
- 생성·보정 결과는 `output`에 저장합니다.
- 결과물로 원본 파일을 덮어쓰지 않습니다.
- 재실행 결과도 기존 결과를 덮어쓰지 않고 일련번호를 올립니다.
- 파일명은 `docs/FILE_NAMING.md`를 따릅니다.
- 모든 `output`은 `tests/TEST_LOG.md`의 테스트 ID와 연결합니다.
