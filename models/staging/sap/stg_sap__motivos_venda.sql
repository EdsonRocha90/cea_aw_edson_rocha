with
    motivos_venda as (
        select 
            cast(salesreasonid as int) as pk_motivo_venda
            ,name as descr_motivo_venda
            ,reasontype as tipo_motivo
        from {{ source('erp_adventure_works', 'salesreason') }}
    )

select *
from motivos_venda
