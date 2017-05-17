## 코딩 컨벤션을 자동하 할 수 있는

자동화 도구 :

1. EditorConfig : 에디터 설정을 자동화 할 때
  - .editorconfig 파일 설정을 할 수 있다.
  - 문자셋, 탭/스페이스, 스페이스 갯수, 줄마꿈문서, 파일 끝 빈 줄등
  - http://editorconfig.org
  - Atom은 플러그인 설치
  - 세세한 설정은 지원 x

2. Stylefmt
  - CSS 파일이나 SCSS파일의 컨벤션을 강제
  - 규칙에 맞게 자동으로
  - 설정 파일은 https://stylelint.io/

3. Prettier
  - JS파일의 코딩 컨벤션을 강제
  - 규칙에 맞게 자동으로 코드변경
  - npm 또는 yarn을 통해 설치
  - ES2017, JSX, Flow지원
  - JS -> AST(Abstract Syntax ?? )

4. Husky + Lint-staged
  - Husky : git hook을 편하게 작성
  - Lint-staged : 커밋할 파일에 릿트 설정


React  퍼포먼스 개선기

장점
 - 러닝커드?

 성능 측청 도구
 - react-addons-perf
 - Chrome extension react-devtools

 - shouldComponentUpdate()
  : 성능 개선에 아주 중요한 역을을 하느 API

 - PureComponent
  : 다음 state와 props를 현재 state와 props와 자동으로 비교
    단 shallowCompare이기 때문에 구현할때 잘 생각



Reqct TDD 쵸큼 맛보기
  - enzyme

React 애플리케이션 아키텍처 - (부제: 아무도 알려주지 않아서 혼자 삽질했다.)
