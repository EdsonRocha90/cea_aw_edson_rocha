with
    pedidos_venda as (
        select 
            cast(salesorderid as int) as pk_pedido_venda
            ,cast(customerid as int) as fk_cliente
            ,cast(salespersonid as int) as fk_vendedor
            ,cast(territoryid as int) as fk_territorio
            ,cast(billtoaddressid as int) as fk_endereco_fatura
            ,cast(shiptoaddressid as int) as fk_endereco_entrega
            ,cast(shipmethodid as int) as fk_metodo_entrega
            ,cast(orderdate as date) as data_pedido
            ,cast(duedate as date) as data_validade_pedido
            ,cast(shipdate as date) as data_envio
            ,cast(status as int) as status
            ,purchaseordernumber as codigo_pedido_compra
            ,accountnumber as numero_conta
            ,cast(subtotal as numeric (38,2)) as subtotal
            ,cast(taxamt as numeric (38,2)) as imposto_amt
            ,cast(freight as numeric (38,2)) as frete
            ,cast(totaldue as numeric (38,2)) as total_devido
            ,cast(revisionnumber as numeric (38,2)) as numero_revisao
            ,cast(onlineorderflag as boolean) as flag_pedido_online
            ,cast(comment as string) as comentario
        from {{ source('erp_adventure_works', 'salesorderheader') }}
    )

select *
from pedidos_venda
