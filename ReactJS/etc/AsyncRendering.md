# Update on Async Rendering

## 비동기 렌더링을 위해 components 사용하는데 도움이되는 몇가지 방법
- legacy component lifecycles의 일부가 안전하지 않은 코딩 방법을 사용하는 경향이 있다. 그들은
	1. `componentWillMount`
	2. `componentWillReceiveProps`
	3. `componentWillUpdate`
- 이러한 라이프 사이클 방법은 자주 오용되거나 미묘하게 잘못 쓰이고 있었다. 또한 비동기 렌더링을 사용하면 잘못 쓰이게 될 가능성이 더 커질 수 있다.
- 이 때문에 앞으로 출시 될 라이프 사이클에 "UNSAFE_"접두사를 추가 할 것이다.
	에서기 "unsafe"은 보안을 의미하는 것이 아리나 향후 버전에서 버그가 발생할 가능성이 더 높다는 의미이다.(특히 비공기 렌더링이 활성화 되면...)

## Gradual Migration Path(점차 마이그레이션의 방법)
- React는 의미 있는 버전 관리를 위하여 점차적 진행할 계획으로 현재 계획은 다음과 같다.
	- 16.3: 안전하지 않은 라이프 사이클 UNSAFE_componentWillMount, UNSAFE_componentWillReceiveProps 및 UNSAFE_componentWillUpdate에 대하여 별칭 도입
		(이 버전에서는 이전 라이브 사이클 이름과 새 별칭 모두 작동 한다.)
	- 16.x 릴리즈 : componentWillMount, componentWillReceiveProps 및 componentWillUpdate에 대한 지원 중단을 경고 한.
		(이 릴리즈에서는 이전 라이프 사이클 이름과 새 별칭이 모두 작동하지만 이전 이름은 DEV 모드에서 경고를 기록한다.)
	- 17.0 : componentWillMount, componentWillReceiveProps 및 componentWillUpdate를 제거한다.
		(이 시점부터 새로운 "UNSAFE_"라이프 사이클 이름 만 사용할 수 있다.)
- React 개발자라면 아직 레거시 메소드에 대해 아무것도 하지 않아도 된다. 16.3 릴리스의 주요 목적은 오픈소스 프로젝트 관리자가 더 이상 사용하지 않는 라이플 사이클에 대한 경고보다 먼저 라이브러리를 업데이트 할 수 있게하는 것이다.

## Migrating from Legacy Lifecycles (레거시 라이플사이클 마이그레이션)
- React 16.3에 소개 된 새로운 컴포넌트 API를 사용하기를 원한다면
- 시간이 지남에 따라 문제가 있는 lifecycles를 사용 하지 않는 방식으로 일반적인 작업을 수행하는 방법을 보여주는 "recipes"를 문서에 추가 할 계획.
- 16.3에서 추가 된 라이프 사이클 변경 사항
	- 다음과 같은 별칭을 추가: `UNSAFE_componentWillMount`, `UNSAFE_componentWillReceiveProps`, and `UNSAFE_componentWillUpdate`.
		(이전 라이프 사이클 이름과 별칭이 모두 지원 됩니다.)
	- 두 가지 새로운 라이프 사이클: `getDerivedStateFromProps` and `getSnapshotBeforeUpdate`

	#### New lifecycle: getDerivedStateFromProps
	```javascript
	class Example extends React.Component {
	  static getDerivedStateFromProps(nextProps, prevState) {
	    // ...
	  }
	}
	```
	- 새로운 `getDerivedStateFromProps` 라이프 사이클은 component가 인스턴스화 된 후 새로운 `props`를 받을 때 호출 된다.
		`state`을 update하는 object를 return 해줄 수도 있고 새로운 `props` `state` update을 요구하지 않음을 나타내기 위해 null를 return 할 수도 있다.
	- `componentDidUdate`와 함께 이 새로운 라이프 사이클은 legacy `componentWillReceiveProps`의 모든 사용 사례를 다루어야 한다.

	#### New lifecycle: getSnapshotBeforeUpdate
	```javascript
	class Example extends React.Component {
	  getSnapshotBeforeUpdate(prevProps, prevState) {
	    // ...
	  }
	}
	```
	- 새로운 `getSnapshotBeforeUpdate` 라이프 사이클은 변화가 일어나기 바로 전에 호출 된다.( ex) DOM이 업데이트 되기 전에)
	- 이 라이프 사이클의 반환 값은 세 번째 매개 변수로 `componentDidUdate`에 전달 된다.(이 라이프 사이클은 자주 필요하지는 않지만 rerenders 동안 스크롤 위치를 수동으로 유지하는 경우에 유용 할 수 있다.)
	- `componentDidUdate`와 함께 이 새로운 라이프 사이클은 legacy `componentWillUpdate`의 모든 사용 사례를 다루어하 한다.

