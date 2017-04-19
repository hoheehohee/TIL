# Snippet 스니펫 

자동으로 입력되어지는 단축코드, 사용자가 직접 만들 수 있다.

### 생성 방법
Sublime Text 메뉴에서 <code>Tool</code> > <code>Developer</code> > <code>New Snippet</code> 클릭


```html
<snippet>
	<content>
		<![CDATA[ 
			Hello, ${1:this} is a ${2:snippet}. —————— > 1
		]]>
	</content>
	<!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
	<!-- <tabTrigger>hello</tabTrigger> --> ————> 2
	<!-- Optional: Set a scope to limit where the snippet will trigger -->
	<!-- <scope>source.python</scope> —> ———— >3
 </snippet>


1 : ${1:this}  :  스니펫을 넣는 부분
	${숫자 : 스피넷에 대한 설명}
	<content>해당 내용 코딩 </content>
2 :  스피넷 단축키
3 :  스피넷에 적용될 파일명. 
	ex)source.css, source.js 면 확장자 css와 js파일에 적용 된다.
```