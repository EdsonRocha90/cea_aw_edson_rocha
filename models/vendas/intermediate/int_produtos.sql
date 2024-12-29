with 
    produtos as (
        select * 
        from {{ ref('stg_sap__produtos') }}
    ),

    int_produtos as (
        select 
            pk_produto
            ,data_inicio_vendas as data_inicio_vendas_produto
            ,data_fim_vendas as data_fim_vendas_produto
            ,data_descontinuado as data_produto_descontinuado
            ,descricao_produto
            ,numeracao_produto
            ,cor as cor_produto
            ,nivel_seguranca_estoque
            ,ponto_reencomenda
            ,custo_padrao
            ,preco_listado
            ,tamanho
            ,unidade_medida
            ,unidade_peso
            ,peso as peso_produto
            ,dias_fabricacao
            ,linha_produto
            ,categoria as categoria_produto
            ,modelo as modelo_produto
            ,codigo_subcategoria as cod_subcategoria_produto
            ,codigo_modelo as cod_modelo_produto
            ,flag_produto_acabado
            ,flag_criado
        from produtos
    )

select * 
from int_produtos
