with
    pessoas as (
        select 
            cast(businessentityid as int) as pk_pessoa
            ,firstname as primeiro_nome
            ,lastname as ultimo_sobrenome
            ,firstname || ' ' || lastname as nome_completo
            ,emailpromotion as flag_email_promocao
            ,cast(namestyle as boolean) as flag_nome_estilizado
        from {{ source('erp_adventure_works', 'person') }}
    )

select *
from pessoas
