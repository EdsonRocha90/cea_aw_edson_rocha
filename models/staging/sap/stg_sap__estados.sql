with
    estados as (
        select 
            cast (stateprovinceid as int) as pk_estado
            ,cast(territoryid as int) fk_territorio
            ,countryregioncode as fk_pais
            ,stateprovincecode as sigla_estado
            ,name as estado
            ,cast(isonlystateprovinceflag as boolean) as flag_provincia_estado
        from {{ source('erp_adventure_works', 'stateprovince') }}
    )

select *
from estados
