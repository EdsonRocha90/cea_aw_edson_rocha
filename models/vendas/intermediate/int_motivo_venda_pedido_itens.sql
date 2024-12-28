with 
    motivo_venda_pedidos as (
        select * 
        from {{ ref('stg_sap__motivo_venda_pedidos') }}
    ),

    int_vendas_metricas as (
        select * 
        from {{ ref('int_vendas_metricas') }}
    ),

    int_motivo_venda_pedido_itens as (
        select 
            vmt.pk_item_pedido || '-' || ifnull(mvp.fk_motivo_venda, '0') as pk_motivo_venda_item_pedido
            ,vmt.fk_cliente
            ,vmt.fk_produto
            ,vmt.fk_vendedor
            ,vmt.fk_territorio
            ,vmt.fk_endereco_fatura
            ,vmt.fk_endereco_entrega
            ,vmt.fk_cartao_credito
            ,mvp.fk_motivo_venda
            ,vmt.pedido_venda
            ,vmt.data_pedido
            ,vmt.data_validade_pedido
            ,vmt.quantidade
            ,vmt.preco_unitario
            ,vmt.perc_desconto
            ,vmt.valor_negociado
            ,vmt.valor_negociado_liquido
            ,vmt.frete_rateado
            ,vmt.status
            ,vmt.numero_revisao
            ,vmt.flag_pedido_online
        from int_vendas_metricas vmt
        left join motivo_venda_pedidos mvp on vmt.pedido_venda = mvp.fk_pedido_venda
    )

select * 
from int_motivo_venda_pedido_itens
