## 날짜와 시간 객체 Date객체
 - 날짜 계산을 하는 메서드를 가지고 있다.
 - <pre><code>var then = new Date(2010, 0, 1);             //2010년 1월 1일
   var later = new Date(2010, 0, 1, 17, 10, 30) //2010년 1월 1일 오후 5시 10분 30초

   var now = new Date()       // 현재 날짜와 시간
   var elapsed = new - then   // 밀리초로 날짜 계산

   later.getFullYear()        // => 2010
   later.getMonth()           // => 0: 월은 0부터 시작한다.
   later.getDate()            // => 1: 일은 1로 시작한다.
   later.getDay()             // => 5: 요일. 0은 일요일, 5는 금요일
   later.getHours()           // => 17: 오후 5시
   later.getUTCHours          // 시간대에 의혼한 UTC 시간
   later.toString()           // => 'Fri Jan 01 2010 17:10:30 GMT-0800 (PST)'
   later.toUTCString()        // => 'Sat, 02 Jan 2010 01:10:30 GMT'
   later.toLocaleDateString() // => '01/01/2010'
   later.toLocaleTimeString() // => '05:10:30 PM'
   later.toISOString()        // => '2010-01-02T01:10:30.000Z'
   </pre></code>
