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
  - pathinfo: 배포 빌드 할 때 주석을 포함 하도록 한다.(boolean)
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

## Chaining Loaders(오른쪽에서 왼쪽방향으로 실행된다.)
- 여러 Loaders를 연결하여 동일한 파일 형식으로 작업 할 수 있다. 체이닝은 "!"로 구분하고, 오른쪽에서 왼쪽 방향으로 작업을 수행한다.
예를 들어 우리는 "myCssFile.css"를 가 있고, 그 파일을 HTML안에 `<style>CSS content</style>` 로 넣고 싶다. 우리는 `css-loader`, `style-loader` 인 2개의 loader로 진행 할 수 있다.
  ```javascript
  module: {
    loaders: [{
      test: /\.css$/,
      loader: 'style!css'   // 줄임말 for style-loader!css-loader
    }]
  }
  ```
  > 작동방식

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
  ...
  module: {

    ...
      {
        test: /\.css$/,
        loader: "style!.css"
      },

  }

  ...
  ```

  ```HTML
  <html>
    <head>
      <mata charset="utf-8" />
      <style type="text/css">
        .image {
          height: 32px;
          width: 32px;
          background-image: url(9sdf2f233dfs129dfs3vga33918sdf3sdc3.png);
        }
      </style>
    </head>
  </html>
  ```

1. Webpack은 모듈안에 의존적인 CSS파일들을 검색한다. Webpack은 `require('myCssFile.css')` 을 가지고 있는지 JS파일을 체크한다. 만약 찾았다면, 먼저 해당 파일을 `css-loader` 수행한다.
2. `css-loader` 는 모든 CSS와 그안에 의존적인 다른 CSS(ex: `import otherCss` )를 JSON파일로 로드한다. 그후 Webpack은 결과들을 `style-loader` 로 보낸다.
3. `style-loader` 로 JSON을 가져와서, `<style>CSS content</style>` tag 를 추가하고, index.html 파일안에 tag를 삽입한다.

## Loaders 자체 구성 기능
> "Loader" 자체는 매개변수에 의해 다르게 작동하도록 설정 할 수 있다.

- 아래에 나온 예를 보면, 1024byte['-== s 보다 큰 이미지는 URL을 사용하고, 1024bytes 보다 작은 이미지는 DataURLs을 사용 하기 위한 `url-loader` 설정을 할 수 있다.
"limit"매개 변수를 전달하는 방법은 다음 두가지가 있다.

  ```javascript
  // Otpion 1 - Use "?" just like in URLs
  {
    test: /\.png$/,
    loader: "url-loader?limit=1024"
  }

  // Option 2, Use 'query' property
  {
    test: /\.png$/,
    loader: "url-loader",
    query: { limit: 1024 }
  }
  ```

## .babelrc file
- bable-loader `presets` 을 통해 **ES6** 에서 **ES5** 로 어떻게 변환 해야 하는지 그리고 React JSX 에서 JS 어떻게 파싱 하는지 대해 설정을 할 수 있게 해준다.
  ```javascript
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel',
        query: {
          presets: ['react', 'es2015']
        }
      }
    ]
  }
  ```

- 하지만 대부분에 큰 프로텍트에서는 babel 설정이 굉장히 방대할 수가 있다. 그래서 .babelrc 설정 파일을 통해 babel-loader 설정을 대신 할 수 있다.
만약 .babelrc 파일이 있다면 babel-loader 는 자동으로 읽어 들인다.

  > Usage:

  ```javascript
  // Webpack.config.js
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel'
      }
    ]
  }

  //.bablerc
  {
    "presets": ['react', 'es2015']
  }
  ```

## Plugins
> **Plugins** 는 보통 결과물(bundle)에 작동하는 추가적인 node_modules 이다.

- 예를 들어 **uglifyJSPlugin** 은 파일 사이지를 줄이고, minimized를 한 bundle 파일을 준다.
유사하게 **extract-text-webpack-plugin** 는 내부적으로 **css-loader**, **style-loader** 를 사용하여 한곳에 CSS파일을 수집하고
외부 **style.css** 파일로 결과를 추출하여 **index.html** 안에 style.css 를 삽입 하면 된다.

  ```javascript
  // webpack.config.js
  // Take all the .css files, combine their contents and it extract them to a single "style.css"
  var ETP = require("extract-text-webpack-plugin");

  module: {
    loaders: [
      {
        test: /\.css$/,
        loader: ETP.extract("style-loader", "css-loader")
      }
    ]
  },

  plugins: [
    new ExtractTextPlugin("style.css")  // Extract to style.css file
  ]
  ```

  > 만약 당신이 HTML 안에 style 태그로 CSS를 인라인하고 싶다면 extract-text-webpack-plugin
  사용하지 않고 아래 처럼 CSS와 Style loaders를 사용하면 된다.

  ```javascript
  module: {
    loaders: [
      {
        test: /\.css/,
        loader: 'style!css'     // <- 줄임말 for style-loader!css-loader
      }
    ]
  }
  ```

## Loaders VS Plugins
- 아시다시피 **Loaders** 는 번들이 생성되는 동안 또는 생성되기 전에 개별 파일 수준에서 작업한다.
그리고 **Plugins** 은 bundle 이나 chunk 레벨 그리고 bundle이 생성 된 후에 작동 한다.
**commonsChunksPlugins** 와 같은 일부 플러그인은 번들 자체가 어떻게 생성되는지 수정한다.

## Resolving File Extensions
- 대부분 **Webpack** 설정 파일은 아래와 같이 빈 string을 포함한 **resolve extensions** 라는 속성을 가지고 있다.
빈 string 은 `require(./myFile)` 과 같이 빈 확장자를 import하게 도와주는 역할이다.

```javascript
{
  resolve: {
    extensions: ['', '.js', ',jsx']
  }
}
```

## [Externals](https://webpack.js.org/configuration/externals/#src/components/Sidebar/Sidebar.jsx)
- 지정된 모듈이 번들링하지 않고 그 모듈이 어떤 형식으로 노출 되는지 설정할 수 있게 한다.
즉 webpack 으로 묶지 않으며 library중에 밖으로 노출시킬 녀석을 설정하면 된다.
- 설정은 string, array, object, function, regex

## [Resolve](https://webpack.js.org/configuration/resolve/#resolve-modules)
> 모듈을 해석하는데 있어 영향을 미치는 옵션을 설정

- alias
  - 특정 모듈을 보다 쉽게 가져 오거나 요구하도록 별칭을 만든다.
  ```javascript
  // webpack.config.js
  {
    ...
    resolve: {
      alias: {
        Utilities: path.resolve(__dirname, 'src/utilities/'),
        Templates: path.resolve(__dirname, 'src/templates/')
      }
    }
    ...

    // 다음과 같이 가져올 때 상대 경로를 사용하는 대신
    import Utility from '../../utilities/utility';

    // 별칭을 사용할 수 있다.
    import Utility from 'Utilities/utility';
  }
  ```
