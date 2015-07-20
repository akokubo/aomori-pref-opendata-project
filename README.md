README
======

ダウンロード
-----------

```
$ git clone https://github.com/akokubo/opencampus_workshop.git
```

Gemのインストール
----------------

```
$ cd opencampus_workshop
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
Amazon S3にアカウントを作成し、S3_ACCESS_KEYなどを取得する。
ちなみに、Tokyoリージョンの場合、regionはap-northeast-1

```
$ heroku create
$ heroku config:set S3_ACCESS_KEY=<access key>
$ heroku config:set S3_SECRET_KEY=<secret key>
$ heroku config:set S3_REGION=<region>
$ heroku config:set S3_BUCKET=<bucket name>
$ git push heroku
$ heroku run rake db:migrate
```

注意事項
-------

Wikiのように使うことを想定しており、編集モードに切り替えると、誰でも書き込めますので、ご注意ください。

Author
------

[小久保温(Atsushi Kokubo)](http://www.dma.aoba.sendai.jp/~acchan/).
