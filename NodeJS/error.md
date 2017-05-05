
# error
> nodemon 실행 시 해당 에러가 발생 시 [nodemon] Internal watch failed: watch ENOSPC
>
> 명령어 입력
>```
>echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
