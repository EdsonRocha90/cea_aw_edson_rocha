with 
    tab_de_para_datas as (
        select
            cast(ano_mes_dia as date) as ano_mes_dia
            ,cast(ano_mes as string) as ano_mes
            ,cast(mes as int) as mes
            ,cast(ano as int) as ano
            ,cast(trimestre as int) as trimestre
            ,cast(semana as int) as semana
            ,cast(semestre as int) as semestre
            ,cast(dia_mes_ano as string) as dia_mes_ano
            ,cast(chave_data as string) as chave_data
        from {{ ref( 'seed_de_para_datas' ) }}
    )

select * 
from tab_de_para_datas
