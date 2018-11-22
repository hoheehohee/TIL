## forecUpdate()

```
component.forceUpdate(callback)
```
- 기본적으로 components state와 prpos가 변경괴면 component가 다시 렌더링 된다.
- render() 메서드가 다른 일부 데이터와 의존하는 경우 react에 forceUpdate()를 호출하여 구성요소를 다시 렌더링해야한다고 알릴 수 있다.
- forceUpdate()를 호출하면 shouldComponentUpdate()를 건너 뛰고 component에서 render()가 호출 된다.
- 이렇게하면 각 자식의 shouldComponentUpdate() 메서드를 비롯하여 자식 component의 일반적인 lifecycle 메서드가 트리거 된다.
- Markup이 변경되면 React는 여전히 DOM만 업데이트 한다.
- 일반적으로 forceUpdate()의 모든 사용을 피하고 render()의 this.props 및 this.state에서 읽기만 시도해야 한다.