## Examples
- [Initializing state](#Initializing)
- [Fetching external data](#Fetching)

### Initializing state
- 이 예는 componentWillMount 내부에 setState 호출이 있는 component를 부여 준다.
	```javascript
	// Before
	class ExampleComponent extends React.Component {
	  state = {};

	  componentWillMount() {
	    this.setState({
	      currentColor: this.props.defaultColor,
	      palette: 'rgb',
	    });
	  }
	}
	```
- 이 유형의 컴포넌트에 대한 가장 간단한 리팩터는 상태 초기화를 constructor 또는 속성 초기화 작성하는 것이 좋다.
	```javascript
	// After
	class ExampleComponent extends React.Component {
	  state = {
	    currentColor: this.props.defaultColor,
	    palette: 'rgb',
	  };
	}
	```

### Fetching external data(외부 데이터 가져 오기)
- 다음은 componentWillMount를 사용하여 외부 데이터를 가져 오는 component 예입니다.
	```javascript
	// Before
	class ExampleComponent extends React.Component {
	  state = {
	    externalData: null,
	  };

	  componentWillMount() {
	    this._asyncRequest = asyncLoadData().then(
	      externalData => {
	        this._asyncRequest = null;
	        this.setState({externalData});
	      }
	    );
	  }

	  componentWillUnmount() {
	    if (this._asyncRequest) {
	      this._asyncRequest.cancel();
	    }
	  }

	  render() {
	    if (this.state.externalData === null) {
	      // Render loading state ...
	    } else {
	      // Render real UI ...
	    }
	  }
	}
	```
- 위의 코드는 서버 렌더링(외부 데이터가 사용되지 않음)과 다가오는 비동기 렌더링 모드(요청이 여러번 시작 될 수 있음) 모두 문제가 있다.
- 대부분의 사용 사례에서 권장되는 업그레이드 경로는 데이터 가져 오기를 `componentDidMount`로 이동하는 것이다.
	```javascript
	// After
	class ExampleComponent extends React.Component {
	  state = {
	    externalData: null,
	  };

	  componentDidMount() {
	    this._asyncRequest = asyncLoadData().then(
	      externalData => {
	        this._asyncRequest = null;
	        this.setState({externalData});
	      }
	    );
	  }

	  componentWillUnmount() {
	    if (this._asyncRequest) {
	      this._asyncRequest.cancel();
	    }
	  }

	  render() {
	    if (this.state.externalData === null) {
	      // Render loading state ...
	    } else {
	      // Render real UI ...
	    }
	  }
	}
	```
- `componentWillMount`를 가져 오면 첫 번째 빈 렌더링 상태를 피할 수 있다는 오해가 있다.
	실제로 React는 항상 `componentWillMount` 바로 다음에 렌더링을 수행하기 때문에 이것은 결코 사실이 아니 었다.
	`componentWillMount`가 실행될 때까지 데이터를 사용할 수 없는 경우 가져 오기를 시작한 위치와 상관없이 첫 번째 렌더링이 로드 상태를 계속 표시합니다.
	따라서 가져 오기를 `componentDidMount`로 이동하면 대부분의 경우 인식 할 수 있는 효과가 없습니다.
