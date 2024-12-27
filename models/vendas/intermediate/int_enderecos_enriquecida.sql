with 
    enderecos as (
        select * 
        from {{ ref('stg_sap__enderecos') }}
    ),

    estados as (
        select * 
        from {{ ref('stg_sap__estados') }}
    ),

    paises as (
        select * 
        from {{ ref('stg_sap__paises') }}
    ),

    territorio_vendas as (
        select * 
        from {{ ref('stg_sap__territorio_vendas') }}
    ),

    enderecos_enriquecida as (
        select
            ende.pk_endereco
            ,ende.fk_estado
            ,ende.endereco
            ,ende.complemento
            ,ende.cidade
            ,ende.cep
            ,est.estado
            ,est.sigla_estado
            ,pais.pais
            ,pais.pk_pais as sigla_pais
            ,ter.territorio
            ,ter.grupo_territorio
        from enderecos ende
        left join estados est on ende.fk_estado = est.pk_estado
        left join paises pais on est.fk_pais = pais.pk_pais 
        left join territorio_vendas ter on est.fk_territorio = ter.pk_territorio
    )

select * 
from enderecos_enriquecida
