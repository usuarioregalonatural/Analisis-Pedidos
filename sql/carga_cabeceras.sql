insert into RN_AnalisisPedidos.Cabeceras_Pedidos
SELECT
fecha,
id_pedido,
referencia,
metodo_pago,
concat(nombre_cliente, ' ', apellidos_cliente),
telefono_cliente,
provincia_cliente,
total_pedido,
estado_pedido
FROM RN_AnalisisPedidos.RAW_Pedidos
where (fecha,id_pedido) not in (select fecha, id_pedido from RN_AnalisisPedidos.Cabeceras_Pedidos)
group by 1,2,3,4,5,6,7,8,9
order by fecha desc;

