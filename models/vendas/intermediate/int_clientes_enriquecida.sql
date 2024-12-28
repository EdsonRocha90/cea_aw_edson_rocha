with 
    clientes as (
        select * 
        from {{ ref('stg_sap__clientes') }}
    ),

    pessoas as (
        select * 
        from {{ ref('stg_sap__pessoas') }}
    ),

    territorio_vendas as (
        select * 
        from {{ ref('stg_sap__territorio_vendas') }}
    ),

    lojas as (
        select * 
        from {{ ref('stg_sap__lojas') }}
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
            ,loj.nome_loja
            ,ter.territorio
            ,ter.grupo_territorio
            ,pes.flag_email_promocao
            ,pes.flag_nome_estilizado
        from clientes cli
        left join pessoas pes on cli.fk_pessoa = pes.pk_pessoa
        left join territorio_vendas ter on cli.fk_territorio = ter.pk_territorio 
        left join lojas loj on cli.fk_loja = loj.pk_loja
    )

select * 
from clientes_enriquecida
