create database RN_AnalisisPedidos;


create table RN_AnalisisPedidos.RAW_Pedidos (
fecha datetime,
id_pedido int(10),
referencia varchar(9),
total_pedido decimal(20,6),
metodo_pago varchar(255),
nombre_cliente varchar(255),
apellidos_cliente varchar(255),
telefono_cliente varchar(32),
provincia_cliente varchar(64),
id_linea_pedido int(10),
referencia_producto varchar(64),
descripcion_producto varchar(255),
precio_unitario_producto decimal(20,6),
cantidad_producto int(10),
precio_total_pedido decimal(20,6)
);


create table RN_AnalisisPedidos.Cabeceras_Pedidos (
fecha datetime,
id_pedido int(10),
referencia varchar(9),
metodo_pago varchar(255),
nombre_cliente varchar(255),
telefono_cliente varchar(32),
provincia_cliente varchar(64),
precio_total_pedido decimal(20,6)
);

create table RN_AnalisisPedidos.Detalle_Pedidos (
id_linea_pedido int(10),
id_pedido int(10),
referencia_producto varchar(64),
descripcion_producto varchar(255),
precio_unitario_producto decimal(20,6),
cantidad_producto int(10),
total_productos decimal(20,6)
);

