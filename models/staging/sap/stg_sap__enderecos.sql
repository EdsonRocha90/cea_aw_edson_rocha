with
    enderecos as (
        select 
            cast(addressid as int) as pk_endereco
            ,cast(stateprovinceid as int) as fk_estado
            ,addressline1 as endereco
            ,addressline2 as complemento
            ,city as cidade   
            ,postalcode as cep
        from {{ source('erp_adventure_works', 'address') }}
    )

select *
from enderecos
