with
    vendedores as (
        select 
            cast(businessentityid as int) as pk_vendedor
            ,cast(territoryid as int) as fk_territorio
            ,cast(salesquota as numeric(38,2)) as cota_vendas
            ,cast(bonus as numeric(38,2)) as bonus
            ,cast(commissionpct as numeric(38,2)) as perc_comissao
            ,cast(salesytd as numeric(38,2)) as vendas_acumuladas
            ,cast(saleslastyear as numeric(38,2)) as vendas_ultimo_ano
        from {{ source('erp_adventure_works', 'salesperson') }}
    )

select *
from vendedores