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
$ bin/rake db:migrate
```

初期データ投入
-------------
```
$ bin/rake db:seed
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

Herokuへのデプロイ
-----------------
Amazon Web Servicesのアカウントを取得する。

Amazon S3でバケットを作成する。

IAMでユーザーを作り、AccessキーとSecretキーを取得する。
IAMのユーザーに対し、S3バケットの読み書き権限を付与する。

以下のようにHerokuにアプリを作り、環境変数を設定する。
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
$ heroku run rake db:migrate
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
