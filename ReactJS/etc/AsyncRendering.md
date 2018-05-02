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
- [Initializing state](#initializing-state)
- [Fetching external data](#fetching-external-data)
- [Adding event listeners (or subscriptions)](#adding-event-listeners (or subscriptions))
- [Updating state based on props](updating-state-based-on-props)
- [Invoking external callbacks](invoking-external-callbacks)
- [Side effects on props change](side-effects-on-props-change)

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

### Fetching external data
- 다음은 componentWillMount를 사용하여 외부 데이터를 가져 오는 component 예:
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

### Adding event listeners (or subscriptions)
- 다음은 마운트 할 때 외부 이벤트 디스패처에 subscribe하는 component의 예입니다.
	```javascript
	// Before
	class ExampleComponent extends React.Component {
	  componentWillMount() {
	    this.setState({
	      subscribedValue: this.props.dataSource.value,
	    });

	    // This is not safe; it can leak!
	    this.props.dataSource.subscribe(
	      this.handleSubscriptionChange
	    );
	  }

	  componentWillUnmount() {
	    this.props.dataSource.unsubscribe(
	      this.handleSubscriptionChange
	    );
	  }

	  handleSubscriptionChange = dataSource => {
	    this.setState({
	      subscribedValue: dataSource.value,
	    });
	  };
	}
	```
- 안타깝게도 이것은 서버 렌더링 (`componentWillUnmount`는 호출되지 않음) 및 비동기 렌더링 (렌더링이 완료되기 전에 중단되어 `componentWillUnmount`가 호출되지 않는 경우)에 대한 메모리 누수를 일으킬 수 있다.
- 사람들은 종종 `componentWillMount`와 `componentWillUnmount`가 항상 쌍으로 있다고 가정하지만 이는 보장되지 않는다. `componentDillMount`가 호출 된 후에 만 ​​React가 나중에 `componentWillUnmount`가 정리를 위해 호출되도록 보장한다.

- 따라서 listeners/subscriptions을 추가하는 권장 방법은 `componentDidMount` 라이프 사이클을 사용하는 것이다.
	```javascript
	// After
	class ExampleComponent extends React.Component {
	  state = {
	    subscribedValue: this.props.dataSource.value,
	  };

	  componentDidMount() {
	    // 이벤트 리스너는 마운트 후 추가하는 것이 안전하다,
	    // 마운트가 중단되거나 오류가 발생해도 누출되지 않는다.
	    this.props.dataSource.subscribe(
	      this.handleSubscriptionChange
	    );

	    // 외부 값은 렌더링과 마운트 사이에서 변경 될 수 있으며,
	    // 어떤 경우에는 이 case을 다루는 것이 중요 할 수 있다.
	    if (
	      this.state.subscribedValue !==
	      this.props.dataSource.value
	    ) {
	      this.setState({
	        subscribedValue: this.props.dataSource.value,
	      });
	    }
	  }

	  componentWillUnmount() {
	    this.props.dataSource.unsubscribe(
	      this.handleSubscriptionChange
	    );
	  }

	  handleSubscriptionChange = dataSource => {
	    this.setState({
	      subscribedValue: dataSource.value,
	    });
	  };
	}
	```

### Updating state based on props
- 레거시 componentWillReceiveProps 라이프 사이클을 사용하여 new props 값에 따라 state를 업데이트하는 component의 예:
	```javascript
	// Before
	class ExampleComponent extends React.Component {
	  state = {
	    isScrollingDown: false,
	  };

	  componentWillReceiveProps(nextProps) {
	    if (this.props.currentRow !== nextProps.currentRow) {
	      this.setState({
	        isScrollingDown:
	          nextProps.currentRow > this.props.currentRow,
	      });
	    }
	  }
	}
	```
- 위의 코드 자체는 문제가되지 않지만 `componentWillReceiveProps` lifecycle은 종종 문제를 일으키는 방식으로 잘못 사용된다. 이 때문에 이 메소드는 더 이상 사용되지 않는다.
- 버전 16.3부터, props 변경에 대한 응답으로 state를 업데이트하는 권장 방법은 새로운 정적 `getDerivedStateFromProps` lifecycle이다.
	(그 라이프 사이클은 컴포넌트가 생성 될 때마다 그리고 새로운 props을 받을 때마다 호출된다):
	```javascript
	// After
	class ExampleComponent extends React.Component {
	  // 생성자에서 상태 초기화,
	  // 또는 property initializer.
	  state = {
	    isScrollingDown: false,
	    lastRow: null,
	  };

	  static getDerivedStateFromProps(nextProps, prevState) {
	    if (nextProps.currentRow !== prevState.lastRow) {
	      return {
	        isScrollingDown:
	          nextProps.currentRow > prevState.lastRow,
	        lastRow: nextProps.currentRow,
	      };
	    }

	    // state를 변경하지 않는 것을 나타내는 경우는 null를 return
	    return null;
	  }
	}
	```
- 위의 예제에서 props.currentRow가 state에서 미러링 되었음을 알 수 있다 (state.lastRow와 같은).
	이렇게하면 `getDerivedStateFromProps`가 `componentWillReceiveProps`에서와 같은 방식으로 이전 props 값에 액세스 할 수 있습니다.
- `getDerivedStateFromProps`의 매개 변수로 이전 props을 전달하지 않는 이유가 궁금 할 수 있다. API를 디자인 할 때이 옵션을 고려했지만 궁극적으로 다음 두 가지 이유로 결정했다.
	- prevProps 매개 변수는 처음으로 `getDerivedStateFromProps`가 호출 될 때 (인스턴스화 후) null이 되며 prevProps에 액세스 할 때마다 if-not-null 검사를 추가해한다.
	- 이전 props을 이 기능에 전달하지 않으면 이후 버전의 React에서 메모리를 확보하는 단계이다. (React가 이전 props을 수명주기에 전달할 필요가 없다면 이전 props 객체를 메모리에 보관할 필요가 없다.)
- 공유 component를 작성하는 경우 `react-lifecycles-compat` 폴리 필을 사용하면 새로운 `getDerivedStateFromProps` 라이프 사이클을 이전 버전의 React에서도 사용할 수 있다.

### Invoking external callbacks
- 다음은 내부 상태가 변경 될 때 외부 함수를 호출하는 component의 예:
	```javascript
	// Before
	class ExampleComponent extends React.Component {
	  componentWillUpdate(nextProps, nextState) {
	    if(this.state.someStatefulValue !== nextState.someStatefulValue) {
	      nextProps.onChange(nextState.someStatefulValue);
	    }
	  }
	}
	```
- 때때로 사람들은 `componentDillUpdate`가 실행될 때까지 다른 component의 상태를 업데이트 하기에는 너무 늦을 것 같다는 잘못된 생각으로 `componentWillUpdate`를 사용하는 경우가 있다.
	그렇지 않다. React는 `componentDidMount` 및 `componentDidUpdate` 중에 발생하는 setState 호출이 업데이트 된 UI를 보기 전에 플러시 되도록 한다.
	일반적으로 이와 같은 계단식 업데이트는 피하는 것이 좋지만 경우에 따라 필요하다.(예를 들어 렌더링 된 DOM 요소를 측정 한 후 툴팁을 배치해야하는 경우)
- 어느 쪽이든 비동기 모드에서이 목적으로 `componentWillUpdate`를 사용하는 것은 안전하지 않다. 외부 콜백이 단일 업데이트에 대해 여러 번 호출 될 수 있기 때문이다.
- 대신 `componentDidUpdate` 라이프 사이클은 업데이트 당 한 번만 호출 되도록 보장 되어야하므로 사용되어야한다.
	```javascript
	// After
	class ExampleComponent extends React.Component {
	  componentDidUpdate(prevProps, prevState) {
	    if(this.state.someStatefulValue !== prevState.someStatefulValue) {
	      this.props.onChange(this.state.someStatefulValue);
	    }
	  }
	}
	```

### Side effects on props change
- 위의 예와 마찬가지로, component가 변경되면 component에 부작용이 있을 수도 있다.
	```javascript
	// Before
	class ExampleComponent extends React.Component {
	  componentWillReceiveProps(nextProps) {
	    if (this.props.isVisible !== nextProps.isVisible) {
	      logVisibleChange(nextProps.isVisible);
	    }
	  }
	}
	```
- `componentWillUpdate`와 같이 `componentWillReceiveProps`는 단일 업데이트에 대해 여러 번 호출 될 수 있다.
