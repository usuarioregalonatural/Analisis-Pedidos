source ./conf/configuracion.conf

echo "Contenedor de BBDD: ${contenedor_mysql}"

 
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 mysql < ./sql/crea_bbdd_inicial.sql


