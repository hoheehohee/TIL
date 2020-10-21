# 2019 ReactJS Best Practices: 2019 ReactJS 모범사례

## 1. What?
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

## 2. ReactJS components의 유형(Types of ReactJS components)
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

다음은 state-less, function-based 기반 ReactJS component의 예입니다.

![image](https://miro.medium.com/max/700/0*UjwffjIGdUgC7F6D.png)

성능관점에서 보면 class-based components를 사용하는 것과 function-based components를 사용하는 것 사이에는 거의 차이가 없습니다. 
ReactJS 렌더링 메커니즘은 우리를 위해 최적화 할만큼 똑똑합니다.

function-based components는 작업하기 쉽고 테스트하기 더 편리합니다. 
이것이 ReactJS 개발자 커뮤니티가 class-based components 대신 function-based components를 작성하도록 유도하는 이유입니다. 
state-less function-based components에는 몇 가지 제한 사항이 있으며 기본적으로 state를 관리하기 위한 하나의 전역 위치(global place)가 있어야합니다. 이는 컴포넌트 작성의 ReactJS 패러다임과 다릅니다 (자세한 내용은 아래 참조).

개발자가 state-full, function-based components를 작성하는 동시에 state 및 component life-cycle methods를 사용할 수 있는 기능을 제공하기 위해 React v16.8은 React Hooks라는 새로운 기능을 추가했습니다.

본질적으로 React Hooks는 class-based components를 제거하려는 시도입니다. 
React Hooks를 사용하면 class를 사용하지 않고도 state-full function-based를 작성할 수 있습니다. 아마도 우리는 앞으로 어느 시점에서 Hooks로 제거 된 class-based components를 보게 될 것입니다.

React Hooks는 클래스로 선언되었지만 생성자가 없거나 필요하지 않은 컴포넌트를 피함으로써 애플리케이션 디자인을 단순화하는 것을 목표로합니다. 앱의 이상적인 디자인을 생각하면 대부분 state-less components로 작업합니다. 클라이언트용 ReactJS 앱을 빌드 할 때 일반적으로 컴포넌트 표현과 애플리케이션 로직 사이에 얇은 레이어를 사용합니다. 이를 통해 컴포넌트의 시각적 표현과 동작을 분리 할 수 ​​있습니다.

## 3. Data-Down, Actions-Up
«Data Down, Actions Up»디자인 패턴은 무엇입니까? 본질적으로 이는 'props'의 데이터를 받아들이고 해당 데이터를 뷰 또는 nested(중첩) components로 전달하는 Higher-Order Component (HOC-아래 설명 참조)가 있음을 의미합니다.  
components와 interact(상호작용)하기 위해 사용자는 버튼 누르기와 같은 작업을 트리거(trigger)하고 component는 이벤트를 생성하여 해당 interact(상호작용)에 응답합니다. 즉, 데이터가 전달 된 방식과 반대 방향으로 이벤트를 트리거합니다.

이러한 이벤트 또는 작업은 parent component로 전달됩니다. parent component는 global application state를 변경하는 다른 작업을 트리거(trigger)합니다.

## 4. Higher-Order Component(HOC)  
Higher-Order Component(또는 HOC)는 기본적으로 데코레이터 패턴(Decorator Pattern)이라고도하는 디자인 패턴입니다.  
ReactJS에서 HOC는 추가 기능이나 추가 속성을 추가하여 다른 component를 감싸는 component입니다. 이를 통해 일반적으로 사용되는 일부 로직(logic)에서 abstraction(추상화)를 허용하고 코드를 DRY로 유지합니다.  
ReactJS의 다른 component사이에 복잡한 components 구조를 나누는 방법이며 애플리케이션 로직과 UI를 분리하는 방법입니다.  
예를 들어, 프레젠테이션용 Button component에 대한 HOC로 컨테이너 component를 사용할 수 있습니다.

다음은 HOC ReactJS 구성 요소의 예입니다.

![image](https://miro.medium.com/max/700/0*w-QLTAF5W7i42jZs.png)

## 5. Container components
반면에 Container components에는 state를 설정하는 로직이 있거나 parent component까지 이벤트를 내보내는 기능이 있습니다.  
일전적인 규칙은 Single Responsibility Principle(단일 책임 원칙)을 염두에두고 component를 최대한 단순하게 유지하는것이 좋습니다. 이는 본질적으로 component가 한 가지를 일을 해야하며 잘 해야한다는 뜻입니다.  
대부분의 경우 이러한 유형의 components는 몇 가지 presentational(표현) components를 수용하는 HOC입니다. Presentational components를 간단한 component로 작성하면 전체 응용 프로그램의 복잡성을 줄일 수 있습니다. 여기서 Presentational component들이 작용합니다. 이러한 component에는 최소한의 로직이 있어야합니다.  
Presentational components는 데이터를 받아들이고 Props의 일부로 수신하는 callback event를 내보냅니다. 기본적으로 이러한 유형의 component는 UI를 렌더링하고 UI에서 일부 작업이 발생할 때 전달 된 함수를 실행합니다.  
기본적으로 이러한 유형의 component는 UI를 렌더링하고 UI에서 일부 작업이 발생할 때 전달 된 함수를 실행합니다. 이러한 유형의 component는 building block(빌딩 블록)이며 때때로  Lower-Order Component(하위 구성 요소) (또는 LOC)라고도 합니다.

## 6. Best Practices List (모범 사례 목록)
- ReduxJS를 사용할 때 Reducer 코드를 더 작은 메서드로 분할하여 Reducer 내에서 거대한 JSON을 피하십시오.
- 아직 사용하지 않은 경우 앱에서 TypeScript를 사용하는 것이 좋습니다.
- create-react-app 생성기를 사용하여 ReactJS 앱을 부트스트랩 합니다.
- 코드를 DIY하게 유지하십시오. 반복하지 마세요. 하지만 코드 중복이 항상 나쁜 것은 아닙니다.
- Reducer를 포함하여 large classes, 메서드 또는 components를 사용하지 마십시오.
- 더 robust managers(강력한 관리자)를 사용하여 Redux와 같은 애플리케이션 State를 관리합니다.
- 백엔드 API와의 상호 작용을 위해 Redux-Thunk와 같은 이벤트 동기화기를 사용하십시오.
- 너무 많은 attributes(속성)이나 agruments(인수)를 전달하지 마십시오. 컴포넌트에 전달하는 Props을 5개로 제한하십시오.
- ReactJS defaultProps 및 ReactJS propTypes를 사용하십시오.
- linter를 사용하고 너무 긴 줄을 끊습니다.
- 고유 한 jslint 구성 파일을 유지하십시오.
- 항상 NPM 또는 yarn과 같은 lock file과 함께 dependency manager를 사용하십시오.
- 일반적으로 accessed하는 코드, 복잡하고 버그가 발생하기 쉬운 코드를 테스트합니다.
- 약간의 노력으로 코드에 대해 더 많은 테스트 범위를 제공하는 더 많은 테스트를 작성하고 코드가 제대로 작동하는지 테스트하십시오.
- 버그를 찾을 때마다 먼저 테스트를 작성해야합니다.
- state-full components를 만드는 새로운 ReactJS 방식인 React Hooks를 사용하여 function-based components를 사용하십시오.
- Props에 ES6 de-structuring를 사용하십시오.
- conditional rendering(조건부 렌더링)을 사용합니다.
- component collection를 collect(수집)하고 렌더링하려면 "map()"을 사용하십시오.
- "<>"…"</>"과 같은 부분 components를 사용
- "handleClick()" 또는 "handleUpdate()"와 같은 핸들 접두사를 사용하여 이벤트 핸들러의 이름을 지정합니다.
- onChange를 사용하여 "onChange={this.handleInputChange}"와 같은 입력을 제어하십시오.
- JEST를 사용하여 ReactJS 코드를 테스트하십시오.

Redux-Thunk와 같은 이벤트 동기화기를 언급했습니다. ReactJS v16.3은 React Context API라는 새로운 기능을 도입했습니다.

다음은 defaultProps 및 propTypes를 사용하는 예입니다.

![image](https://miro.medium.com/max/700/0*jRKmcUovWbWh9tkt.png)

## 7. Conclusion
이 기사가 2019 년에 매우 인기있는 ReactJS 모범 사례와 패턴에 대한 정보를 제공하기를 바랍니다.