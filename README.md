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
$ bundle install --without production
```

マイグレーション
---------------

```
$ bin/rake db:migrate
```

起動
----

```
$ bin/rails server --port 3000
```

アクセス
--------

ブラウザで[http://localhost:3000/](http://localhost:3000/)にアクセス

Author
------

[小久保温(Atsushi Kokubo)](http://www.dma.aoba.sendai.jp/~acchan/).
