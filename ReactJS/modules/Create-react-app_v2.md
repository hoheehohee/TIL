# Create-react-app V2 릴지즈! 무슨 변경사랑이 있을까?

1. Sass, Cass Module 지원
- yarn eject 하지 않고도 Sass와 Css Module 사용 가능
- Sass를 사용하기 위해선, 사전에 node-sass를 설치하면 된다.
- Css Module은 사용 방식이 이전과 조금 다르다.
  - 파일을 생성할 때 파일이름.module.css 이런식으로 하면 Css Module 적용.
  ```css
  /* cssFileModule */
  .wrapper {
    background: gray;
    color: white;
    padding: 1rem;
    font-size: 2rem;
  }
  ```
  ```javascript
  /* AnotherComponent */
  import React from 'react';
  import styles from './CssFileName.module.css';
  const AnotherComponent = () => {
    return <div className={styles.wrapper}>What about CSS Module?</div>;
  };
  export default AnotherComponent;
  ```
2. Babel 7 업그레이드
- Babel7로 업데이트 되면서 빌드속도가 개선 된다고 한다.
- preset-typescript를 통한 타입스크립트 지원 및 자동 Polyfill 등의 기능이 도입
- JSX Fragment ***<>...</>*** 문법을 이제 별도의 설정 커스터마이징 없이도 사용
  
3. Webpack v4 업그레이드
- 번들링 성능이 개선될거고, JS번들을 더 똑똑하게 분리시킨다고 한다.
- 해봐야겠지만...
  - chunk.js에는 자동으로 react, react-dom 관련 코드 들이 들어있고 main.js쪽에 우리가 만든 컴포넌트들의 코드가 들어있다.
  - 옛날에 CommonsChunkPlugin 를 사용해서 해야했던 작업들이 **optimization.splitChunks** 라는 API 를 통하여 자동으로 이뤄진다고 한다.

4. SVG를 리액트 컴포넌트화 하여 불어오기
  ```javascript
  import { ReactComponent as Logo } from './log.svg'
  ```
5. proxy 설정을 커스터마이징 가능
- ? ? ?

6. Good bye, IE
- CRA v2 부터는 Internet Explorer를 기본적으로 아예 지원하지 않는다고 한다. 지원이 필요하면 react-app-polyfill을 사용.
  ```
  $ yarn add react-app
  ```
- 그리고 src/index.js 에서 스크립트를 추가
  ```javascript
  import 'react-app-polyfill/ie9';
  import 'react-app-polyfill/ie11';
  ```
- 자세한 내용은 [`여기`](https://github.com/facebook/create-react-app/tree/master/packages/react-app-polyfill) 에서 확인

7. 기타 
- 이 외에 변경사항들 공식 블러그 [`CRA v2공식 블로그 포스트`](https://reactjs.org/blog/2018/10/01/create-react-app-v2.html) 참조