select
   concat(
   ' insert into RN_AnalisisPedidos.RAW_Pedidos values (',
   '''',
    pedidos.invoice_date,''',',
        pedidos.id_order,',''',
    pedidos.reference,''',',
    pedidos.total_paid,',''',
    pedidos.payment,''',''',
    clientes.firstname,''',''',
    clientes.lastname,''',''',
    direccion.phone,''',''',
    provincia.name,''',',
    detalle.id_order_detail,',''',
    detalle.product_reference,''',''',
    detalle.product_name,''',',
    detalle.unit_price_tax_incl,',',
    detalle.product_quantity,',',
    detalle.total_price_tax_incl,
	');') as ''
from regalonatural.ps_orders pedidos
left outer join regalonatural.ps_customer clientes
on pedidos.id_customer=clientes.id_customer
inner join regalonatural.ps_address direccion
on clientes.id_customer=direccion.id_customer
inner join regalonatural.ps_state provincia
on direccion.id_state=provincia.id_state
left outer join regalonatural.ps_order_detail detalle
on pedidos.id_order=detalle.id_order
where pedidos.valid=1
order by pedidos.id_order DESC;

