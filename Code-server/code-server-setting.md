# VS CODE 웹 서버 세팅
### iPad로 코딩하는 방법을 찾다가 code-server라는 것을 알게 됐고 언제 어디서든 웹 서버에 vscode를 띄워 놓고, 원격에서 웹브라우저를 이용해 코딩하는 방법이다.

```Bash
cd ~/Downloads
wget https://github.com/cdr/code-server/releases/download/v3.6.2/code-server-3.6.2-linux-amd64.tar.gz
tar -xvf code-server-3.6.2-linux-amd64.tar.gz
mv code-server-3.6.2-linux-amd64 coder
cd coder
chmod +x ./code-server
```
<!-- - wget [다운로드 주소]: [https://github.com/cdr/code-server/releases](https://github.com/cdr/code-server/releases)의 최신 버전 주소로 다운 -->