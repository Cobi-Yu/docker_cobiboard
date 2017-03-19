# Docker 스터디


## 목적
---
새로운 언어 및 Frameworke 및 스터디용 api 서버 구축


### done
---
- APM (apache, php, mysql) 설치 및 service start
- index까지는 게시판 동작
- rewrite php module load 완료

### to do
---
- /etc/apache2/apache2.conf config 수정 (allowoverride None -> allowoverride ALL)
``bash
<Directory /var/www/>
    ┆   Options Indexes FollowSymLinks
    ┆   AllowOverride None  --> AllowOverride ALL
    ┆   Require all granted
</Directory>
``
- entrypoint.sh 실행방법 개선`
