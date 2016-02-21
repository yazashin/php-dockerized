# Macaron動作環境の構築手順
* 動作環境 ← こっちのはなし
* Macaron本体 (別リポジトリ)

## 基本的な構成

* [Nginx](http://nginx.org/)
* [MySQL](http://www.mysql.com/)
* [PHP-FPM](http://php-fpm.org/) (5.x系)
* [PHP-Composer](https://getcomposer.org)
* [HHVM](http://www.hhvm.com/)
* [Redis](http://redis.io/)
* [Elasticsearch](http://www.elasticsearch.org/)

**上記の構成に、別途macaronのプログラムをgit cloneしてきます。**

## 起動方法
0. Docker関連をインストールする
 [docker-compose](https://docs.docker.com/compose/install/)

0. このリポジトリをclone or DLする
/home 直下にDLしたとします
```sh
$ pwd
/home/php-dockerized
```

0. containerを起動する
DLしたディレクトリに移動して作業すること
```sh
$ cd /home/php-dockerized/
$ docker-compose up -d
```

0. 起動するとこうなります
※事前にdocker-machineが起動している必要があります
```sh
$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   ERRORS
default   *        virtualbox   Running   tcp://192.168.99.100:2376           
```
```sh
$ docker-compose ps
 Name                Command               State                                Ports
elastic   /docker-entrypoint.sh elas ...   Up      0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp                   
front     /usr/bin/supervisord             Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp, 0.0.0.0:9000->9000/tcp
mysql     /entrypoint.sh mysqld            Up      0.0.0.0:3306->3306/tcp                                           
redis     /entrypoint.sh redis-server      Up      0.0.0.0:6379->6379/tcp             
```

0. macaron本体をcloneしてきます  
ホストの ./www を container上の/var/www がマウントしています  
(= ./www配下を編集するとcontainer上のファイルも更新されます)

```sh
$ cd ./www
$ git clone ~~~~~/macaron.git
```

0. php-composerでmacaronをセットアップします
```sh
$ cd ./macaron
$ composer install
```

# License
[このリポジトリをforkしています](https://github.com/kasperisager/php-dockerized)。
当プログラムもMITライセンスを継承します。

Copyright &copy; 2016 [Shinnosuke Yazawa](https://github.com/yazashin/php-dockerized).
Licensed under the terms of the [MIT license](LICENSE.md).
