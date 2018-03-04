## toFixed(), toExponential(), toPrecision() 함수
- toFixed() 메소드는 결과 문자열의 소수점 이하 자릿수 개수를 인자와 똑같이 맞춘 문자열을 반환한다.
- toExponential() 메소드는 지수 표기법을 사용하여 소수점 앞에 숫자 하나와 소수점 뒤에 인자로 지정한 만큼의 자릿수를 놓는 방식으로 숫자를 문자열로 변환한다.
- toPrecision() 메소드는 여러분이 정희한 유효 자릿수로 숫자를 문자열로 변환 한다.
  ```javascript
  var n = 123456.789;
  n.toFixed(0);           // "123456"
  n.toFixed(2);           // "123456.78"
  n.toFixed(5);           // "123456.78900"
  n.toExponential(1);     // "1.2e+5"
  n.toExponential(3);     // "1.235e+5"
  n.toPrecision(4);       // "1.235e+5"
  n.toPrecision(10);      // "123456.7890"
  ```
