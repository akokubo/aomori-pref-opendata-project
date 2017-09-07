README
======

ダウンロード
-----------
```
$ git clone https://github.com/akokubo/aomori-pref-opendata-project.git
```

Gemのインストール
----------------
```
$ cd aomori-pref-opendata-project
$ bin/bundle install --without production
$ bin/bundle update
```

マイグレーション
---------------
```
$ bin/rails db:migrate
```

初期データ投入
-------------
```
$ bin/rails db:seed
```

起動
----
Google Maps APIのキーを取得しておく。

```
$ GOOGLE_MAPS_API_KEY=<Google Maps API Key> bin/rails server --port=3000
```

アクセス
--------
ブラウザで[http://localhost:3000/](http://localhost:3000/)にアクセス

再初期化
--------
```
$ bin rails db:migrate:reset
$ bin rails db:seed
```

Herokuへのデプロイ
-----------------
Amazon Web Servicesのアカウントを取得する。

Amazon S3でバケットを作成する。

Amazon IAMでユーザーを作り、AccessキーとSecretキーを取得する。
IAMのユーザーに対し、S3バケットの読み書き権限を付与する。

Herokuにアカウントを作る。

以下のようにHerokuにアプリを作り、環境変数を設定し、デプロイする。
なお、Tokyoリージョンの場合、S3_REGIONはap-northeast-1になる。

```
$ heroku create
$ heroku rename 変更したい名前
$ heroku config:set GOOGLE_MAPS_API_KEY=<Google Maps API key>
$ heroku config:set S3_ACCESS_KEY=<access key>
$ heroku config:set S3_SECRET_KEY=<secret key>
$ heroku config:set S3_REGION=<region>
$ heroku config:set S3_BUCKET=<bucket name>
$ git push heroku
$ heroku run rails db:migrate
$ heroku run rails db:seed
$ heroku open
```

Herokuのデータの再初期化を行う場合は以下のようにする。

```
$ heroku pg:reset DATABASE
$ heroku run rails db:migrate
$ heroku run rails db:seed
$ heroku open
```


注意事項
-------
Wikiのように使うことを想定しており、編集モードに切り替えると、誰でも書き込めますので、ご注意ください。

LICENSE
-------
[MIT License](LICENSE)


Author
------
[小久保温(Atsushi Kokubo)](https://akokubo.github.io/).
