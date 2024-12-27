with
    int_territorio_vendas as (
        select *
        from {{ ref('int_territorio_vendas') }}
    ),

    dim_territorio_vendas as (
        select 
            pk_territorio
            ,fk_pais
            ,territorio
            ,grupo_territorio
        from int_territorio_vendas
    )

select * 
from dim_territorio_vendas
