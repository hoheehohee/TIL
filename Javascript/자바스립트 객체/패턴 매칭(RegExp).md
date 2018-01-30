## RegExp 객체
 - 패턴
 - <pre><code>/^HTML/              // HTML로 시작하는 문자열
   /[1-9][0-9]*/        // 0 아닌 숫자로 시작하는 숫자
   /\bjavascript\b/*    // 대소문자 구별 없이 javascript와 일치하는 문자열
   </pre></code>

 - RegExp 객체의 유용한 메서드
 - <pre><code>var text = "testing: 1, 2, 3"        // 간단한 문자열
   var pattern = /\d+/g                 // 하나 이상의 모든 숫자와 일치
   pattern.test(text)                   // => true: 일치하는 문자열이 존재
   text.search(pattern)                 // => 9: 첫 번째로 매치하는 문자열이 위치
   text.match(pattern)                  // => ['1', '2', '3']: 일치된 항목의 배열
   text.replace(pattern, "#")           // => 'testing: #, #, #'
   text.split(/\D+\);                   // => ['', '1', '2', '3']: 숫자가 아닌 문자(열)를 기준으로 분할
   </pre></code>
