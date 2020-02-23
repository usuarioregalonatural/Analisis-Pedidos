insert into RN_AnalisisPedidos.Detalle_Pedidos
SELECT 
id_linea_pedido,
id_pedido,
referencia_producto,
descripcion_producto,
precio_unitario_producto,
sum(cantidad_producto),
sum(precio_unitario_producto*cantidad_producto)
FROM RN_AnalisisPedidos.RAW_Pedidos
where id_pedido not in (select id_pedido from RN_AnalisisPedidos.Detalle_Pedidos)
group by 1,2,3,4,5
order by id_pedido, id_linea_pedido;


