# VIPER Design Pattern in iOS, Swift4

## VIPER
### V: View, I: Interactor, P: Presenter, E: Entity, R: Router
1. View: view는 Presenter에게 사용자의 action을 보내고 Presenter가 무엇을 요청했는지 보여주는것.
2. Interactor: Data(Entity)에 대한 비즈니스 로직
3. Presenter: View와 Interactor의 중간 다리 역활로 View의 Life CyCle, Event, update 에 대한 처리,
4. Entity: 네트워크, DB 등의 데이터 모델, Intercator에서 사용
5. Router: View간의 전환, VIPER 컴포넌트들의 DI(dependency injection)을 담당

### View - Presenter
> View는 모든 사용자 상호 작용과 관련하여 Presenter와 통신하고 Presenter에게 이와 관련하여 필요한 처리를 수행하도록 요청한다.

### Presenter - Intercator
> Presenter는 사용자 작업 또는 데이터를 가져오는 작업과 관련하여 Interactor와 통신한다.

### Interactor - Presenter
> Interactor는 필요한 조치를 수행 한 비지니스 로직의 출력과 관련하여 Presenter와 통신한다.

### Presenter - View
> Presenter는 Interactor의 결과로 필요한 UI 변경 사항을 보기 위해 View와 통신한다.

### Presenter - Router
> Presenter는 페이지 간 탐색과 관련하여 Router와 통신한다.