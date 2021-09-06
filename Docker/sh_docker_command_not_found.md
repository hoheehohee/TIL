sh command not found error
=====

> ### ssh -o StrictHostKeyChecking=no 계정@host 'docker ps' 에러
> - 터미널 ssh 접속과 함께 쉘 스크립트를 작성 했을 때 docker ps command not found error가 났다
> - 이유는 먼저 /etc/ssh/sshd_config에서 PermitUserEnvironment yes로 되어 있지 않으면 user사용자의 환경변수로 PATH가 들어 있다고 해도, ssh로 수행하면 디폴트 PATH가 먹질 않는다.
> - 설정이 yes로 되어 있다고 해도 특정 쉘 예를 들어 docker 쉘의 심볼릭 링크파일이 생성이 안되어 있다면 위와 같은 에러가 발생하므로 
> ```bash
>  sudo ln -s /usr/local/bin/docker /usr/bin/docker
> ```
> - 해당 명령어로 심볼릭 링크를 생성 해주면 해결된다.
