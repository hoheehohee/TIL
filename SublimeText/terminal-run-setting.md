# Sublime Text 터미널 실행에서 실행 설정

Sublime Text는 subl이라는 CLI(Command-line interface)을 갖고 있다.
<pre>
 open /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl
</pre>

### 설치

**실볼릭 링크 사용**

<pre>
 sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/sublime
</pre>

이렇게 sublime이라는 이름으로 심볼릭 링크를 만들어 놓으면 터미널에서 실행이 가능.
물론 <code> /usr/local/bin </code> 디렉토리가 PATH에 포함되어 있다는 전재하에...

<pre>
 open ~/.bash_profile
</pre>

<code> /usr/local/bin </code> 디렉토리가 포함되어 있지 않다면 <code>.bash_profile</code>을 열어서 다음과 같이 추가

<pre>
 export PATH=/usr/local/bin:$PATH
</pre>

마지막 $PAAH는 이전 PASH에 지정해 놓은 값이 있을 경우를 대비하여 저렇게 붙여준것. 저장한뒤
<pre> source ~/.bash_profile </pre>

로 .bash_profile을 리러드 시켜주면 변경 내용 반영

**alias를 사용**

위와 같이 동일하게 .bash_profile을 열어서 다음과 같이 alias를 만드는 방법

<pre> alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl' </pre>

### 테스트

터미널에서 다음과 같이 실행

<pre>
 sublime filename // 지정한 화일을 연다.
 sublime foldername // 지정한 폴더를 연다.
 sublime . // 현제 폴더를 연다.
</pre>
