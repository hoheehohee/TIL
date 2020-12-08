# Flutter Widget

```dart
void main() {
  runApp(MyApp());
}
```
- 최소한의 Flutter앱은 단순히 위젯과 함께 runApp() 함수를 호출한다.
- **rounApp()**함수는 주어진 Widget을 가져와 Widget tree의 루트로 만든다.
- 앱을 작성할 때 Widget이 상태를 관리하는지 여부에 따라 **StatelessWidget** 또는 **StatefulWidget**인 서브클래스로 새로운 위젯을 작성한다.

## Basic Widgets

### Text
- Text Widget을 사용하면 application 내에서 style이 지정된 텍스트를 만들 수 있다.
### Row, Column
- flex Widgets을 사용하면 hroizontal(Row) 및 vertical(Column) 방향으로 유여한 레이아웃을 만들 수 있다.
### Stack
- 가로 또는 세로 정렬된 방향 대신에, Stack Widget을 사용하여 Widget을 순서대로 다른 Widget 위에 중복으로 덮어서 배치할 수 있다.
- 그런 다음 Stack의 option항목에 Postioned Widget을 사용하여 위쪽, 오른쪽, 아래쪽 또는 왼쪽 가장자리를 기준으로 위치를 지정할 수 있다.
### Container
- Container Widget을 사용하면 직사각형 시각적 요소를 만들 수 있다.
- Container는 background, border 또는 shadow 같은 것을 BoxDecoraction으로 장식할 수 있다.
- Container는 그 크기에 적용되는 margin, padding 및 제약조건을 가질 수 있다.

### Scaffold
- 기본 Material Design visual layout 구조를 구현한다.
- 이 클래스는 drawers, snack bars 및 bottom sheet를 표시하기위한 API를 제공한다.
- Properties(속성)
    - appBar(PreferredSizeWidget): Scaffold 상단에 표시할 앱 바
    - backgroundColor(Color): 상단 앱바 생삭
    - body(Widget): 주된 content Widget

### Expanded
- Row, Column 또는 Flex의 자식을 확장하여 자식이 사용 가능한 공간을 채우도록하는 위젯

## Button Widgets

### RaisedButton
- flutter 가장 기본적인 버튼
- 이 클래스는 더 이상 사용되지 않는다. 대신 ElevatedButton을 사용해야 한다.