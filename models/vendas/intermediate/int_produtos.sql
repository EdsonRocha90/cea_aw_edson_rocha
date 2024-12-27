with 
    produtos as (
        select * 
        from {{ ref('stg_sap__produtos') }}
    ),

    int_produtos as (
        select 
            pk_produto
            ,data_inicio_vendas
            ,data_fim_vendas
            ,data_descontinuado
            ,descricao_produto
            ,numeracao_produto
            ,cor
            ,nivel_seguranca_estoque
            ,ponto_reencomenda
            ,custo_padrao
            ,preco_listado
            ,tamanho
            ,unidade_medida
            ,unidade_peso
            ,peso
            ,dias_fabricacao
            ,linha_produto
            ,categoria
            ,modelo
            ,codigo_subcategoria
            ,codigo_modelo
            ,flag_produto_acabado
            ,flag_criado
        from produtos
    )

select * 
from int_produtos
