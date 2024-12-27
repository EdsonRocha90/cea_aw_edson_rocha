with 
    motivos_venda as (
        select * 
        from {{ ref('stg_sap__motivos_venda') }}
    ),

    int_motivos_venda as (
        select
            pk_motivo_venda
            ,descr_motivo_venda
            ,tipo_motivo
        from motivos_venda
    )

select * 
from int_motivos_venda
