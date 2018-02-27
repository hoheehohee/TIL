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

##정렬(Aligment)
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

## 따옴표(Quotes)
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

## 띄어쓰기(Spacing)
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
- `<img>` 태그에는 항상 `alt` 속성을 작성한다. 만약 이미지가 표현 가능하다면, `alt` 값은 빈 문자열이 될 수 있거나 `<img>`는 반드시 `role="presentation"` 속성을 가지고 있어야 한다. eslint: [`jsx-a11y/img-has-alt`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/img-has-alt.md)

    ```jsx
    // bad
    <img src="hello.jpg" />

    // good
    <img src="hello.jpg" alt="Me waving hello" />

    // good
    <img src="hello.jpg" alt="" />

    // good
    <img src="hello.jpg" role="presentation" />
    ```

  - `<img>` 태그의 `alt` 속성 값으로 "image", "photo", "picture" 와 같은 단어를 사용하면 안 된다. eslint: [`jsx-a11y/img-redundant-alt`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/img-redundant-alt.md)

  > 왜? 스크린리더는 이미 `img` 태그를 이미지로 인지하고 있기 때문에, alt 속성 값에 반복으로 해당 정보를 포함할 필요가 없다.

    ```jsx
    // bad
    <img src="hello.jpg" alt="Picture of me waving hello" />

    // good
    <img src="hello.jpg" alt="Me waving hello" />
    ```

  - role 속성 값으로는 검증이 가능하고, 추상적이지 않은 값을 사용하라. [ARIA roles](https://www.w3.org/TR/wai-aria/roles#role_definitions). eslint: [`jsx-a11y/aria-role`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/aria-role.md)

    ```jsx
    // bad - not an ARIA role
    <div role="datepicker" />

    // bad - abstract ARIA role
    <div role="range" />

    // good
    <div role="button" />
    ```

  - 엘리먼트에 `accessKey` 속성을 사용하면 안 된다. eslint: [`jsx-a11y/no-access-key`](https://github.com/evcohen/eslint-plugin-jsx-a11y/blob/master/docs/rules/no-access-key.md)

  > 왜? 키보드 단축값을 사용하는 스크린 리더 유저와 일반 키보드 유저간의 일관성이 없어져서 접근성을 복잡하게 만들기 때문이다.

  ```jsx
  // bad
  <div accessKey="h" />

  // good
  <div />
  ```

  - 배열의 인덱스를 `key` 속성 값으로 사용하는 것을 피하고, 유니크한 ID 값을 사용하라. ([why?](https://medium.com/@robinpokorny/index-as-a-key-is-an-anti-pattern-e0349aece318))

  ```jsx
  // bad
  {todos.map((todo, index) =>
    <Todo
      {...todo}
      key={index}
    />
  )}

  // good
  {todos.map(todo => (
    <Todo
      {...todo}
      key={todo.id}
    />
  ))}
  ```

## 참조

  - 항상 참조 콜백 함수를 사용하라. eslint: react/no-string-refs

    ``` jsx
    // bad
    <Foo
      ref="myRef"
    />

    // good
    <Foo
      ref={(ref) => this.myRef = ref}
    />
    ```

## 괄호

  - 만약 JSX 태그가 두 줄 이상으로 늘어난다면 괄호로 감싸야 한다. eslint: [`react/wrap-multilines`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/wrap-multilines.md)

    ```jsx
    // bad
    render() {
      return <MyComponent className="long body" foo="bar">
               <MyChild />
             </MyComponent>;
    }

    // good
    render() {
      return (
        <MyComponent className="long body" foo="bar">
          <MyChild />
        </MyComponent>
      );
    }

    // good, 한 줄이라면 괜찮다.
    render() {
      const body = <div>hello</div>;
      return <MyComponent>{body}</MyComponent>;
    }
    ```

## 태그

  - 자식 컴포넌트가 없으면 항상 닫힘 태그를 사용한다. eslint: [`react/self-closing-comp`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/self-closing-comp.md)

    ```jsx
    // bad
    <Foo className="stuff"></Foo>

    // good
    <Foo className="stuff" />
    ```

  - 만약 컴포넌트가 다수의 속성을 가졌다면, 닫힘 태그는 새로운 줄에 작성한다. eslint: [`react/jsx-closing-bracket-location`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-closing-bracket-location.md)

    ```jsx
    // bad
    <Foo
      bar="bar"
      baz="baz" />

    // good
    <Foo
      bar="bar"
      baz="baz"
    />
    ```

## 메소드

  - 지역 변수를 둘러싸기 위해서는 화살표 함수를 사용해라.

    ```jsx
    function ItemList(props) {
      return (
        <ul>
          {props.items.map((item, index) => (
            <Item
              key={item.key}
              onClick={() => doSomethingWith(item.name, index)}
            />
          ))}
        </ul>
      );
    }
    ```

  - render 메소드에 사용되는 이벤트 핸들러는 생성자에 바인드 해라. eslint: [`react/jsx-no-bind`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-bind.md)

    > 왜? render 메소드 내에서 bind를 사용하게게 될 경우에는 새로운 렌더링마다 새로운 함수가 생성되기 때문이다.

      ```jsx
      // bad
      class extends React.Component {
        onClickDiv() {
          // do stuff
        }

        render() {
          return <div onClick={this.onClickDiv.bind(this)} />
        }
      }

      // good
      class extends React.Component {
        constructor(props) {
          super(props);

          this.onClickDiv = this.onClickDiv.bind(this);
        }

        onClickDiv() {
          // do stuff
        }

        render() {
          return <div onClick={this.onClickDiv} />
        }
      }
      ```

  - 리엑트 컴포넌트의 내부 메소드를 위해 언더바 문자를 사용하면 안 된다.

    ```jsx
    // bad
    React.createClass({
      _onClickSubmit() {
        // do stuff
      },

      // other stuff
    });

    // good
    class extends React.Component {
      onClickSubmit() {
        // do stuff
      }

      // other stuff
    }
    ```

  - `render` 메소드에서는 값을 리턴해야 한다. eslint: [`require-render-return`](https://github.com/yannickcr/eslint-plugin-react/pull/502)

    ```jsx
    // bad
    render() {
      (<div />);
    }

    // good
    render() {
      return (<div />);
    }
    ```

## 순서

  - `class extends React.Component` 를 위한 순서:

  1. 선택적인 `static` 메소드
  1. `constructor`
  1. `getChildContext`
  1. `componentWillMount`
  1. `componentDidMount`
  1. `componentWillReceiveProps`
  1. `shouldComponentUpdate`
  1. `componentWillUpdate`
  1. `componentDidUpdate`
  1. `componentWillUnmount`
  1. *클릭 핸들러나 이벤트 핸들러* like `onClickSubmit()` or `onChangeDescription()`
  1. *`render`를 위한 게터 메소드* like `getSelectReason()` or `getFooterContent()`
  1. *선택적인 렌더 메소드* like `renderNavigation()` or `renderProfilePicture()`
  1. `render`

  - `propTypes`, `defaultProps`, `contextTypes`, etc... 를 정의하는 방법

    ```jsx
    import React, { PropTypes } from 'react';

    const propTypes = {
      id: PropTypes.number.isRequired,
      url: PropTypes.string.isRequired,
      text: PropTypes.string,
    };

    const defaultProps = {
      text: 'Hello World',
    };

    class Link extends React.Component {
      static methodsAreOk() {
        return true;
      }

      render() {
        return <a href={this.props.url} data-id={this.props.id}>{this.props.text}</a>
      }
    }

    Link.propTypes = propTypes;
    Link.defaultProps = defaultProps;

    export default Link;
    ```

  - `React.createClass` 를 위한 순서: eslint: [`react/sort-comp`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/sort-comp.md)

  1. `displayName`
  1. `propTypes`
  1. `contextTypes`
  1. `childContextTypes`
  1. `mixins`
  1. `statics`
  1. `defaultProps`
  1. `getDefaultProps`
  1. `getInitialState`
  1. `getChildContext`
  1. `componentWillMount`
  1. `componentDidMount`
  1. `componentWillReceiveProps`
  1. `shouldComponentUpdate`
  1. `componentWillUpdate`
  1. `componentDidUpdate`
  1. `componentWillUnmount`
  1. *클릭 핸들러나 이벤트 핸들러* 예시. `onClickSubmit()` 혹은 `onChangeDescription()`
  1. *`render`를 위한 게터 메소드* 예시. `getSelectReason()` 혹은 `getFooterContent()`
  1. *선택적인 렌더 메소드* 예시. `renderNavigation()` 혹은 `renderProfilePicture()`
  1. `render`

## `isMounted`

  - `isMounted` 를 사용하면 안 된다. eslint: [`react/no-is-mounted`](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/no-is-mounted.md)

  > 왜? `isMounted` 은 [안티 패턴이고,][anti-pattern] ES6 클래스 문법에 적용할 수 없을 뿐더러, 공식적으로 사라지게 될 예정이다.

  [anti-pattern]: https://facebook.github.io/react/blog/2015/12/16/ismounted-antipattern.html
