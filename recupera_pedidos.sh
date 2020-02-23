source ./conf/configuracion.conf


function activa_inserciones_fechas_vacias (){
        echo "#### Activando Fechas Vacias"
        activa_fechas_vacias="SET GLOBAL sql_mode = '';"
        echo ${activa_fechas_vacias}>./activa.sql
        comando_docker="docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root -pvmsn2004 RN_AnalisisPedidos  "
        comando_activa="${comando_docker} < ./activa.sql"
        ejecutar="${comando_activa}"
        echo ${ejecutar} > ./activa_fechas_vacias.sh
        bash ./activa_fechas_vacias.sh
        rm ./activa.sql
        rm ./activa_fechas_vacias.sh
}


function desactiva_inserciones_fechas_vacias (){
        echo "#### Desactivando Fechas Vacias"
        activa_fechas_vacias="SET GLOBAL sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';"
        echo ${activa_fechas_vacias}>./activa.sql
        comando_docker="docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root -pvmsn2004 RN_AnalisisPedidos  "
        comando_activa="${comando_docker} < ./activa.sql"
        ejecutar="${comando_activa}"
        echo ${ejecutar} > ./activa_fechas_vacias.sh
        bash ./activa_fechas_vacias.sh
        rm ./activa.sql
        rm ./activa_fechas_vacias.sh
}

echo "Contenedor BBDD ORIGEN: ${contenedor_mysql_origen}"

docker exec -i ${contenedor_mysql_origen} /usr/bin/mysql -u root --password=vmsn2004 regalonatural --batch --raw < ./sql/trae_todo_inicial.sql > ./datos/extraccion.txt
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./sql/borra_raw.sql

activa_inserciones_fechas_vacias

docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./datos/extraccion.txt
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./sql/carga_cabeceras.sql
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ./sql/carga_detalle.sql

desactiva_inserciones_fechas_vacias

