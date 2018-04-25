
# HOC(Higher Order Component)
- HOF(Higher Order Function)에서 F 대신 C를 리턴하는 것
- 리액트 컴포넌트를 인자로 받아서 새로운 리액트 컴포넌트를 리턴하는 함수
	```javascript
	const HOC = ReactComponent => EnhancedReactComponent;
	```
	- EnhancedReactComponent : ReactComponent의 Props를 변경, 새로운 props를 추가 한다거나 아예 새로운 컴포넌트를 return할 수 있다.
- 활용 예)
	- **Container 컴포넌트(비지니스 로직 담당)와 Presentational 컴포넌트(디스플레이 담당) 분리**
	- **로딩 중 화면 표시**
	- **유저 인증 로직 처리**: 컴포넌트 내에서 권한 체크나 로그인 상태를 체크하기 보다는 인증 로직을 HOC로 분리하면 컴포넌트 재사용성을 높을 수 있고, 컴포넌트에서 역활 분리도 쉽다.
	- **에러 메세지 표시**: 컴포넌트 내에서 분기문(if/else등)을 통해 처리 할 수도 있지만, 분기문을 HOC로 만들어 처리

- HOC를 만들 때 지키면 좋은 규칙
	- 네이밍
		- Container HOC를 지외하고 새로운 prop을 주입 할 때 `with`로 시작하여 `withNewPropName`식으로 네이밍 하면 좋다.
		ex) withLoding, withAuth등
	- Display Name
		- [React Dev Tool](https://github.com/facebook/react-devtools) 등의 툴에서 디버킹을 위해 displayName을 명시 해주자.
	- render 메소드에 HOC를 사용하면 안된다.
		- render메소드를 사용하게 되면 매번 render 메소드가 실행 될 때마다 EnhancedReactComponent가 새로 만들어지게 된다.
			그렇게 때문에 HOC는 컴포넌트 외부에 선언 되어야 한다.
		- 기타 주의 사항은 [여기](https://reactjs.org/docs/higher-order-components.html#caveats)
