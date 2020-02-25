

log(){
	now
	pref_fecha="# ${curl} - "
	if [ -f ${FICHERO_LOG} ];
	then
		echo ${pref_fecha} $1 >> ${FICHERO_LOG}
	else
		echo ${pref_fecha} $1 > ${FICHERO_LOG}

	fi
	echo $1
}

now(){
        DIA=`date +%d`
        MES=`date +%m`
        ANYO=`date +%Y`
        HORA=`date +%H`
        MINUTOS=`date +%M`
        SEGUNDOS=`date +%S`
        MILISEGUNDOS=`date +%3N`
        tmptiempo=$ANYO-$MES-$DIA" "$HORA":"$MINUTOS":"$SEGUNDOS
        tmptiempo_sin_fecha=$HORA":"$MINUTOS":"$SEGUNDOS
 
        export curl=${tmptiempo}
}

