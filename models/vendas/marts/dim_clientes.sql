with
    int_clientes_enriquecida as (
        select *
        from {{ ref('int_clientes_enriquecida') }}
    ),

    dim_clientes as (
        select 
            pk_cliente
            ,fk_pessoa
            ,fk_loja
            ,fk_territorio
            ,primeiro_nome
            ,ultimo_sobrenome
            ,nome_completo
            ,territorio
            ,grupo_territorio
            ,nome_loja
            ,flag_email_promocao
            ,flag_nome_estilizado
        from int_clientes_enriquecida
    )

select * 
from dim_clientes
