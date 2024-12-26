with
    funcionarios as (
        select 
            cast(businessentityid as int) as pk_funcionario
            ,cast(birthdate as date) as data_nascimento
            ,cast(hiredate as date) as data_contratacao
            ,jobtitle as cargo
            ,loginid as login_funcionario
            ,gender as genero
            ,maritalstatus as estado_civil
        from {{ source('erp_adventure_works', 'employee') }}
    )

select *
from funcionarios
