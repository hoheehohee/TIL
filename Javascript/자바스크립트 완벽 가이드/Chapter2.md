## 리터널
 - 프로그램에 직접 나타나는 데이터 값이다.
 - <pre><code>12                       //숫자
   "hello word"             //문자열
   true                     //불리언 값
   /javascript/gi           //'정규 표현식' 리터널(패턴 매칭용)
   null                     //객체가 존재하지 않음
   </code></pre>

 ## 식별자와 예약어
  - 식별자는 간단히 말해 이름이다.
  - 자바스크립트 식별자는 시작은 알파벳(letter), 밑줄( _ ), 혹은 달러( $ ) 표시여야 한다.
    이어지는 문자들은 알파벳(letter)이나 숫자, 밑줄( _ ), 혹은 달러 ( $ )표시여야 한다.
  - <pre><code>i
    my_variable_name
    v13
    _dummy
    $str
    </pre></code>
  - 언어 내부적으로 사용할 용도로 **예약된 식별자**들이 있다.
  - '예약어는(reserved keyword)'는 식별자(변수명, 함수명, 레이블)로 사용할 수 없다.

  ## 예약어
   - 자바스크립트는 몇 가지 식별자를 미리 선점하고 있다.
   - <pre><code>break    delete    function    return    typeof
     case     do        if          switch    var
     catch    elae      in          this      void
     continue false     instanceof  throw     while
     debugger finally   new         true      with
     default  for       null        try
     class    const     enum        extends   import      super -> ECMAScript 5
     등등등..
     </pre></code>

  ## 선택적인 세미클론 사용
   - 문장을 구분하기 위해 세미클론을 사용한다.
   - 코드를 좀 더 의미 있게 만드는 측면에서 볼 때 중요하다.
   - 구분자가 없으면 한 문장의 끝에 다음 문장의 시작이 올 수 있고, 그다음 문장도 마찬가지다.
   - 두 문장이 각각 다른 줄에 작성되어 있으므로, 첫 행의 세미콜론은 생략할 수 있다.
   - <pre><code>a = 3;
     b = 4;
     </pre></code>
   - 첫 번째 세미클론이 반드시 필요 하다.
   - <pre><code>
     a = 3; b = 4;
     </pre></code>
   - <pre><code>var x = 0                            //세미콜론이 생략됐다.
     ;[x, x+1, x+2].forEach(console.log)  //문장 앞에 넣은 방어적인 세미콜론이
                                          //이 문장을 위의 문장과 구분하게 된다.
     </pre></code>
   - 다음 줄을 첫 줄의 문장과 이어서 하나로 처리할 수 없는 경우에만 줄바꿈을 세미콜론으로 해석한다는 일반 규칙에는 두 가지 예외가 있다.
   - <pre><code>return
     true;

     return; true;
     </pre></code>
   - return, break, continue와 다음에 오는 키워드 사이에 줄바꿈을 하지 말아햐 한다는 것.
   - 두 번째 예외는 ++나 --연산자가 포함된 경우
   - <pre><code>x
     ++
     y
     //위 코드는 x++; y가 아니라 x; ++y로 해석된다.
     </pre></code>
