with 
    clientes as (
        select * 
        from {{ ref('stg_sap__clientes') }}
    ),

    pessoas as (
        select * 
        from {{ ref('stg_sap__pessoas') }}
    ),

    clientes_enriquecida as (
        select 
            cli.pk_cliente
            ,cli.fk_pessoa
            ,cli.fk_loja
            ,cli.fk_territorio
            ,pes.primeiro_nome
            ,pes.ultimo_sobrenome
            ,pes.nome_completo
            ,pes.flag_email_promocao
            ,pes.flag_nome_estilizado
        from clientes cli
        left join pessoas pes on cli.pk_cliente = pes.pk_pessoa
    )

select * 
from clientes_enriquecida
