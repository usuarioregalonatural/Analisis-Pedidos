SELECT
estado_pedido,
fecha,
id_pedido,
referencia,
metodo_pago,
nombre_cliente,
precio_total_pedido,
provincia_cliente,
telefono_cliente
from Cabeceras_Pedidos
order by id_pedido DESC;
