# Download MongoDB Image for Docker
> Docker용 최신 공식 MongoDB 이미지를 다운로드하려면 아래의 단계별 지침을 따르십시오.

1. Docker service가 활성화되고 실행 중이어야합니다. 터미널에 다음 명령을 입력하여 현재 상태를 빠르게 확인할 수 있습니다.

```bash
sudo service docker status
```
> 이 예에서 Docker 서비스는 활성 상태이며 실행 중입니다.
![image](https://phoenixnap.com/kb/wp-content/uploads/2020/01/check-status-docker-service-mongodb.png)

2. MongoDB 데이터베이스에 대한 최신 공식 Docker 이미지 다운로드를 진행합니다.

```bash
sudo docker pull mongo
```
> 이미지는 시스템이 기본적으로 최신 태그를 사용했음을 나타냅니다.
![image](https://phoenixnap.com/kb/wp-content/uploads/2020/01/command-pull-latest-mongodb-image-docker.png)

특정 버전의 MongoDB를 다운로드하려면 버전 태그가 추가 된 동일한 명령을 사용하십시오. 예를 들면 :
```bash
sudo docker pull mongo:4.2.2
```
3. 다음 명령을 사용하여 Docker 저장소의 이미지를 나열합니다

```bash
sudo docker images
```

> 인터페이스는 이제 MongoDB 이미지를 사용할 수 있음을 확인합니다.
![image](https://phoenixnap.com/kb/wp-content/uploads/2020/01/list-images-docker-repository-mongodb.png)

# Deploy MongoDB Container(MongoDB 컨테이너 배포)
기본적으로 MongoDB는 Docker 컨테이너 내의 /data/db 디렉터리에 데이터를 저장합니다. 이 문제를 해결하려면 기본 호스트 시스템에서 MongoDB 데이터베이스를 실행하는 컨테이너로 디렉터리를 마운트합니다. 이렇게하면 데이터가 호스트 시스템에 저장되고 컨테이너 인스턴스가 실패해도 지워지지 않습니다.

1. 호스트 시스템에 /mongodata 디렉토리를 만듭니다.

```bash
sudo mkdir -p /mongodata
```
2. mongo 이미지를 사용하여 run 명령으로 Docker 컨테이너를 시작합니다. 컨테이너의 /data/db 디렉토리는 호스트에서 /mongodata로 마운트됩니다. 또한 이 명령은 컨테이너 이름을 mongodb로 변경합니다.

```bash
sudo docker run -it -v mongodata:/data/db --name mongodb -d mongo
```
> **-it**: Docker 컨테이너에 대화형셸(interactive shell)을 제공합니다.
![image](https://phoenixnap.com/kb/wp-content/uploads/2020/01/run-mongodb-contaier-docker.png)
> **-v**: 이 옵션을 사용하여 /mongodata 호스트 볼륨을 /data/db 컨테이너에 연결합니다.  
> **-d**: 컨테이너를 백그라운드 프로세스로 시작합니다.  
> **--name**: 컨테이너의 이름입니다.  

3. MongoDB 서버가 컨테이너에서 실행되기 시작하면 다음을 입력하여 상태를 확인합니다.

```bash
sudo docker ps
```
출력에서 볼 수 있듯이 기본 포트 번호는 27017입니다.
![image](https://phoenixnap.com/kb/wp-content/uploads/2020/01/mongodb-docker-container-default-port-numner.png)

4. **선택적으로 MongoDB 포트를 명시 적으로 지정할 수 있습니다:**

```bash
sudo docker run -it -v mongodata:/data/db -p 27017:27017 --name mongodb -d mongo
```

5. 변경 후 이벤트 체인을 보려면 항상 Docker 로그를 확인하십시오.
```bash
sudo docker logs mongodb
```
로그는 유용한 정보를 풍부하게 제공합니다.
![image](https://phoenixnap.com/kb/wp-content/uploads/2020/01/mongodb-docker-logs.png)

## 참고
[https://phoenixnap.com/kb/docker-mongodb](https://phoenixnap.com/kb/docker-mongodb)