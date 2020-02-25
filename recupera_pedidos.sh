source /home/MTTO-TIENDA/Analisis-Pedidos/conf/configuracion.conf
echo "Lanzando pedido...> " > /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}


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

echo "Trae todo inicial...> " >> /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}

docker exec -i ${contenedor_mysql_origen} /usr/bin/mysql -u root --password=vmsn2004 regalonatural --batch --raw < ${ruta_app}//sql/trae_todo_inicial.sql > ${ruta_app}/datos/extraccion.txt
echo "Borra RAW.> " >> /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ${ruta_app}/sql/borra_raw.sql

activa_inserciones_fechas_vacias

echo "Extraccion datos origen... " >> /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ${ruta_app}/datos/extraccion.txt
echo "Carga Cabeceras... " >> /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ${ruta_app}/sql/carga_cabeceras.sql
echo "Carga Detalle...> " >> /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}
docker exec -i ${contenedor_mysql} /usr/bin/mysql -u root --password=vmsn2004 RN_AnalisisPedidos --batch --raw < ${ruta_app}/sql/carga_detalle.sql

desactiva_inserciones_fechas_vacias

echo "FIN!!! " >> /home/MTTO-TIENDA/Analisis-Pedidos/logs/log_${ID_UNICO_PROCESO}

