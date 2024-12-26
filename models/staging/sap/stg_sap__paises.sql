with
    paises as (
        select 
            countryregioncode as pk_pais
            ,name as pais
        from {{ source('erp_adventure_works', 'countryregion') }}
    )

select *
from paises
