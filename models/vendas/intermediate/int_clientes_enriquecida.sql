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
            ,pes.primeiro_nome as prim_nome_cliente
            ,pes.ultimo_sobrenome as ult_sobrenome_cliente
            ,pes.nome_completo as nome_cliente
            ,loj.nome_loja as loja_cliente
            ,ter.territorio as territorio_cliente
            ,ter.grupo_territorio as grupo_territorio_cliente
            ,ter.fk_pais as pais_territorio_cliente
            ,pes.flag_email_promocao as flag_email_promocao_cliente
            ,pes.flag_nome_estilizado as flag_nome_estilizado_cliente
        from clientes cli
        left join pessoas pes on cli.fk_pessoa = pes.pk_pessoa
        left join territorio_vendas ter on cli.fk_territorio = ter.pk_territorio 
        left join lojas loj on cli.fk_loja = loj.pk_loja
    )

select * 
from clientes_enriquecida
