with
    int_cartoes_credito as (
        select *
        from {{ ref('int_cartoes_credito') }}
    ),

    dim_cartoes_credito as (
        select 
            pk_cartao_credito
            ,tipo_cartao
        from int_cartoes_credito
    )

select * 
from dim_cartoes_credito
