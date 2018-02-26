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
- **Props Naming**: 다른 목적으로 DOM component props 이름을 사용하지 않습니다.
> 앱의 히위 집합에서 API를 다양하게 사용하면 코드의 읽기가 쉽지 않고 관리가 어려워 버그가 발생할 수 있습니다.
```jsx
// bad
<MyComponent style="fancy" />

// bad
<MyComponent className="fancy" />

//good
<MyComponent variant="fancy" />
```

## 선언(Declaration)
- displayName을 이용하여 컴포넌트명을 정하지 않습니다. 그대신, 참조에 의해 이름을 지정합니다.
```jsx
// bad
export default React.createClass({
  displayName: 'ReservationCard',
});

// good
export default class ReservationCard extends React.Component {
}
```

##조정(Aligment)
- JSX 구문에 따른 정렬 스타일을 사용합니다. eslint: [`react/jsx-closing-bracket-location`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-closing-bracket-location.md) [`react/jsx-closing-tag-location`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-closing-tag-location.md)

```jsx
<Foo superLongParam="bar"
         anotherSuperLongParam="baz" />

// good
<Foo
  superLongParam="bar"
  anotherSuperLongParam="baz"
/>

// props가 한 줄에 들어간다면 같은 줄에 정렬 하십시오.
<Foo bar="bar" />

// children는 들여쓰기는 합니다.
<Foo
  superLongParam="bar"
  anotherSuperLongParam="baz"
>
  <Quux />
</Foo>
```

## 인용(Quotes)
- JSX 속성(attributes)에는 항상 큰 따옴표(")를 사용합니다. 그러나 다른 모든 자바스크립트에는 작은 따옴표(single quotes)를 사용합니다.
>JSX 속성(attributes)은 따옴표(quotes)의 탈출(escaped)을 포함할 수 없습니다. 그래서 큰 따옴표를 이용하여 "don't"와 같은 접속사를 쉽게 입력할 수 있습니다. 일반적으로 HTML 속성(attributes)에는 작은 따옴표 대신 큰 따옴표를 사용합니다. 그래서 JSX 속성역시 동일한 규칙이 적용됩니다.

```jsx
// bad
<Foo bar='bar' />

// good
<Foo bar="bar" />

// bad
<Foo style={{ left: "20px" }} />

// good
<Foo style={{ left: '20px' }} />
```

## 공백(Spacing)
- 자신을 닫는(self-closing) 태그에는 항상 하나의 공백만을 사용합니다. eslint: [`no-multi-spaces`](https://eslint.org/docs/rules/no-multi-spaces), [`react/jsx-tag-spacing`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-tag-spacing.md)
```jsx
// bad
<Foo/>

// very bad
<Foo                 />

// bad
<Foo
 />

// good
<Foo />
```
- JSX 중괄호에 공백을 넣지 마십시오. eslint: [`react/jsx-curly-spacing`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-curly-spacing.md)
```jsx
// bad
<Foo bar={ baz } />

// good
<Foo bar={baz} />
```
## 속성(Props)
- prop 이름은 항상 camelCase(소문자로 시작)를 사용합니다.
```jsx
// bad
<Foo
  UserName="hello"
  phone_number={12345678}
/>

// good
<Foo
  userName="hello"
  phoneNumber={12345678}
/>
```

- 명시적으로 true 값을 가지는 prop은 그 값을 생략할 수 있습니다. eslint: [`react/jsx-boolean-value`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-boolean-value.md)
```jsx
// bad
<Foo
  hidden={true}
/>

// good
<Foo
  hidden
/>

// good
<Foo hidden />
```
