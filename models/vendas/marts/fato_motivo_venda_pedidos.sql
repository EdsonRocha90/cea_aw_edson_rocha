with
    int_motivo_venda_pedido_itens as (
        select *
        from {{ ref('int_motivo_venda_pedido_itens') }}
    ),

    fato_motivo_vendas as (
        select 
            pk_motivo_venda_item_pedido
            ,fk_cliente
            ,fk_produto
            ,fk_vendedor
            ,fk_territorio
            ,fk_endereco_fatura
            ,fk_endereco_entrega
            ,fk_cartao_credito
            ,fk_motivo_venda
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
        from int_motivo_venda_pedido_itens
    )

select * 
from fato_motivo_vendas
