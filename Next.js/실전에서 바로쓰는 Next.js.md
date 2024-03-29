목차
====
- [1. Next.js 알아보기](#1-nextjs-알아보기)
  - [Next.js를 사용하는 이유](#nextjs를-사용하는-이유)
  - [React와 Next.js의 가장 큰 차이점](#react와-nextjs의-가장-큰-차이점)


1 Next.js 알아보기
==========
> Next.js는 리액트를 위해 만든 오프소스 자바스크립트 웹 프레임워크로, 리액트에는 없는 **서버사이드 렌더링(server-side rendering(SSR))**, **정적 사이트 생성 (static state generation(SSG))**, **증분 정적 재성성(incremental static regeneration(ISR))** 과 같은 다양하고 풍부한 기능을 제공한다.

### Next.js를 사용하는 이유  

> 최근 몇 년 사이 웹 개발 분야에는 많은 변화가 있었다. 앵귤러, 리엑트, 뷰와 같은 프레임워크가 등장하면서 웹 개발 분야의 급속도로 변하기 시작했으며 프런트엔드 웹 개발분야에서 여러 혁진적인 아이디어를 이끌어 냈다.
>
> 다만 리액트에는 하 가지 큰 문제점이 있다. 바로 리액트가 기본적으로 클라이언트 사이드에서만 작동한다는 점이다. 사용자의 웹 브라우저에서만 실행되기 때문에 리액트를 사용한 웹 애플리케이션은 **검색 엔진 최적화(search engine optimization(SEO))** 의 효과를 거의 볼 수 없으며, 첫 화면에 웹 애플리케이션을 제대로 표시하기 위해 애플리케이션 실행 초기에 성능 부담이 생긴다. 웹 앱을 완전히 표시하려면 브라우저가 전제 췝 애플리케이션 번들을 다운로드한 다음 그 내용을 분석하는 코드를 실행해서 결과를 얻어야 하기 때문이다. 그래서 아주 큰 웹 애플리케이션에서는 첫 화면을 표시하기까지 수 초가 소요되기도 한다.
>
> 이 문제를 해결하기 위해 많은 개발자들이 웹 애플리케이션을 서버에서 미리 렌더링해두는 방법을 연구하기 시작 했으며 **서버 사이드 핸더링**을 사용할 수 있다면 리액트 앱을 순수한 HTML 페이지로 미리 렌더링해둔 다음 브라우저가 이를 다운로드하여 즉각 화면에 표시하고 클라이언트에서 자바스크립트 번들을 다 받으면 사용자가 웹 앱과 상호 작용을 할 수 있게 된다.
>
> 이러한 문제를 해결하기 위해 Vercel이 Next.js를 만들었다. **코드분할(code splitting)**, **서버 사이드 핸더링**, **파일 기반 라우팅**, **경로 기반 프리메칭(pre-fetching)** 등을 Next.js로 클라이언트와 서버 모두 아주 복잡한 작업을 별 다른 노력 없이 쉽게 구현할 수 있다.
>
> 이 외에도 현재 Next.js는 다음과 같은 기능을 제공한다.
>
> 1. 정적 사이트 생성
>
> 2. 증분 정적 콘텐츠 생성
>
> 3. 타입스크립트에 대한 기본 지원
>
> 4. 자동 폴리필(polyfill) 적용
> 
> 5. 웹 애플리케이션의 국제화 지원
>
> 6. 성능 분석

### React와 Next.js의 가장 큰 차이점

> 1. 리액트는 자바스크립트 라이브러이이고 Next.js는 프레임워크라는 점.
>
> 2. Next.js는 클라이언트와 서버에서 실행할 수 있는 코드에 풍부하고 다양한 기능을 제공하는 웹 애프리케이션을 만들 수 있게 해준다.
>
> 3. 서버 사이트렌더링 페이지나 정적으로 생성된 페이지 모두 Node.js에서 실행되기 때문에 fetch, window, document와 같은 웹 브라우저에서 제공하는 전역 객체나 canvas 같은 HTML 요소에 접근할 수 없다.
> 
> 4. 반면 fs, child_process와 같은 Node.js에서만 사용할 수 있는 라이브러리나 API를 사용할 수 있다. (클라이언트가 보내기 전에, 페이지 생성 시점에 해당 코드를 처리하는 방식 지원)