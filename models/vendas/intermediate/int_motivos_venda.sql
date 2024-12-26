with 
    motivos_venda as (
        select * 
        from {{ ref('stg_sap__motivos_venda') }}
    )

select * 
from motivos_venda
