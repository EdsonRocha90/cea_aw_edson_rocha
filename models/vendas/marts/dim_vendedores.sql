with
    int_vendedores_enriquecida as (
        select *
        from {{ ref('int_vendedores_enriquecida') }}
    ),

    dim_vendedores as (
        select 
            pk_vendedor
            ,data_nasc_vendedor
            ,data_contratacao_vendedor
            ,prim_nome_vendedor
            ,ult_nome_vendedor
            ,nome_vendedor
            ,cargo_vendedor
            ,login_vendedor
            ,territorio_vendedor
            ,grupo_territorio_vendedor
            ,pais_territorio_vendedor
            ,cota_vendas
            ,bonus_vendedor
            ,perc_comissao
            ,vendas_acumuladas_vendedor
            ,vendas_ultimo_ano_vendedor
            ,genero_vendedor
            ,estado_civil_vendedor
        from int_vendedores_enriquecida
    )

select * 
from dim_vendedores
