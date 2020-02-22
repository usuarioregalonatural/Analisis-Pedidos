<?php
require_once ('../partials/partial01.html');

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
    echo "<td>" . $registro['id_pedido'] . "</td>";
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
require_once ('../partials/partial01fin.html');

?>