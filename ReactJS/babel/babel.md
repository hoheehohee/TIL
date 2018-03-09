# babel
> ES6/ES7 코드를 ECMAScript5코드로 transpiling 하기 위한 도구
babel은 다양한 작은 모듈들로 구성 되어 있다.
babel 다양한 모듈을 담는 일종의 상자 역할을 하며 코드를 커파일 하기 위해 작은 모듈들(ex. presets)을 사용한다.

## babel-preset-env
- 자바스크립트 펙으로 아직 확정되지 않은 **proposal 스펙** 들이 존재한다.
이들은 5개의 stage로 구분 된다. babel에서는 각각의 stage에 대해서 preset을 제공한다.
	- babel-preset-stage-0
	- babel-preset-stage-1
	- babel-preset-stage-2
	- babel-preset-stage-3
	- babel-preset-stage-4는 babel-preset-es2015를 의미한다.
- 각각의 stage에 대해서 .babelrc 파일을 설정해야 한다. 하지만 babel에서 이들 모두 한번에 사용할 수 있다록 해주는 preset을 하나 제공했는데, 바로 **babel-preset-env** 이다.
- **babel-preset-env** 이 preset으로 모든 stage를 대체할 수 있다.
