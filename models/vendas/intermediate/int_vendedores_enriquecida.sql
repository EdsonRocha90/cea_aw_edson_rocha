with 
    vendedores as (
        select * 
        from {{ ref('stg_sap__vendedores') }}
    ),

    funcionarios as (
        select * 
        from {{ ref('stg_sap__funcionarios') }}
    ),

    pessoas as (
        select * 
        from {{ ref('stg_sap__pessoas') }}
    ),

    territorio_vendas as (
        select * 
        from {{ ref('stg_sap__territorio_vendas') }}
    ),

    vendedores_enriquecida as (
        select 
            ven.pk_vendedor
            ,fun.data_nascimento as data_nasc_vendedor
            ,fun.data_contratacao as data_contratacao_vendedor
            ,pes.primeiro_nome as prim_nome_vendedor
            ,pes.ultimo_sobrenome as ult_nome_vendedor
            ,pes.nome_completo as nome_vendedor
            ,fun.cargo as cargo_vendedor
            ,fun.login_funcionario as login_vendedor
            ,ter.territorio as territorio_vendedor
            ,ter.grupo_territorio as grupo_territorio_vendedor
            ,ter.fk_pais as pais_territorio_vendedor
            ,ven.cota_vendas
            ,ven.bonus as bonus_vendedor
            ,ven.perc_comissao
            ,ven.vendas_acumuladas as vendas_acumuladas_vendedor
            ,ven.vendas_ultimo_ano as vendas_ultimo_ano_vendedor
            ,fun.genero as genero_vendedor
            ,fun.estado_civil as estado_civil_vendedor
        from vendedores ven 
        left join funcionarios fun on ven.pk_vendedor = fun.pk_funcionario 
        left join pessoas pes on ven.pk_vendedor = pes.pk_pessoa 
        left join territorio_vendas ter on ven.fk_territorio = ter.pk_territorio
    )

select * 
from vendedores_enriquecida
