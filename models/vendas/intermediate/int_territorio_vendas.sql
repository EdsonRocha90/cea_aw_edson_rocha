with 
    territorio_vendas as (
        select * 
        from {{ ref('stg_sap__territorio_vendas') }}
    ),

    int_territorio_vendas as (
        pk_territorio
        ,fk_pais
        ,territorio
        ,grupo_territorio
    )

select * 
from int_territorio_vendas
