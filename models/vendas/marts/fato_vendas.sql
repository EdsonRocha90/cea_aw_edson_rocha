with
    int_vendas_metricas as (
        select *
        from {{ ref('int_vendas_metricas') }}
    ),

    fato_vendas as (
        select 
            pk_item_pedido
            ,fk_cliente
            ,fk_produto
            ,fk_vendedor
            ,fk_territorio
            ,fk_endereco_fatura
            ,fk_endereco_entrega
            ,fk_cartao_credito
            ,pedido_venda
            ,data_pedido
            ,data_validade_pedido
            ,quantidade
            ,preco_unitario
            ,perc_desconto
            ,valor_negociado
            ,valor_negociado_liquido
            ,frete_rateado
            ,status
            ,numero_revisao
            ,flag_pedido_online
        from int_vendas_metricas
    )

select * 
from fato_vendas
