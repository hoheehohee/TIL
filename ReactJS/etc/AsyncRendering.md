# Update on Async Rendering

### 비동기 렌더링을 위해 components 사용하는데 도움이되는 몇가지 방법
- legacy component lifecycles의 일부가 안전하지 않은 코딩 방법을 사용하는 경향이 있다. 그들은
	1. `componentWillMount`
	2. `componentWillReceiveProps`
	3. `componentWillUpdate`
- 이러한 라이프 사이클 방법은 자주 오용되거나 미묘하게 잘못 쓰이고 있었다. 또한 비동기 렌더링을 사용하면 잘못 쓰이게 될 가능성이 더 커질 수 있다.
- 이 때문에 앞으로 출시 될 라이프 사이클에 "UNSAFE_"접두사를 추가 할 것이다.
	에서기 "unsafe"은 보안을 의미하는 것이 아리나 향후 버전에서 버그가 발생할 가능성이 더 높다는 의미이다.(특히 비공기 렌더링이 활성화 되면...)

### Gradual Migration Path(점차 마이그레이션의 방법)
- React는 의미 있는 버전 관리를 위하여 점차적 진행할 계획으로 현재 계획은 다음과 같다.
	- 16.3: 안전하지 않은 라이프 사이클 UNSAFE_componentWillMount, UNSAFE_componentWillReceiveProps 및 UNSAFE_componentWillUpdate에 대하여 별칭 도입
		(이 버전에서는 이전 라이브 사이클 이름과 새 별칭 모두 작동 한다.)
	- 16.x 릴리즈 : componentWillMount, componentWillReceiveProps 및 componentWillUpdate에 대한 지원 중단을 경고 한.
		(이 릴리즈에서는 이전 라이프 사이클 이름과 새 별칭이 모두 작동하지만 이전 이름은 DEV 모드에서 경고를 기록한다.)
	- 17.0 : componentWillMount, componentWillReceiveProps 및 componentWillUpdate를 제거한다.
		(이 시점부터 새로운 "UNSAFE_"라이프 사이클 이름 만 사용할 수 있다.)
