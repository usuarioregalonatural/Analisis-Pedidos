#docker run -d -p 7070:80 -p 7071:3306  -v /home/UTILES/Analisis-Pedidos/www:/var/www/html -v /home/UTILES/Analisis-Pedidos/bbdd:/var/lib/mysql --name mysql-analisis-pedidos -h analisispedidos vicsoft01/ubuntu18.04-apache2.2-php7.3.11

docker stop analisis-pedidos-phpMyAdmin
docker rm  analisis-pedidos-phpMyAdmin
docker stop analisis-pedidos-www
docker rm  analisis-pedidos-www
docker stop analisis-pedidos-bbdd
docker rm  analisis-pedidos-bbdd





#docker run -d -p 7071:3306 -v /home/UTILES/Analisis-Pedidos/bbdd:/var/lib/mysql --name analisis-pedidos-bbdd -h db-analisispedidos mysql:5.7
#docker run -d -p 7071:3306 -e --secure-file-priv="/var/lib/mysql" -v /home/UTILES/Analisis-Pedidos/bbdd:/var/lib/mysql --name analisis-pedidos-bbdd -h db-analisispedidos mysql:5.7
#docker run -d -p 7071:3306 -v /home/UTILES/Analisis-Pedidos/bbdd/ficheros-sec-mysql:/var/lib/mysql-files/ -v /home/UTILES/Analisis-Pedidos/bbdd:/var/lib/mysql --name analisis-pedidos-bbdd -h db-analisispedidos mysql:5.7
docker run -d -p 7071:3306 -v /home/UTILES/Analisis-Pedidos/bbdd:/var/lib/mysql --name analisis-pedidos-bbdd -h db-analisispedidos mysql:5.7
docker run -d -p 7070:80 -v /home/UTILES/Analisis-Pedidos/www:/var/www/html --name analisis-pedidos-www -h analisispedidos --link analisis-pedidos-bbdd:db vicsoft01/ubuntu18.04-apache2.2-php7.3.11
docker run -d -p 7072:80 --name analisis-pedidos-phpMyAdmin -h admin-db-analisispedidos --link analisis-pedidos-bbdd:db phpmyadmin/phpmyadmin

