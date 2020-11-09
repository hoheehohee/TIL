# Ubuntu에 Docker Engine on Ubuntu

## Prerequisites(전제조건)
### OS
> Docker Engine을 설치하려면 다음 Ubuntu 버전 중 하나의 64-bit 버전이 필요합니다.
- Ubuntu Focal 20.04 (LTS)
- Ubuntu Bionic 18.04 (LTS)
- Ubuntu Xenial 16.04 (LTS)

## Installation methods(설치 방법)
### Install using the repository (저장소를 사용하여 설치)
> 새로운 호스트 머신에 처름으로 Docker Engine을 설치하지 건에 Docker 저장소를 설정해야 합니다. 나중에 저장소에서 Docker를 설치하고 업데이트 할 수 있습니다.

### Repository 설정
1. apt package index을 업데이트 하고 apt가 HTTPS를 통해 저장소를 사용할 수 있도록 package를 설치합니다.
```bash
$ sudo apt-get update
$ sudo apt-get install  \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
2. Docker의 공식 GPG키를 추가합니다.
```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
> 지문(fingerprint)의 마지막 8자를 검색하여 지문의 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 인 기가 있는지 확인합니다.

```bash
$ sudo apt-key fingerprint 0EBFCD88

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

## Docker Engine 설치
1. apt package index을 업데이트하고 Docker Engine 및 containerd의 최신 버전을 설치하거나 다음 단계로 이동하여 특정 버전을 설치합니다.

```bash
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

2. 특정 버전의 Docker Engine을 설치하려면 저장소에서 사용 가능한 버전을 나열한 후 다음을 선택하고 설치하십시오.

    - 저장소에서 사용 가능한 버전을 나열하십시오.  

    ```bash
    $ apt-cache madison docker-ce

    docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
    docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
    docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
    docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
    ...
    ```

    - 두 번째 열의 버전 문자열을 사용하여 특정 버전을 설치합니다 (예 : 5 : 18.09.1 ​​~ 3-0 ~ ubuntu-xenial).

    ``` bash
    $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
    ```
3. hello-world 이미지를 실행하여 Docker Engine이 올바르게 설치되었는지 확인하십시오.
```bash
$ sudo docker run hello-world
```
> 이 명령어는 테스트 이미지를 다운로드하고 컨테이너에서 실행합니다. 컨테이너가 실행되면 정보 메시지를 인쇄하고 종료합니다.

## 참고
[https://docs.docker.com/engine/install/ubuntu/#prerequisites](https://docs.docker.com/engine/install/ubuntu/#prerequisites)