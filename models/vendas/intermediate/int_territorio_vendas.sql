with 
    territorio_vendas as (
        select * 
        from {{ ref('stg_sap__territorio_vendas') }}
    ),

    int_territorio_vendas as (
        select 
            pk_territorio
            ,fk_pais
            ,territorio
            ,grupo_territorio
        from territorio_vendas
    )

select * 
from int_territorio_vendas
