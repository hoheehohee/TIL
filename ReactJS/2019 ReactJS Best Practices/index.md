# 2019 ReactJS Best Practices: 2019 ReactJS 모범사례

## What?
- 왜 ReactJS가 인기가 있는 이유는 무엇일까?
  - 함께 작업하기가 간단하기 때문이라고 생각합니다. 배우기 쉽고(물론 JSX,Redux, mobx등의 추가 라이브러리의 러닝커브가 있지만) 가상 DOM을 사용하여 성능에 최적화되어 있습니다.
  - 가상 DOM을 구현함으로써 ReactJS는 업데이트가 필요한 요소만 빠르게 re-render 할 수있는 방법을 렌더링 엔진이 제공합니다.
  - 결과적으로 ReactJS 개발자는 빠르고 쾌적하게 사용할 수있는 앱을 만들수 있습니다.

ReactJS는 Javascript를 사용하여 앱을 만드는 라이브러리 입니다. ReactJS에서 앱 빌드를 시작하려면 API를 배우고 Javascript를 알아야합니다.
JavaScript는 아마도 요즘 가장 인기있는 프로그래밍 언어 일 것입니다. ReactJS를 사용하면 개발자가 UI components에서 앱을 model과 describe(설명)할 수 있습니다. 그래서 우리는 무엇을 해야할지 정하고 ReactJS는 그 방법을 알고있습니다.

다음은 지난 5년 동안 Google의 몇 가지 트렌트입니다.

![image](https://miro.medium.com/max/700/1*zk2Dnw2vsSOVm4QN9B2sdw.png)

ReactJS의 주요 개념 중 하나는 재사용이 가능하다는 것과 그것을 결합하여 앱을 구성할 수 있는 component를 만들수 있습니다는 것입니다. state-less 경우 각 component는 자체 state를 가질 수 있습니다.(나중에 이것에 대해 더 자세히.)
ReactJS는 모든 component들을 하나의 buket으로 수집하고 가상 DOM과 같은 최적화 기술(optimization techniques)을 적용하여 브라우저에 앱을 효율적으로 렌더링합니다.

component와 component가 아닌것을 명확히게 설명하는 것으로 시작하겠습니다. component는 self-sufficient(자급자족)하고 UI의 독집적인 부분입니다. 각 component는 state와 API가 있는 다른 component를 포함할 수 있습니다. 관례적으로 component관련 코드를 하나의 특정 폴더안에 보관해야합니다. 각 component의 모든 파일을 단일 폴더에 보관하면 재사용 가능한 component를 만들어 다른 앱에서 사용할 수 있습니다.

## ReactJS components의 유형(Types of ReactJS components)
ReactJS 컴포넌트에는 네 가지 주요 유형이 있습니다.
1. State-full or class-based components
2. State-less or function-based components
3. Presentational(프리젠테이션) (or high-order) components
4. Container components

![image](https://miro.medium.com/max/500/1*p1Ej4slk27NuCISlt0EcYA.png)
component tree 구조

### State-full components or class-based components
State-full components는 state 및 state와 관련된 데이터가 있습니다. state 또는 props 객체를 통해 이러한 유형의 component 내부에 데이터를 전달할 수 있습니다. State-full components는 일부 데이터를 유지하고 앱의 global state를 변경할 수 있으므로 support하기가 더 어렵습니다. 또한 state-full components는 대부분 생성자가있는 클래스 기반 구성 요소입니다.(생성자에서 component의 state를 설정하는 것이 모범 사례로 간주)

다음은 State-full, class-based ReactJS 구성 요소의 예입니다.

![image](https://miro.medium.com/max/700/0*1-H1z9phHWTRfze7.png)

Prop은 불변이며 state에 단방향으로 바인딩(묶여) 되어있기 때문에 컴포넌트 내에서 변경할 수 없습니다. 우리는 Props을 사용하여 component의 state를 설정하고 해당 UI를 렌더링합니다. 컴포넌트에서 Props을 변경하려고하면 TypeError가 발생합니다.

![image](https://miro.medium.com/max/700/1*81eK6pKH81DChtOV4CdjfQ.png)

state는 component에 노출되는 개체(object)입니다. State scope(상태범위)는 선언 된 component 내부로 제한됩니다. components는 state를 초기화하고 다른 component에 전달할 수 있습니다. 생성자를 사용하거나 state 속성을 선언하는 두 가지 방법으로 state를 선언 할 수 있습니다.
두 번째의 경우에는 그것은 단지 syntactic sugar, transpiler(예: Babel)는 state property(속성) 선언을 내부적으로 생성자로 바꿀 것입니다. State-less components or function-based components에 대한 React Hooks은 단순 Javascript 함수입니다. 함수 기반 component는 ReactJS element(요소) 또는 collection(컬렉션)을 반환하며, 이는 <> ... </>와 같은 'partial component(부분적 component)' 이거나 logic(로직) 및 임베디드 component가 있는 완전한 기능기반의 components입니다.
function-base component에서 생성자를 사용할 수 없기 때문에 (ReactJS v16.8 이후로 실제로 사용합니다) components를 state-full로 만들 수 없습니다. 이러한 유형의 components에서 데이터를 유지할 수 없기 때문에 state-less 방법으로 저장합니다. 대부분의 경우 UI를 렌더링하기 위해 function-based component에 props을 전달합니다.

다음은 state-less, function-based 기반 ReactJS 구성 요소의 예입니다.

![image](https://miro.medium.com/max/700/0*UjwffjIGdUgC7F6D.png)