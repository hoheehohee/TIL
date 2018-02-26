# Aribnb React/JSX Style Guide

* React와 JSX에 대한 합리적인 접근법

이 스타일 가이드는 주로 JavaScript에서 현재 널리 사용되는 표준 기반으로 합한다.

## 기본 규칙 (Basic Rules)
- 하나의 파일에 오직 하나의 React 컴포넌트를 사용한다.
  - 그러나, 다중 [스테이트가 없는(Stateless) 또는 순수한 함수나 컴포넌트](https://facebook.github.io/react/docs/reusable-components.html#stateless-functions)는 허용합니다. eslint: [`react/no-multi-comp`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/no-multi-comp.md#ignorestateless).
- JSX파일이 아닌 다른 app에서 초기화하는 경우를 제외하고는 `React.createElement`를 사용하지 않습니다.

## 클래스(Class) vs React.createClass vs Stateless
- 내부 state를 가지거나 또는 refs를 가지고 있다면 `React.createClass` 보다 `class extends React.Component`를 선호 합니다. eslint: [`react/prefer-es6-class`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/prefer-es6-class.md) [`react/prefer-stateless-function`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/prefer-stateless-function.md)
  ```jsx
  // bad
  const Listing = React.createClass({
      //...
      render() {
        return <div>{this.state.hello}</div>;
      }
  });

  // good
  class Listing extends React.Component {
    // ...
    render() {
      return <div>{this.state.hello}</div>;
    }
  }
  ```

  그리고 state 나 refs가 없다면, 클래스에 대한 일반적인 함수 (arrow functions이 아닌)를 선호 합니다.

  ```jsx
  // bad
  class Listing extends React.Component {
    render() {
      return <div>{this.props.hello}</div>;
    }
  }

  // bad (relying on function name inference is discouraged)
  const Listing = ({ hello }) => (
    <div>{hello}</div>
  );

  // good
  function Listing({ hello }) {
    return <div>{hello}</div>;
  }
  ```

  <!-- ## Mixins
  - [mixins를 사용하지 마세요](https://facebook.github.io/react/blog/2016/07/13/mixins-considered-harmful.html).
  > 왜? Mixins 암묵적 의존성을 도입하고 이름 충돌을 야기하며,  -->

## Naming

- **확장자**: React 컴포넌트는 `.jsx` 확장자를 사용합니다.
- **파일명**: 파일명에는 PascalCase(대문자로 시작)를 사용합니다. 예) `ReservationCard.jsx`.
- **참조명**: React 컴포넌트의 참조 이름에는 PascalCase를 쓰고 그 인스턴스 이름에는 camelCase(소문자로 시작)를 사용합니다. eslint: [`react/jsx-pascal-case`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-pascal-case.md)

  ```jsx
  // bad
  import reservationCard from './ReservationCard';

  // good
  import ReservationCard from './ReservationCard';

  // bad
  const ReservationItem = <ReservationCard />;

  // good
  const reservationItem = <ReservationCard />;
  ```
- **컴포넌트명**: 컴포넌트명으로 파일명을 씁니다. 예) `ReservationCard.jsx` 파일은 `ReservationCard`라는 참조명을 가집니다. 그러나, 루트 컴포넌트가 디렉토리에 구성되었다면 파일명을 index.jsx로 쓰고 디렉토리명을 컴포넌트명으로 사용합니다.
  ```jsx
  // bad
  import Footer from './Footer/Footer';

  // bad
  import Footer from './Footer/index';

  // good
  import Footer from './Footer';
  ```
- **Props Naming**
