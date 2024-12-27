with
    int_enderecos_enriquecida as (
        select *
        from {{ ref('int_enderecos_enriquecida') }}
    ),

    dim_enderecos as (
        select 
            pk_endereco
            ,fk_estado
            ,endereco
            ,complemento
            ,cidade
            ,cep
            ,estado
            ,sigla_estado
            ,pais
            ,sigla_pais
            ,territorio
            ,grupo_territorio
        from int_enderecos_enriquecida
    )

select * 
from dim_enderecos
