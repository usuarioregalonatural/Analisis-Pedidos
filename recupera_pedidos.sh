source ./conf/configuracion.conf

echo "Contenedor BBDD ORIGEN: ${contenedor_mysql_origen}"

docker exec -i ${contenedor_mysql_origen} /usr/bin/mysql -u root --password=vmsn2004 regalonatural --batch --raw < ./sql/trae_todo_inicial.sql > ./datos/extraccion.txt
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./datos/extraccion.txt
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./sql/carga_cabeceras.sql
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./sql/carga_detalle.sql



