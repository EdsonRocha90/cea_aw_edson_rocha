with 
    motivos_venda as (
        select * 
        from {{ ref('stg_sap__motivos_venda') }}
    ),

    motivo_venda_pedidos as (
        select * 
        from {{ ref('stg_sap__motivo_venda_pedidos') }}
    ),

    motivo_venda_pedidos_enriquecida as (
        select
            mvp.pk_motivo_venda_pedido
            ,mvp.fk_pedido_venda
            ,mvp.fk_motivo_venda
            ,mve.descr_motivo_venda
            ,mve.tipo_motivo
        from motivo_venda_pedidos mvp
        left join motivos_venda mve on mvp.fk_motivo_venda = mve.pk_motivo_venda
    )

select * 
from motivo_venda_pedidos_enriquecida
