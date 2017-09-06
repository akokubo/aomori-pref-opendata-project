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

起動
----
```
$ bin/rails server --port=3000
```

アクセス
--------
ブラウザで[http://localhost:3000/](http://localhost:3000/)にアクセス


Herokuへのデプロイ
-----------------
Google Maps APIのキーを取得する。

Amazon Web Servicesのアカウントを取得する。

IAMでユーザーを作り、AccessキーとSecretキーを取得する。

Amazon S3でバケットを作成し、IAMのユーザーに対し、読み書き権限を付与する。
ちなみに、Tokyoリージョンの場合、regionはap-northeast-1になる。

```
$ heroku create
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
