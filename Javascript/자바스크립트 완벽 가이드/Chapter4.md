## 기본 표현식 (4.1)
- 기본 표현식(primary expression)으로, 다른 표현식을 포함하지 않은 독립적 표현식
- 상수나 리터럴 값, 특정 키워드들 그리고 변수 참조를 말한다.
- 리터널 상수값
  ```javascript
  1.23          // 숫자 리터널
  'hello'       // 문자열 리터널
  /pattern/     // 정규 표현식 리터널
  ```
- 예약어 중 기본 표현식
  ```javascript
  true      // 불리언 true 값으로 평가
  false     // 불리언 false 값으로 평가
  null      // null 값으로 평가
  this      // '현재' 객체로 평가
  ```
- 변수를 있는 그대로 참조하는 형태
```javascript
i         // 변수 i의 값으로 평가
sum       // 변수 sum의 값으로 평가
undefined // undefined는 전역 변수로 null처럼 키워드가 아니다.
```
