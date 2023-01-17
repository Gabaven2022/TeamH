## README

#### 開発環境
- Windows10
- Docker 20.10.17
- docker内
  - Ruby 3.1.2p20
  - Rails 7.0.4
  - MySQL 8.0.31

### 環境準備

1. [docker](https://docs.docker.com/desktop/install/windows-install/)をインストールする。

1. `mkdir 任意フォルダ` (例：`mkdir TeamH_app`)、

1. `cd 任意のフォルダ` (例：`cd TeamH_app`)

1. `git clone [git@github.com:Gabaven2022/TeamH.git] .`
1. `sudo apt upgrade`

1. `docker-compose build`

1. 作成された**config/database.yml**の**host**と**password**を書き換える。<br>
  ```
  development:
    <<: *default
    database: myapp_development
    host: db  #変更前host: localhost
    username: root
    password: password  #変更前 password:

  # Warning: The database defined as "test" will be erased and
  # re-generated from your development database when you run "rake".
  # Do not set this db to the same as development or production.
  test:
    <<: *default
    database: myapp_test
    host: db
    username: root
    password: password
  ```
8. `docker-compose run web rails db:create`

1. `docker-compose up`

1. [http://localhost:3001/](http://localhost:3001/)にアクセスする。

1. 環境構築完了！！

### 使えるコマンド
`docker-compose up`した後、`docker ps`で起動しているコンテナを確認しコンテナIDを確認する。(teamh_web_a, mysql:8.0)<br>
`docker exec -it <コンテナID> bash` を行うと`rails g controll tests`、`mysql -u root -p`(password: password)でmysqlのコマンドが使える。<br>
