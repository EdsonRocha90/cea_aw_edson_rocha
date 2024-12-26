with 
    produtos as (
        select * 
        from {{ ref('stg_sap__produtos') }}
    )

select * 
from produtos
