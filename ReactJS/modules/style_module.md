## style-loader
- 자바스크립트로 변경된 스타일시트를 동적으로 돔에 추가하는 로더.

## [css-loader](https://github.com/webpack-contrib/css-loader)
- Options
	- importLoaders: CSS로더 전에 적용된 로더의 수
		```javascript
		{
		  test: /\.css$/,
		  use: [
		    'style-loader',
		    {
		      loader: 'css-loader',
		      options: {
		        importLoaders: 2 // 0 => no loaders (default); 1 => postcss-loader; 2 => postcss-loader, sass-loader
		      }
		    },
		    'postcss-loader',
		    'sass-loader'
		  ]
		}
		```
## postcss-loader
- 입력된 CSS 구문이 모든 브라우저에서 제대로 작동할 수 있도록 자동으로 -webkit, -mos, -ms 등의 접두사를 붙여 준다.
