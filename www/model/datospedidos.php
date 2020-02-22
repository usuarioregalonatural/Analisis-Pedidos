<?php
/**
 * Created by PhpStorm.
 * User: Victor
 * Date: 22/02/2020
 * Time: 10:58
 */
require_once('conexionPDOWeb.php');
require_once('../funciones/funciones.php');

class DatosPedidos extends conexionPDOWeb
{
    public $resultado;
    public $ficheroSQL;
    function obtenerdatos(){
        parent::conectar();
//        $consulta=Fichero_SQL("Carros-Pedidos.sql");
        $consulta=Fichero_SQL($this->ficheroSQL);
        //      echo $consulta;
        $this->resultado=parent::obtiene_consulta($consulta);
        parent::desconectar();
    }

}
