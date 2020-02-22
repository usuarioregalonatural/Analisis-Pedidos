<?php
require_once('../partials/cabecerapedidosIni.html');

$id_pedido=$_GET['idpedido'];

require_once ('../funciones/funciones.php');
require_once ('../config/config.php');
require_once ('../model/datospedidos.php');

?>

<div class="container-fluid">
    <div class="card mb-3">
        <div class="card-header">



            <div class="container text-center">
                <h2>Información Pedido: <?php echo $id_pedido ?></h2>
            </div><!--/.container-->

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
                            $sentenciaSQL=file_get_contents("../sql/" ."pedidoconcreto.sql");
                            $sentenciafinal=$sentenciaSQL . " where id_pedido=" .  $id_pedido . ";";
                            $datos=new DatosPedidosSQL();
                            $datos->consulta=$sentenciafinal;
                            $datos->obtenerdatos();
                            foreach ($datos->resultado as $registro) {
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
                    <div class="container text-center">
                        <h2>Detalles Pedido</h2>
                    </div><!--/.container-->

                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Precio Unidad</th>
                                <th>Cantidad</th>
                                <th>Total Productos</th>
                            </tr>
                            </thead>
                            <tfoot>
                            </tfoot>
                            <tbody>

                            <?php
                            $sentenciaSQL=file_get_contents("../sql/" ."detalle_pedido.sql");
                            $sentenciafinal=$sentenciaSQL . " where id_pedido=" .  $id_pedido . " order by id_linea_pedido;";
                            $datosdet=new DatosPedidosSQL();
                            $datosdet->consulta=$sentenciafinal;
                            $datosdet->obtenerdatos();
                            foreach ($datosdet->resultado as $registro) {
                                echo "<td>" . $registro['descripcion_producto'] . "</td>";
                                echo "<td>" . $registro['precio_unitario_producto'] . "</td>";
                                echo "<td>" . $registro['cantidad_producto'] . "</td>";
                                echo "<td>" . $registro['total_productos'] . "</td>";
                                echo "<td>" . "</td>";
                                echo "</tr>";
                            }
                            ?>
                            </tbody>




                    </table>
                </div>
            </div>

        </div>

    </div>

</div>


<?php
require_once('../partials/cabecerapedidosFin.html');

?>