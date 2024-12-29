with
    int_clientes_enriquecida as (
        select *
        from {{ ref('int_clientes_enriquecida') }}
    ),

    dim_clientes as (
        select 
            pk_cliente
            ,prim_nome_cliente
            ,ult_sobrenome_cliente
            ,nome_cliente
            ,loja_cliente
            ,territorio_cliente
            ,grupo_territorio_cliente
            ,pais_territorio_cliente
            ,flag_email_promocao_cliente
            ,flag_nome_estilizado_cliente
        from int_clientes_enriquecida
    )

select * 
from dim_clientes
