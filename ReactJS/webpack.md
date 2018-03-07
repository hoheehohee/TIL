# webpack-dev-server (개발모드)
## hot vs inline webpack-dev-server options
- inline: 전체 페이지에 대한 실시간 리로딩("Live Reloading") 옵션
- hot: 컴포넌트가 수정 될 경우 그 수정된 부분만 리로드 해주는 부분 모듈 리로딩("Hot Module Reloading") 옵션
- 만약 두개 옵션을 모두 지정할 경우 "Hot Module Reloading"이 처음 발생한고. 그리고 "Hot Module Reloading"이 안되면 전체 페이지를 리로딩한다.


## "entry" [ String Vs Array Vs Object ]
- **entry** 는 root모듈 또는 시작 지점이 무엇인지 Webpack에게 알려 준다.
- **entry** 는 String, Array, Object 형태로 될 수 있다.
- **enrty - Array**
  >의존성이 없이 여러개의 파일을 사용하고 싶다면 Array 형식으로 사용하면된다.
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

- **entry-object**
  >만약 당신이 SPA(Single Page App)가 아니라 다중 페이지 어플리케이션을 개발한다면, entry-object를 사용하여 한번에 다중 bundle을 만들어 사용할 수 있다.
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


- **entry-combination**
  >당신은 enrty Object안에 Array 타입을 사용할 수 있다. 예를 들어 아래 설정을 보면 3가지 파일이 생성된다.
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

## output [ path Vs publicPath ]
- **output** 은 어디, 그리고 어떻게  결과 파일이 저장되는지에 대한 것이다. **output** 은 'path'와 'publicPath' 2가지 속성이 있어서 매우 헷갈린다.
  - path: 어디에 결과가 저장되는지 에 관한 것
  - publicPath: 배포 빌드 할 때 Webpack plugins(url-loader, file-loader 같은...), CSS나 HTML파일 안에 URL들을 업데이트 해주기 위한 것(prefix개념)
- 예를 들어, CSS에서 localhost에 `./test.png`를 로드 할 수 있는 URL이 있을수 있다. 하지만 production인 경우 `test.png`는 [`CDN`](https://ko.wikipedia.org/wiki/%EC%BD%98%ED%85%90%EC%B8%A0_%EC%A0%84%EC%86%A1_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC)이나 다른 지정된 경로로 실행 중 일 수 있다.
수동으로 수정하지 않고 Webpack 'publicPath'를 사용하면 수많은 플러그인과 다수의 CSS, HTML파일안에 URL들을 자동으로 업데이트 해준다.
  ```CSS
  /* main.css loads an image 'test.png '*/
  .image {
    height: 32px;
    width: 32px;
    background-image: url('./test.png');
  }
  ```
  ```javascript
  /* main.js imports main.css as a dependency */
  import React from 'react';
  import { render } from 'react-dom';
  import Greeter from './Greeter';

  import './main.css';

  render(<Greeter />, document.getElementById('root'));
  ```

  ```javascript
  /*
    Webpack.config.js
    - Has publicPath set
    - Has url-loader, which is publicPath "aware"
   */
   module.exports = {
     entry: __dirname + "/app/main.js",
     output: {
       path: __dirname + "/public",
       publicPath: 'http://localhost:5000/',  // Simulate CDN
     },
   }

   ...
   module: {

     ...
       {
         test: /\.css$/,
         loader: "url-loader?limit=1"
       },

   }

   ...
  ```

  ```CSS
  /* 결과 */
  /* Development: Both Server and the image are on localhost */
  .image {
    background-image: url('./test.png');
  }

  /*Production: Server is on Heroku but the image is on a CDN*/
  .image {
      background-image: url('https://someCDN/test.png');
  }
  ```
