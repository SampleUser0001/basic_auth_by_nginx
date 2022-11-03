# nginxでBasic認証の設定を行う

- [nginxでBasic認証の設定を行う](#nginxでbasic認証の設定を行う)
  - [準備](#準備)
    - [apt install](#apt-install)
    - [ログインID, パスワード設定](#ログインid-パスワード設定)
    - [default.conf](#defaultconf)
    - [その他](#その他)
  - [実行](#実行)
  - [参考](#参考)

## 準備

### apt install

``` bash
# ユーザ/パスワードファイル = .htpasswdファイル作成のために使用する。
sudo apt-get install apache2-utils
```

### ログインID, パスワード設定

``` bash
# ログインID/パスワードを設定する。
sudo htpasswd -c etc/.htpasswd ${user} ${password}
```

作成したファイルのファイルパスは```/etc/nginx/conf.d/default.conf```に記載。

### default.conf

- ファイルパス : ```/etc/nginx/conf.d/default.conf```

``` conf
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;

        # 以下２行の設定を追加します。
        auth_basic "Restricted";
        auth_basic_user_file /etc/nginx/.htpasswd;        
    }
```

### その他

- nginxでBasic認証する場合は、htaccessは使わなくても設定できる。


## 実行

``` bash
docker-compose build
docker-compose up -d
```

[http://localhost](http://localhost)

- user : user
- pass : hogehoge

## 参考

- [nginxでBASIC認証をかけてみる:Qiita](https://qiita.com/You_name_is_YU/items/e8db11eaa10067556e52)