with
    estados as (
        select 
            stateprovincecode as pk_estado
            ,countryregioncode as fk_pais
            ,name as estado
            ,cast(territoryid as int) fk_territorio
            ,cast(isonlystateprovinceflag as boolean) as flag_provincia_estado
        from {{ source('erp_adventure_works', 'stateprovince') }}
    )

select *
from estados
