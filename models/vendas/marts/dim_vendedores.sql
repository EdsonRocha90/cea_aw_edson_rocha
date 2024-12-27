with
    int_vendedores_enriquecida as (
        select *
        from {{ ref('int_vendedores_enriquecida') }}
    ),

    dim_vendedores as (
        select 
            pk_vendedor
            ,fk_territorio
            ,data_nascimento
            ,data_contratacao
            ,primeiro_nome
            ,ultimo_sobrenome
            ,nome_completo
            ,cargo
            ,login_funcionario
            ,territorio
            ,grupo_territorio
            ,cota_vendas
            ,bonus
            ,perc_comissao
            ,vendas_acumuladas
            ,vendas_ultimo_ano
            ,genero
            ,estado_civil
        from int_vendedores_enriquecida
    )

select * 
from dim_vendedores
