## README

#### 開発環境
- Windows10
- Docker 20.10.17
  - Ruby 3.1.2p20
  - Rails 7.0.4
  - MySQL 8.0.31

### 環境準備

1. [docker](https://docs.docker.com/desktop/install/windows-install/)をインストールする。<br><br>

1. `mkdir 任意フォルダ` (例：`mkdir TeamH_app`)<br><br>

1. `cd 任意のフォルダ` (例：`cd TeamH_app`)<br><br>

1. `git clone [git@github.com:Gabaven2022/TeamH.git] .`<br><br>

1. `git pull nakao`<br><br>

1. `sudo apt upgrade`<br><br>

1. `docker-compose build`<br><br>

1. `docker-compose run web rails db:create`<br><br>

1. `docker-compose up`<br><br>

1. [http://localhost:3001/](http://localhost:3001/)にアクセスする。<br><br>

1. 環境構築完了！！<br><br>

### #使えるコマンド
`docker-compose up`した後、`docker ps`で起動しているコンテナを確認しコンテナIDを確認する。(teamh_web_a, mysql:8.0)<br><br>

`docker exec -it <コンテナID> bash` を行うと`rails g controll tests`、`mysql -u root -p`(password: password)でmysqlのコマンドが使える。
