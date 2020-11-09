# VS CODE 웹 서버 세팅
### iPad로 코딩하는 방법을 찾다가 code-server라는 것을 알게 됐고 언제 어디서든 웹 서버에 vscode를 띄워 놓고, 원격에서 웹브라우저를 이용해 코딩하는 방법이다.


## 서버에 code-server 설치

### 다운로드

```bash
cd ~/Downloads
wget https://github.com/cdr/code-server/releases/download/v3.6.2/code-server-3.6.2-linux-amd64.tar.gz
tar -xvf code-server-3.6.2-linux-amd64.tar.gz
mv code-server-3.6.2-linux-amd64 coder
cd coder
chmod +x ./code-server
```
- wget [다운로드 주소]: [https://github.com/cdr/code-server/releases](https://github.com/cdr/code-server/releases)의 최신 버전 주소로 다운

### 암호 설정

```bash
echo "export PASSWORD='암호입력'" >> ~/.bashrc
source ~/.bashrc
```
### code-server 실행

```bash
cd ./coder/bin
./coder-server --bind-addr 123.123.123.123:8080
```  
- ./code-server --bind-addr [원격서버 IP주소]:[사용할 포트]

### 자동실행설정
- 서버가 실행될 때 자동으로 code-server가 실행되도록 init service를 설정
- [https://eungbean.github.io/2019/11/04/remote-vscode/](https://eungbean.github.io/2019/11/04/remote-vscode/)