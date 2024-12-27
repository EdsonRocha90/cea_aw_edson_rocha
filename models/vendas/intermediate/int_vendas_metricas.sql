with 
    pedidos_venda as (
        select * 
        from {{ ref('stg_sap__pedidos_venda') }}
    ),

    itens_pedido as (
        select * 
        from {{ ref('stg_sap__itens_pedido') }}
    ),

    vendas_metricas as (
        select 
            item.pk_item_pedido
            ,vend.fk_cliente
            ,item.fk_produto
            ,vend.fk_vendedor
            ,vend.fk_territorio
            ,vend.fk_endereco_fatura
            ,vend.fk_endereco_entrega
            ,vend.fk_cartao_credito
            ,vend.pk_pedido_venda as pedido_venda
            ,vend.data_pedido
            ,vend.data_validade_pedido
            ,item.quantidade
            ,item.preco_unitario
            ,item.perc_desconto
            ,item.preco_unitario * item.quantidade as valor_negociado
            ,item.preco_unitario * item.quantidade - (1-item.perc_desconto) as valor_negociado_liquido
            ,vend.frete / (count(*) over(partition by vend.pk_pedido_venda)) as frete_rateado
            ,vend.status
            ,vend.numero_revisao
            ,vend.flag_pedido_online
        from pedidos_venda vend
        inner join itens_pedido item on vend.pk_pedido_venda = item.fk_pedido_venda
    )

select * 
from vendas_metricas
