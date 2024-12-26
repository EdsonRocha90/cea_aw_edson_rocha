with
    territorio_vendas as (
        select 
            cast(territoryid as int) as pk_territorio
            ,countryregioncode as fk_pais
            ,name as territorio
            ,"group" as grupo_territorio
            ,cast(salesytd as numeric(38,2)) as vendas_acumuladas
            ,cast(saleslastyear as numeric(38,2)) as vendas_ultimo_ano
            ,cast(costytd as numeric(38,2)) as custo_acumulado
            ,cast(costlastyear as numeric(38,2)) as custo_ultimo_ano
        from {{ source('erp_adventure_works', 'salesterritory') }}
    )

select *
from territorio_vendas
