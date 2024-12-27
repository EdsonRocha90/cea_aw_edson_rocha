with
    int_motivos_venda as (
        select *
        from {{ ref('int_motivos_venda') }}
    ),

    dim_motivos_venda as (
        select 
            pk_motivo_venda
            ,descr_motivo_venda
            ,tipo_motivo
        from int_motivos_venda
    )

select * 
from dim_motivos_venda
