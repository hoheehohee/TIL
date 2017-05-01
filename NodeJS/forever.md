# forver
> 앱의 인스턴스를 관리해 주는 모듈
>
> forever list
> 현제 켜저 있는 리스트 목록
>
> forever stop PID번호
> 구동 중인 PID번호를 종료 시칸
>
> forever start 풀 경로
>  -  로그와 파일 생성 하며 forever 돌리기
>```
>forever start -l /home/ubuntu/data/kidsdev/log/forever-dev.log  -e  /home/ubuntu/data/kidsdev/log/error/error-dev.log -a app.js
>```
>서버 구동
>
> forever와 nodemon 같이 돌리기
> `forever start -c nodemon [filepath]`
> 실시간 로그 보기
> `tail -f [forever_log_path]`
