<?php
/**
 * Created by PhpStorm.
 * User: Victor
 * Date: 22/02/2020
 * Time: 11:02
 */

function CambiaTexto($textoorigen){
    $tmptexto=$textoorigen . "hola";
    return $tmptexto;
}

function ExtraeFecha($cadena){
    $separador="-";
    $tmpanyo=substr($cadena,0,4);
    $tmpmes=substr($cadena,4,2);
    $tmpdia=substr($cadena,6,2);

    $tmpresultado=$tmpanyo . $separador . $tmpmes . $separador . $tmpdia;
    return $tmpresultado;
}

function ExtraeHora($cadena){
    $separador=":";
    $tmphora=substr($cadena,8,2);
    $tmpminuto=substr($cadena,10,2);
    $tmpsegundo=substr($cadena,12,2);

    $tmpresultado=$tmphora . $separador . $tmpminuto . $separador . $tmpsegundo;
    return $tmpresultado;
}

function LeeJson($archivo){
    $datos=json_decode(file($archivo),true);

}

function A_Fecha_Mysql($fechastring){
    $fechamysql=date('Y-m-d H:i:s',strtotime(ExtraeFecha($fechastring). "" . ExtraeHora($fechastring)));
    return $fechamysql;
}

function Porcen_Completo($valor_maximo, $valor_actual){
    $tmpresultado=($valor_actual*100)/$valor_maximo;
    //   echo "El resultado tmp es: " . $tmpresultado . "<br>";
    $resultado=round($tmpresultado,2,PHP_ROUND_HALF_UP);
    // echo "Redondeado es: " .$resultado . "<br>";
    //   echo "Redondeando: 11.3286-->" . round(11.3286,2,PHP_ROUND_HALF_UP). "<br>";
    return $resultado;
}

function Fichero_SQL($nombre_sql_file){
    $sql="";
//    $fichero="../../SQL/" . $nombre_sql_file;
    $fichero=$nombre_sql_file;
    $fp=fopen($fichero,"r");
    $contenido=fread($fp,filesize($fichero));
    return $contenido;
}