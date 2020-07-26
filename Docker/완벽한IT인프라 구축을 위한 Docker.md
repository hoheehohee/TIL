목차
====
- [2.1 컨테이너 기술의 개요](#2.1-컨테이너-기술의-개요)  
  - [컨테이너](#컨테이너)
- [2.2 Docker 개요](#2.2-Docker-개요)
  - [프로그래머에게 Docker란?](#프로그래머에게-Docker란?)
- [2.3 Docker의 기능](#2.3-Docker의-기능)
  - [Docker 이미지를 만드는 기능 (Build)](#Docker-이미지를-만드는-기능-(Build))
  - [Docker 이미지를 공유하는 기능 (Ship)](#Docker-이미지를-공유하는-기능-(Ship))
  - [Docker 컴포넌트](#Docker-컴포넌트)
- [4.1 Docker 이미지 조작 명령어](#4.1-Docker-이미지-조작-명령어)
  - [Docker 버전 확인](#Docker-버전-확인)
  - [Docker 실행 환경 확인](#Docker-실행-환경-확인)
  - [Docker 디스크 이용 상황](#Docker-디스크-이용-상황)
  - [Docker 이미지 다운로드](#Docker-이미지-다운로드)
  - [Docker 이미지 확인](#Docker-이미지-확인)
  - [이미지 상세 정보 확인](#이미지-상세-정보-확인)
  - [이미지 태그 설정](#이미지-태그-설정)
  - [이미지 검색 ](#이미지-검색-)
  - [이미지 삭제](#이미지-삭제)
  - [사용하지 않은 Docker 이미지를 전체 삭제 ](#사용하지-않은-Docker-이미지를-전체-삭제)
  - [Docker Hub에 로그인](#Docker-Hub에-로그인)
  - [Docker Hub 로그아웃](#Docker-Hub-로그아웃)
  - [이미지 업로드](#이미지-업로드)
- [4.2 Docker 컨테이너 생성/시작/정지](#4.2-Docker-컨테이너-생성/시작/정지)
  - [Docker 컨테이너의 라이플 사이클](#Docker-컨테이너의-라이플-사이클)
  - [컨테이너를 조학하기 위한 기본 명령어 네 가지.](#컨테이너를-조학하기-위한-기본-명령어-네-가지.)
  - [컨테이너 생성 및 시작](#컨테이너-생성-및-시작)
  - [컨테이너 백그라운드 실행](#컨테이너-백그라운드-실행)
  - [컨테이너 네트워크 설정](#컨테이너-네트워크-설정)
  - [자원을 지정하여 컨테이너 생성 및 실행](#자원을-지정하여-컨테이너-생성-및-실행)
  - [컨테이너를 생성 및 시작하는 환경을 지정 ](#컨테이너를-생성-및-시작하는-환경을-지정-)
  - [가동 컨테이너 목록 표시](#가동-컨테이너-목록-표시)
  - [컨테이너 가동 확인](#컨테이너-가동-확인)
  - [컨테이너 시작](#컨테이너-시작)
  - [컨테이너 정지](#컨테이너-정지)
  - [컨테이너 재시작](#컨테이너-재시작)
  - [컨테이너 삭제](#컨테이너-삭제)
  - [컨테이너 중단/재개](#컨테이너-중단/재개)
- [4.3 Docker 컨테이너 네트워크](#4.3-Docker-컨테이너-네트워크)
  - [네트워크 목록 표시](#네트워크-목록-표시)
  - [네트워크 작성](#네트워크-작성)
  - [네트워크 연결](#네트워크-연결)
  - [네트워크 상세 정보 확인](#네트워크-상세-정보-확인)
  - [네트워크 삭제](#네트워크-삭제)
- [4.4 가동중인 Docker 컨테이너 조작](#4.4-가동중인-Docker-컨테이너-조작)
  - [가동 컨테이너 연결](#가동-컨테이너-연결)
  - [가동 컨테이너에서 프로세스 실행 ](#가동-컨테이너에서-프로세스-실행)
  - [가동 컨테이너의 프로세스 확인 ](#가동-컨테이너의-프로세스-확인)
  - [가동 컨테이너의 포트 전송 ](#가동-컨테이너의-포트-전송)
  - [컨테이너 이름 변경](#컨테이너-이름-변경)
  - [컨테이너 안의 파일을 복사](#컨테이너-안의-파일을-복사)
  - [컨테이너 조작의 차분 확인](#컨테이너-조작의-차분-확인)
- [4.5 Docker 이미지 생성](#4.5-Docker-이미지-생성)
  - [컨테이너부터 이미지 작성](#컨테이너부터-이미지-작성)
  - [컨테이너를 tar파일로 출력](#컨테이너를-tar파일로-출력)
  - [tar 파일로부터 이미지 작성](#tar-파일로부터-이미지-작성)
  - [이미지 저장](#이미지-저장)
  - [이미지 읽어 들이기](#이미지-읽어-들이기)
  - [불필요한 이미지/컨테이너를 일괄 삭제](#불필요한-이미지/컨테이너를-일괄-삭제)


2.1 컨테이너 기술의 개요
==========
### 컨테이너

> 컨네이터란 호스트 OS상에 논리적인 구획(컨테이너)을 만들고, 애플리케이션을 작동시키기 위해 필요한 라이브러리나 애플리케이션 등을 하나로 모아, 마치 별도의 서버인 것처럼 사용할 수 있게 만드는것.  

![컨테이너.png](./images/컨테이너.png)
> Docker는 애플리케이션의 실행에 필요한 환경을 하나의 이미지로 모아두고, 그 이미지를 사용하여 다양한 환경에서 애플리케이션 실행 환경을 구축 및 운용하기 위한 오픈소스 플랫폼이다.

2.2 Docker 개요
==========
### 프로그래머에게 Docker란?

![Docker를 사용한 시스템 개발 흐름.png](./images/Docker를_사용한_시스템_개발_흐름.png)
> Docker에서는 각각의 인프라 환경(개발환경, 테스트 환경, 스테이징 환경)(그림 2.6)을 컨테이너로 관리한다. 애플리케이션의 실행에 필요한 모든 파일 및 디렉토리들을 컨테이너로서 모아버리는 것이다.  
>
> 한번 만들면 어디서든지 움직이는 소프트웨어의 특성을 이식성(protability)라고 한다. Docker는 이식성이 높기 때문에 클라우드 시스템과의 친화력도 높은 것이 특징이다.  
> Docker 컨테이너의 바탕이 되는 Docker 이미지만 있으면 애플리케이션을 동일한 환경에서 가동시킬 수 있다. 즉 개발한 업무 애플리케이션을 온프레미스 환경에 대한 이전뿐만 아니라 온프레미스 -> 클라우드나 클라우드 -> 온프레미스 간에도 시스템 요건이나 예산에 따라 손쉽게 실행 환경을 선택할 수 있다.

2.3 Docker의 기능
==========
> Docker에는 크게 3가지의 기능이 있다.
- Docker 이미지를 만드는 기능 (Build)
- Docker 이미지를 공유하는 기능 (Ship)
- Docker 컨테이너를 작동시키는 기능 (Run)

### Docker 이미지를 만드는 기능 (Build)

> Docker는 애플리케이션의 실행에 필요한 프로그램 본체, 라이브러리, 미들웨어, OS나 네트워크 설정 등을 하나로 모아서 Docker 이미지를 만든다.
- Docker 이미지는 애플리케이션의 실행에 필요한 파일들이 저장된 디텍토리이다.
- Docker 이미지는 수동으로 만들 수도 있으며, **Dockerfile**이라는 설정 파일을 만들어 그것을 바탕으로 자동으로 이미지를 만들 수도 있다.

### Docker 이미지를 공유하는 기능 (Ship)

> Docker 이미지를 Docker 레지스토리에서 공유할 수 있다.
- Docker의 공식 레지스트 [Docker Hub](https://hub.docker.com/)
- 공식 Ubuntu나 CentOS와 같은 이미지 외에도 개인이 작성한 이미지를 자유롭게 공개 및 공유 가능

### Docker 컨테이너를 작동시키는 기능 (Run)

> Docker는 Linux 상에서 컨테이너 단위로 서버 기능을 작동 시킨다. 이 컨테이너의 바탕이 되는 것이 Docker 이미지이다.

### Docker 컴포넌트

> Docker는 몇 개의 컴포넌트로 구성되어 있다. 핵심 기능이 되는 Docker Engine을 중심으로 컴포넌트를 조합하여 애플리케이션을 실행 환경을 구축한다.  
>
> **Docker Engine(Docker의 핵심 기능)**  
> - Docker 이미지를 생성하고 컨테이너를 기동시키기 위한 Docker의 핵심 기능.  
> - Docker 명령의 실행이나 DockerFile에 의한 이미지도 생성.  
>
> **Docker Registry(이미지 공개 및 공유)**  
> - 컨테이너의 바탕이 되는 Docker 이미지를 공개 및 공유하기 위한 레지스트리 기능.  
>
> **Docker Compose(컨테니어 일원 관리)**
> - 여러 개의 컨테이너 구성 정보를 코드로 정의하고, 명령을 실행함으로써 애플리케이션의 실행 환경을 구성하는 컨테이너들을 일원 관리하기 위한 툴.
>
> **Docker Machine(Docker 실행 환경 구축)**
> - 로컬 호스트용인  VirtualBox를 비롯하여 Amazon Web Services EC2나 Microsoft Azure와 같은 클라우드 환경에 Docker의 실행 환경을 명령으로 자동 생성하기 위한 툴.
>
> **Docker Swarm(클러스터 관리)**
> - Docker Swarm은 여러 Docker 호스트를 클러스터와하기 위한 툴.

4.1 Docker 이미지 조작 명령어
=====

#### Docker 버전 확인
> ```bash
> $ docker version
> ```

#### Docker 실행 환경 확인
> - Docker 실행 환경의 상세 설정이 표시
> ```bash
> $ docker system info
> ```

#### Docker 디스크 이용 상황
> - Docker가 사용하고 있는 디스크의 이용 상황이 표시
> ```bash
> $ docker system df
> ```

#### Docker 이미지 다운로드
> nginx를 클라이언트 PC로 이미지 다운로드
>
> ![image_pull_option.png](./images/image_pull_option.png)
> ```bash
> $ docker image pull [옵션] 이미지명[:태크명]
> ```
> 옵션
> - -a: 모든 태그를 취득할 수 있다. -a 옵션을 지장할 때는 이미지명에 태그를 지정 불가.

#### Docker 이미지 확인
>
> ![image_ls.png](./images/image_ls.png)
> ```bash
> $ docker image ls
> ```

#### 이미지 상세 정보 확인
> ```bash
> $ docker image inspect 이미지명
> ```
>
> ![image_inspect.png](./images/image_inspect.png)

#### 이미지 태그 설정
> ```bash
> $ docker image tag <Docker Hub 사용자명>/이미지명:[태크명]
> ```
>
> ![image_tag.png](./images/image_tag.png)

#### 이미지 검색 
> - Docker Hub에 공개되어 있는 이미지를 검색할 때
>
> ![image_search01.png](./images/image_search01.png)
> ![image_search02.png](./images/image_search02.png)
> ```bash
> $ docker search [옵션] <검색 키워드>
> $ docker search --filter=start=1000 nginx <인기 있는 이미지 검색>
> ```

#### 이미지 삭제
>
> ![image_rm01.png](./images/image_rm01.png)
> ```bash
> $ docker image rm [옵션] 이미지명 [이미지명]
> ```
>
#### 사용하지 않은 Docker 이미지를 전체 삭제 
>
> ![image_prune.png](./images/image_prune.png)
> ```bash
> $ docker image prune [옵션]
> ```

#### Docker Hub에 로그인 
>
> ![login.png](./images/login.png)
> ```bash
> $ docker login [옵션] [서버]
> ```
>
#### Docker Hub 로그아웃
> ```bash
> $ docker logout [서버명]
> ```


#### 이미지 업로드 
> ```bash
> $ docker image push <Docker Hub 사용자명>/이미지명[:태그명]
> ```
> ![image_push.png](./images/image_push.png)

4.2 Docker 컨테이너 생성/시작/정지
=====
> 이미지가 만들어졌으면 컨테이너를 생성할 수 있다.
#### Docker 컨테이너의 라이플 사이클
![docker_라이프사이클.png](./images/docker_라이프사이클.png)

#### 컨테이너를 조학하기 위한 기본 명령어 네 가지.
> **컨테이너 생성(docker container create 명령)**  
> - 이미지로 부터 컨테이너를 생성한다.  
> - 명령어를 싱행하면 이미지에 포함될 Linux의 디렉토리와 파일들의 스냅샷을 취합한다.  
> 스냅샷이란 스토리지 안에 존재하는 파일과 디렉토리를 특정 타이밍에서 추출한 것을 말한다.  
> - create 명령은 컨테이너를 작성하기만 할뿐 컨테이너를 시작하지 않는다. (시작할 준비가 된 상태가 된 것일뿐.)
>
> ![container_create.png](./images/container_create.png)
>
> **컨테이너 생성 및 시작 (docker container run 명령)**  
> - 이미지로 부터 컨테이너를 생성하고 컨테이너 상에서 임의의 프로세스를 시작한다.
>
> **컨테이너 시작 (docker container start 명령)**
> - 정지 중인 컨테이너를 시작할 때 사용
>
> **컨테이너 정지 (docker container stop 명령)**
> - 실행 중인 컨테이너를 정지시킬 때 사용
>
> **컨테이너 삭제 (docker container rm 명령)**
> - 정지 중인 컨테이너를 삭제할 때 사용

#### 컨테이너 생성 및 시작
>
> ![container_run01.png](./images/container_run01.png)
> ![container_run02.png](./images/container_run02.png)
> ![container_run03.png](./images/container_run03.png)
> ```bash
> $ docker container run [옵션] 이미지명[:태그명][인수]
> ```
>
#### 컨테이너 백그라운드 실행
> 대화식이 아니라 백그라운드에서 실행
>
> ![container_run04.png](./images/container_run04.png)
> ![container_run05.png](./images/container_run05.png)
> ```bash
> $ docker container run [실행 옵션] 이미지명[:태그명] [인수]
> $ docker container run -it --restart-always centos /bin/bash </bin/bash를 exit 명령으로 종료 해도 자동으로 컨테이너를 재시작 할 때 >
> ```

#### 컨테이너 네트워크 설정
>
> ![container_run_네트워크01.png](./images/container_run_네트워크01.png)
> ```bash
> $ docker container run [네트워크] 이미지명[:태크명] [인수]
> $ docker container run -d -p 8080:80 nginx
> ```
> nginx라는 이름의 이미지를 바탕으로 컨테이너를 생성하고, 백그라운드에서 실행하고 이때 호스트의 포트 번호 8080과 컨테이너의 포트 번호 80을 매핑  
>
> ![container_run_네트워크02.png](./images/container_run_네트워크02.png)
> ```bash
> 컨테이너 DNS 서버 지정
> $ docker container run -d --dns 192.168.1.1 nginx
> ```
> ```bash
> 호스트명과 IP주소 정의
> $ docker container run -it --add-host test.com:192.168.1.1 centos
> ```

#### 자원을 지정하여 컨테이너 생성 및 실행
> - 컨테이너 시작할 때 CPU와 메모리의 자원 이용을 제한.
> - 기본값으로 cpu-shares는 1024
> - 컨테이너 안의 디렉토리를 공유 가능.
>
> ![container_run_자원01.png](./images/container_run_자원01.png)
> ```bash
> $ docker container run [자원 옵션] 이미지명[:태그명] [인수]
> $ docker container run --cpu-shares=512 --memory=1g centos <cpu-shares의 값을 512로 설정>
> $ docker container run -v /User/asa/webap:/user/share/nginx/html nginx <호스트의 /User/asa/webap 폴더를 컨테이너의 /user/share/nginx/html 디렉토리와 공유>
> ```

#### 컨테이너를 생성 및 시작하는 환경을 지정 
> - 환경변수나 컨테이너 안의 작업 디렉토리 등을 지정 가능
>
> ![container_run_환경변수.png](./images/container_run_환경변수.png)
> ```bash
> $ docker container run [환경설정 옵션] 이미지명[:태크명] [인수]
> $ docker container run -it -e foo=bar centos /bin/bash <환경변수 지정>
> $ docker container run -it --env-file=env_list centos /bin/bash <환경변수를 정의한 파일로부터 일괄적으로 등록>
> $ docker container run -it -w=/tensorflow centos /bin/bash <컨테이너의 작업 디렉토리를 지정하여 실행>
> ```
>

#### 가동 컨테이너 목록 표시
> - 작동하는 컨테이너의 가동 상태를 확인할 때
>
> ![container_run_목록01.png](./images/container_run_목록01.png)
> ![container_run_목록_결과.png](./images/container_run_목록_결과.png)
> ```bash
> $ docker container ls [옵션]
> $ docker container ls -a -f name=test1 <컨테이너 목록 필러링(test1인 것을 조건으로 조회)>
> $ docker container ls -a -f exited=0 <STATUS에 종료 코드가 0인 것>
> ```

#### 컨테이너 가동 확인
> - Docker 상에서 작동하는 컨테이너 가동 상태 확인
>
> ![container_run_stats.png](./images/container_run_stats.png)
> ```bash
> $ docker container stats [컨테이너 식별자]
> $ docker container stats webserver <webserver라는 이름의 컨테이너 가동 상황을 확인>
> $ docker container top webserver <컨테이너에서 실행 중인 프로세스를 확인할 때 top 사용>
> ```

#### 컨테이너 시작
> - 정지하고 있는 컨테이너를 시작할 때
> - 여러 개의 컨테이너를 한꺼번에 시작하고 싶을 때는 인수에 컨테이너 식별자를 여러 개 지정 가능
>
> ![container_run_start.png](./images/container_run_start.png)
> ```bash
> $ docker container start [옵션] <컨테이너 식별자> [컨테이너 식별자]
> $ docker container start dbb4bbe0f470 <dbb4bbe0f470 컨테이너를 시작>
> ```

#### 컨테이너 정지
> - 컨테이너를 정지할 때
>
> ![container_run_stop.png](./images/container_run_stop.png)
> ```bash
> $ docker container stop [옵션] <컨테이너 식별자> [컨테이너 식별자]
> $ docker container stop -t 2 dbb4bbe0f470 <dbb4bbe0f470 컨테이너를 2초 후에 정지>
> $ docker container kill <강제적으로 컨테이너를 정지시킬 때>
> ```

#### 컨테이너 재시작
> - 컨테이너를 재시작할 때
>
> ![container_run_restart.png](./images/container_run_restart.png)
> ```bash
> $ docker container restart [옵션] <컨테이너 식별자> [컨테이너 식별자]
> $ docker container restart -t 2 webserver <webserver인 컨테이너를 2초 후에 재시작>
> ```

#### 컨테이너 삭제
> - 정지하고 있는 컨테이너를 삭제할 때
>
>![container_run_rm.png](./images/container_run_rm.png)
> ```bash
> $ docker container rm [옵션] <컨테이너 식별자> [컨테이너 식별자]
> $ docker container rm dbb4bbe0f470 <dbb4bbe0f470인 컨테이너를 삭제>
> $ docker container prune <정지 중인 모든 컨테이너를 삭제>
> ```

#### 컨테이너 중단/재개
> - 실행중인 컨테이너에서 작동 중인 프로세스를 모두 중단시킬 때
> ```bash
> $ docker container pause <컨테이너 식별자>
> $ docker container pause webserver <webserver인 컨테이너를 일시 중단시킨다>
> $ docker container unpause webserver <중단시킨 webserver의 컨테이너를 재개>
> ```

4.3 Docker 컨테이너 네트워크
=====
> Docker 컨테이너끼리 통신을 할 때는 Docker 네트워크를 통해 수행한다.
#### 네트워크 목록 표시
> - Docker 네트워크 목록을 확인
>
> ![container_network_목록.png](./images/container_network_목록.png)
>```bash
> $ docker network ls [옵션]
> $ docker network ls -q driver=bridge <브리지 네트워크 ID만을 목록으로 표시하고 싶을 때>
>```
#### 네트워크 작성 
> - 새로운 네트워크를 작성할 때
>
> ![container_nework_create01.png](./images/container_nework_create01.png)
>```bash
> $ docker network create [옵션] 네트워크
> $ docker network create --driver=bridge web-network <'web-network'라는 이름의 네트워크가 만들어진다. 'bridge'를 지정하고 있기 때문에 브리지 네트워크를 작성한다.>
>```
#### 네트워크 연결 
> - Docker 컨테이너를 Docker 네트워크에 연결 및 해지
>
> ![container_network_connect01.png](./images/container_network_connect01.png)
>```bash
> $ docker network connect [옵션] 네트워크 켄테이너
> $ docker network connect web-network webfront <'webfront'라는 이름의 Docker 컨테이너를 'web-network'라는 이름의 Docker 네트워크에 연결>
> $ docker container inspect <컨테이너 확인>
> $
> $ docker container run -itd --name=webp --net=web-network nginx <컨테이너 시작 시에 네트워크 연결>
> $ docker network disconnect web-network webfront <네트워크 해제할 때>
>```
#### 네트워크 상세 정보 확인
> - 네트워크 상세 정보를 확인할 때
>```bash
> $ docker netowrk inspect [옵션] 네트워크
> $ docker netowrk inspect web-network <'web-network'라는 이름의 네트워크의 상세 정보를 표시>
>```
#### 네트워크 삭제
> - Docker 네트워크를 삭제할 때 
>```bash
> $ docker network rm [옵션] 네트워크
> $ dockwer network rm web-network <'web-network'라는 이름의 네트워크를 삭제한다. 단 삭제 전에 disconnect 명령을 사용하여 연중 해제해야함.>
>```
4.4 가동중인 Docker 컨테이너 조작
=====
> - 이미 가동 중인 컨테이너의 상태를 확인하거나 임의의 프로세스를 실행시킬 때 하는 조작에 대해
#### 가동 컨테이너 연결
> - 연결한 컨테이너 종료 (ctrl + c)
> - 컨테이너 안에서 움직이는 프로세스(이 경우 /bin/bash)만 종료 (ctrl + p, ctrl +)
>```bash
> $ docker container attach sample </bin/bash가 실행되고 있는 sample이라는 이름의 컨테이너에 연결>
>```
#### 가동 컨테이너에서 프로세스 실행 
> - 가동중인 컨테이너에서 새로운 프로세스를 실행할 때
>
> ![container_exec01.png](./images/container_exec01.png)
>```bash
> $ docker container exec [옵션] <컨테이너 식별자> <실행할 명령> [인수]
> $ docker container exec -it webserver /bin/bash <webserver라는 이름으로 가동 중인 컨테이너에 /bin/bash를 실행 컨테이너 안에서 임의의 명령 실행 가능>
> $ docker container exec -it webserver /bin/bash "hello word" <명령을 직접 실행>
>```
#### 가동 컨테이너의 프로세스 확인 
> - 가동 중인 컨테이너에서 실행되고 있는 프로세스를 확인할 때
>```bash
> $ docker container top <실행 중인 프로세스의 PID와 USER, 실행 중인 명령이 표시 된다.>
> $ docker container top webserver <"webserver"라는 이름의 컨테이너의 프로세스를 확인>
>```
#### 가동 컨테이너의 포트 전송 
> - 가동 중인 컨테이너에서 실행되고 있는 프로세스가 전송되고 있는 포트를 확인
>```bash
> $ docker container port webserver <"webserver"라는 이름의 컨테이너의 포트 전송을 확인>
>```
#### 컨테이너 이름 변경
> - 컨테이너 이름을 변경 
>```bash
> $ docker container rename old new <"old"라는 이름의 컨테이너를 "new"라는 이름으로 변경>
>```
#### 컨테이너 안의 파일을 복사
> - 컨테이너 안의 파일을 호스트에 복사할 때 
>```bash
> $ docker container cp <컨테이너 식별자>:<컨테이너 안의 파일경로> <호스트의 디렉토리 경로>
> $ docker container cp <호스트 파일> <컨테이너 식별자>:<컨테이너 안의 파일경로>
> $ docker container cp webserver:/etc/nginx/nginx.config /tmp/etc <"webserver"라는 컨테이너 안에 있는 /etc/nginx/nginx.config 파이를 호스트의 /tmp/etc안에 복사>
> $ docker container cp cp ./test.txt webserver:/tmp/text.txt <반대로 호스트의 test.txt 파일을 "webserver"라는 이름의 컨테이너 안에 복사>
>```
#### 컨테이너 조작의 차분 확인
> - 컨테이너 안에서 어떤 조작을 하여 컨테이너가 이미지로부터 생성되었을 때와 딸라진 점(차분)을 확인 
>```bash
> $ docker container diff <컨테이너 식별자>
>```
4.5 Docker 이미지 생성
=====
> Docker 컨테이너는 Docker 이미지를 바탕으로 작성하지만 반대로 Docker 컨테이너를 바탕으로 Docker 이미지를 작성할 수도 있다.
#### 컨테이너부터 이미지 작성
> - 컨테이너로부터 이미지를 작성 
>
> ![container_commit01.png](./images/container_commit01.png)
>```bash
> $ docker container commit [옵션] <컨테이너 식별자> [이미지명[:태그명]]
> $ docker container commit -a "ASA SHIHO" webserver hoheehohee/webfront:1.0 <"webserver"라는 이름의 컨테이너를 "hoheehohee/webfront"라는 이름으로 태그명을 1.0으로 지정하여 새로운 이미지를 작성.>
>```
#### 컨테이너를 tar파일로 출력
> - Docker에서는 가동 중인 컨테이너의 디렉토리/파일들을 모아서 tar파일로 만들 수 있다.
> - 이 tar 파을을 바탕으로 다른 서버에서 컨테이너를 가동시킬수 있다. 
>```bash
> $ docker container export <컨테이너 식별자>
> $ docker container export webserver > latest.tar <"webserver"라는 컨테이너를 "latest.tar"라는 tar 파일로 출력>
> $ tar -tf latest.tar |more <tar 파일의 내용을 확인>
>```
#### tar 파일로부터 이미지 작성 
> - Linux OS 이미지의 디렉토리/파일로부터 Docker 이미지를 만들 수 있다.
>```bash
> $ docker image import <파일 또는 URL> | - [이미지명[:태그명]]
> $ cat latest.tar | docker image import - hoheehohee/webfront:1.1 <latest.tar로 모아놓은 디렉토리나 파일을 바탕으로 "hoheehohee/webfront"라는 이름의 태그명 1.1인 이미지를 작성한다.>
>```
#### 이미지 저장
> - Docker 이미지를 tar 파일로 저장할 수 있다. 
>```bash
> $ docker image save [옵션] <저장 파일명> [이미지명]
> $ docker image save -o export.tar tensorflow <"tensorflow"라는 이름의 이미지를 export.tar에 저장>
>```
#### 이미지 읽어 들이기
> - tar 이미지로부터 이미지를 읽어 들을 수 있다. 
>```bash
> $ docker image load [옵션]
> $ docker image load -i export.tar <"export.tar"라는 이름의 이미지를 읽어 들인다.>
>```
#### 불필요한 이미지/컨테이너를 일괄 삭제
> - 사용하지 않는 이미지, 컨테이너, 볼륨, 네트워크를 일괄적으로 삭제. 
>
> ![container_system_prune.png](./images/container_system_prune.png)
>```bash
> $ docker system prune [옵션]
> $ docker system prune -a <사용하지 않는 리소스를 모두 삭제>
>```