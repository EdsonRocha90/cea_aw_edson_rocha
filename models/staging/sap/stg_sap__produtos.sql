with
    produtos as (
        select 
            cast(productid as int) as pk_produto
            ,cast(sellstartdate as date) as data_inicio_vendas
            ,cast(sellenddate as date) as data_fim_vendas
            ,discontinueddate as data_descontinuado
            ,name as descricao_produto
            ,productnumber as numeracao_produto
            ,color as cor
            ,cast(safetystocklevel as int) as nivel_seguranca_estoque
            ,cast(reorderpoint as int) as ponto_reencomenda
            ,cast(standardcost as numeric(38,2)) as custo_padrao
            ,cast(listprice as numeric(38,2)) as preco_listado
            ,size as tamanho
            ,sizeunitmeasurecode as unidade_medida
            ,weightunitmeasurecode as unidade_peso
            ,cast(weight  as numeric(38,2)) as peso
            ,cast(daystomanufacture as int) as dias_fabricacao
            ,productline as linha_produto
            ,class as categoria
            ,style as modelo
            ,cast(productsubcategoryid as int) as codigo_subcategoria
            ,cast(productmodelid as int) as codigo_modelo
            ,cast(finishedgoodsflag as boolean) as flag_produto_acabado
            ,cast(makeflag as boolean) as flag_criado
        from {{ source('erp_adventure_works', 'product') }}
    )

select *
from produtos
