README
======

1. ダウンロード

```
$ git clone https://github.com/akokubo/opencampus_workshop.git
```

2. Gemのインストール

```
$ cd opencampus_workshop
$ bundle install --without production
```

3. マイグレーション

```
$ bin/rake db:migrate
```

4. 起動

```
$ bin/rails server --port 3000
```

5. アクセス

ブラウザで[http://localhost:3000/](http://localhost:3000/)にアクセス

Author
------

[小久保温(Atsushi Kokubo)](http://www.dma.aoba.sendai.jp/~acchan/).
