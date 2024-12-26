with
    itens_pedido as (
        select 
            cast(salesorderid as string) || '-' || cast(productid as string) as pk_item_pedido
            ,cast(salesorderid as int) as fk_pedido_venda
            ,cast(productid as int) as fk_produto
            ,cast(orderqty as numeric(38,2)) as quantidade
            ,cast(unitprice as numeric(38,2)) as preco_unitario
            ,cast(unitpricediscount as numeric(38,2)) as perc_desconto
            ,cast(specialofferid as int) as fk_oferta_especial
        from {{ source('erp_adventure_works', 'salesorderdetail') }}
    )

select *
from itens_pedido
