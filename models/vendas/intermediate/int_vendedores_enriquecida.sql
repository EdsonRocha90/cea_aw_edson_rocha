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
            ,ven.fk_territorio
            ,fun.data_nascimento
            ,fun.data_contratacao
            ,pes.primeiro_nome
            ,pes.ultimo_sobrenome
            ,pes.nome_completo
            ,fun.cargo
            ,fun.login_funcionario
            ,ter.territorio
            ,ter.grupo_territorio
            ,ven.cota_vendas
            ,ven.bonus
            ,ven.perc_comissao
            ,ven.vendas_acumuladas
            ,ven.vendas_ultimo_ano
            ,fun.genero
            ,fun.estado_civil
        from vendedores ven 
        left join funcionarios fun on ven.pk_vendedor = fun.pk_funcionario 
        left join pessoas pes on ven.pk_vendedor = pes.pk_pessoa 
        left join territorio_vendas ter on ven.fk_territorio = ter.pk_territorio
    )

select * 
from vendedores_enriquecida
