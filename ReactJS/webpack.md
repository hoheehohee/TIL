# webpack-dev-server (개발모드)
## hot vs inline webpack-dev-server options
-----
 - inline: 전체 페이지에 대한 실시간 리로딩("Live Reloading") 옵션
 - hot: 컴포넌트가 수정 될 경우 그 수정된 부분만 리로드 해주는 부분 모듈 리로딩("Hot Module Reloading") 옵션
 - 만약 두개 옵션을 모두 지정할 경우 "Hot Module Reloading"이 처음 발생한고. 그리고 "Hot Module Reloading"이 안되면 전체 페이지를 리로딩한다.


## "entry" [String Vs Array Vs Object]
-----
 - **entry** 는 root모듈 또는 시작 지점이 무엇인지 Webpack에게 알려 준다.
 - **entry** 는 String, Array, Object 형태로 될 수 있다.

   > **enrty - Array**
    의존성이 없이 여러개의 파일을 사용하고 싶다면 Array 형식으로 사용하면된다.
    예를 들어 HTML에 "googleAnlystic.js"가 필요 할수 있다. 그러면 "bundle.js" 끝에 다음과 같이 추가하도록 지정하면 원하는 output이 된다.

    ```javascript
    {
      enrty: ['./public/src/index.js', './public/src/googleAnlystic/js'],
      output: {
        path: '/dist',
        filename: 'bundle.js'
      }
    }
    ```

    > **entry-object**
     만약 당신이 SPA(Single Page App)가 아니라 다중 페이지 어플리케이션을 개발한다면, entry-object를 사용하여 한번에 다중 bundle을 만들어 사용할 수 있다.
     아래 설정 파일은 2개의 bundle JS파일을 생성한다.(indexEntry.js, profileEntry.js가 나오며 index.html, profileEntry.html에 각각에 사용할 수 있다.)

     ```javascript
     {
       entry: {
         "indexEntry": './public/src/index.js',
         "profileEntry": './public/src/profile.js'
       },
       output: {
         path: './dist',
         filename: '[name].js'  // indesEntry.js & profileEntry.js
       }
     }
     ```
     > Usage:

     ```html
     // profile.html
     <script src="dist/profileEntry.js"></script>
     // index.html
     <script src="dist/indexEntry.js"></script>
     ```
     > Note: "entry"의 객체 key가 파일 이름으로 매핑된다.


    > **entry-combination**
     당신은 enrty Object안에 Array 타입을 사용할 수 있다. 예를 들어 아래 설정을 보면 3가지 파일이 생성된다.
     (3개의 파일이 있는 vendor.js와 index.js, profile.js가 생성된다.)

     ```javascript
     {
       entry: {
         "vendor": ['jquery', 'analytics.js', 'optimizely.js'],
         "index": './public/src/index.js',
         "profile": './public/src/profile.js'
       },
       output: {
         path: 'dist',
         filename: '[name].js'  // vendor.js, index.js && profile.js
       }
     }
     ```
