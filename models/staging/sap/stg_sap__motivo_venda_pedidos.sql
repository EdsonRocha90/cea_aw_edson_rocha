with
    motivo_venda_pedidos as (
        select 
            cast(salesorderid as string) || '-' || cast(salesreasonid as int) as pk_motivo_venda_pedido
            ,cast(salesorderid as int) as fk_pedido_venda
            ,cast(salesreasonid as int) as fk_motivo_venda
        from {{ source('erp_adventure_works', 'salesorderheadersalesreason') }}
    )

select *
from motivo_venda_pedidos
