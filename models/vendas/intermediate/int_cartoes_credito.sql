with 
    cartoes_credito as (
        select * 
        from {{ ref('stg_sap__cartoes_credito') }}
    ),

    int_cartoes_credito as (
        select 
            pk_cartao_credito
            ,tipo_cartao 
        from cartoes_credito
    )

select 
    * 
from int_cartoes_credito
