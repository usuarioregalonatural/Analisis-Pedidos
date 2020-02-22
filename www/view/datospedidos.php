<?php
require_once('../partials/cabecerapedidosIni.html');

?>



<div class="container-fluid">

<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-table"></i>
        Pedidos</div>

<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>

                <th>Estado</th>
                <th>Nº Pedido</th>
                <th>Fecha Pedido</th>
                <th>Referencia</th>
                <th>Pago</th>
                <th>Cliente</th>
                <th>Total Pedido</th>
                <th>Telefono</th>
                <th>Provincia</th>
            </tr>
            </thead>
            <tfoot>
            </tfoot>
            <tbody>


<?php
require_once ('../funciones/funciones.php');
require_once ('../config/config.php');
require_once ('../model/datospedidos.php');

?>

<?php
$datos=new DatosPedidos();
$datos->ficheroSQL="../sql/" ."prueba.sql";
$datos->obtenerdatos();
foreach ($datos->resultado as $registro){
    //    $tamanyo=number_format($registro['size_fs']);
    echo "<tr>";
    $n_estado_pedido=$registro['estado_pedido'];
    switch ($n_estado_pedido){
        case 2:
            $estado_pedido="Pago Aceptado";
            echo "<td style='background-color: #17d133;color: black;font-size: small'>" . $estado_pedido . "</td>"; // Pago Aceptado
            break;
        case 3:
            $estado_pedido="En preparación";
            echo "<td style='background-color: #ffce2e;color: black;font-size: small'>" . $estado_pedido . "</td>"; // En Preparación
            break;
        case 4:
            $estado_pedido="Enviado";
            echo "<td style='background-color: #f4e6f7;color: black;font-size: small'>" . $estado_pedido . "</td>"; // Enviado
            break;
        case 5:
            $estado_pedido="Entregado";
            echo "<td style='background-color: #d8f0bd;color: black;font-size: small'>" . $estado_pedido . "</td>"; // Entregado
            break;
        case 6:
            $estado_pedido="Cancelado";
            echo "<td style='background-color: #f57d62;color: black;font-size: small'>" . $estado_pedido . "</td>"; // Cancelado
            break;
        case 8:
            $estado_pedido="Error Pago";
            echo "<td style='background-color: #ffe600;color: black;font-size: small'>" . $estado_pedido . "</td>"; // Error en Pago
            break;
        case 10:
            $estado_pedido="Pdte. Transferencia";
            echo "<td style='background-color: #9ae4fc;color: black;font-size: small'>" . $estado_pedido . "</td>"; // Pdte. Transf.
            break;

    }


    ?><td><a href=<?php  echo "'./datospedidosdetalle.php?idpedido=" . $registro['id_pedido'] . "'>". $registro['id_pedido'] . "</a></td>";
    echo "<td>" . $registro['fecha'] . "</td>";
    echo "<td>" . $registro['referencia'] . "</td>";
    echo "<td>" . $registro['metodo_pago'] . "</td>";
    echo "<td>" . $registro['nombre_cliente'] . "</td>";
    echo "<td>" . $registro['precio_total_pedido'] . "</td>";
    echo "<td>" . $registro['telefono_cliente'] . "</td>";
    echo "<td>" . $registro['provincia_cliente'] . "</td>";
    echo "<td>" . "</td>";
    echo "</tr>";
}
?>


            </tbody>
        </table>
    </div>
</div>
<div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>

</div>


<?php
require_once('../partials/cabecerapedidosFin.html');

?>