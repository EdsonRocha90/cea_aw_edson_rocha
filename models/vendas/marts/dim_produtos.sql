with
    int_produtos as (
        select *
        from {{ ref('int_produtos') }}
    ),

    dim_produtos as (
        select 
            pk_produto
            ,data_inicio_vendas_produto
            ,data_fim_vendas_produto
            ,data_produto_descontinuado
            ,descricao_produto
            ,numeracao_produto
            ,cor_produto
            ,nivel_seguranca_estoque
            ,ponto_reencomenda
            ,custo_padrao
            ,preco_listado
            ,tamanho
            ,unidade_medida
            ,unidade_peso
            ,peso_produto
            ,dias_fabricacao
            ,linha_produto
            ,categoria_produto
            ,modelo_produto
            ,cod_subcategoria_produto
            ,cod_modelo_produto
            ,flag_produto_acabado
            ,flag_criado
        from int_produtos
    )

select * 
from dim_produtos
