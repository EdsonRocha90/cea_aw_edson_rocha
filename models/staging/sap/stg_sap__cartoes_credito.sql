with
    cartoes_credito as (
        select 
            cast(creditcardid as int) as pk_cartao_credito
            ,cardtype as tipo_cartao
            ,cast(cardnumber as numeric(38,0)) as numero_cartao
            ,cast(expmonth as int) as mes_expiracao
            ,cast(expyear as int) as ano_expiracao
        from {{ source('erp_adventure_works', 'creditcard') }}
    )

select *
from cartoes_credito
