README
======


[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/akokubo/opencampus_workshop)

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

注意事項
-------

Wikiのように使うことを想定しており、編集モードに切り替えると、誰でも書き込めますので、ご注意ください。

Author
------

[小久保温(Atsushi Kokubo)](http://www.dma.aoba.sendai.jp/~acchan/).
