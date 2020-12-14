# Flutter Lifecyle

## 1. createState()
- flutter가 StateFulWidget을 빌드하다록 지시하면 즉시 호출된다.

## 2. mounted is true
- crerateState가 state 클래스를 생성하면 buildContext는 state에 할당 된다.
- BuildContext는 위젯이 배치된 위젯 트리의 위치를 단순화 한 것이다.
- 모든 위젯은 **bool**형식의 **this.mounted** 속성을 가지고 있으며 **buildContext**가 할당되면 true를 리턴, 위젯이 **unmounted** 상태일 때 **setState**를 호출하면 error가 발생

## 3. initState()
- 위젯이 생성될 때 처음으로 호출되는 메서드
- 오직 한번만 호출되며 반드시 super.initState()를 호출한다.

## 4. didChangeDependencies()
- **didChangeDependencies** 메서드는 위젯이 최초 생성될 때 **initState** 다음에 바로 호출된다.
- 또한 위젯이 의존하는 데이터의 객체가 호출될 때마다 호출된다. 
    - 예를 들면 업데이트되는 위젯을 상속한 경우, 공식문서 또한 상속한 위젯이 업데이트 될 때 네트워크 호출이 필요한 경우 유용하다고 한다.

## 5. build()
- 자주 주기적으로 호출 되며 필수이고 재정의 대상(@override)이다. 반드시 **Widget**를 리턴한다.

## 6. didUpdateWidget(Widget oldWidget)
- 상위 위젯이 변경되어 이 위젯을 다시 빌드해야하는 경우 호출 된다(다른 데이터를 제공 해야하기 때문)

## 7. setState()
- flutter 프레임워크 자체적, 또는 개발자로 부터 자주 호출된다.

## 8. deactivate()
- 이 메소드는 거의 사용되지 않는다.
- **deactivate()**는 tree에서 State가 제거 될 때 호출된다.

## 9. dispose()
- **dispose()**는 **State**객체가 제거 될 때 호출된다.

## 10. mounted is false
- 이 상태에서 **state** 객체는 결코 다시 mount되지 않으며, **setState()**가 호출되면 에러가 발생한다.