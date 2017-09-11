README
======

事前準備
--------
Ruby、Git、Heroku Toolbelt、Ruby on Rails 5.1.4、ImageMagickをインストールしておく。

Cloud9でRails Tutorialをテンプレートにした場合、Ruby、Git、Heroku Toolbeltはインストール済み。
Ruby on Rails 5.1.4とImageMagickのインストールは、以下のようにする。
```
$ gem install rails -v 5.1.4
$ sudo apt-get update
$ sudo apt-get install imagemagick --fix-missing
```

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

テスト
-----
```
$ rails test
```

起動
----
Google Maps APIのキーを取得しておく。

ローカル環境の場合の起動
```
$ GOOGLE_MAPS_API_KEY=<Google Maps API Key> bin/rails server
```

Cloud9の場合の起動
```
$ GOOGLE_MAPS_API_KEY=<Google Maps API Key> bin/rails server -p $PORT -b $IP
```

アクセス
--------
ローカル環境の場合、ブラウザで[http://localhost:3000/](http://localhost:3000/)にアクセス

Cloud9の場合、[Share]→[Application]のURLの部分をクリック→[Open]

再初期化(必要な場合)
------------------
```
$ bin/rails db:migrate:reset
$ bin/rails db:seed
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
