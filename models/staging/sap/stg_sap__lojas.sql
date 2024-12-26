with
    lojas as (
        select 
            businessentityid as pk_loja
            ,name as nome_loja
        from {{ source('erp_adventure_works', 'store') }}
    )

select *
from lojas
