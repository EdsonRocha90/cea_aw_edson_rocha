with 
    tab_de_para_datas as (
        select * 
        from {{ ref('stg_seed__de_para_datas') }}
    ),

    int_de_para_datas as (
        select 
            ano_mes_dia
            ,mes_ano
            ,mes
            ,ano
            ,trimestre
            ,semana
            ,semestre
            ,dia_mes_ano
            ,chave_data 
        from tab_de_para_datas
    )

select 
    * 
from int_de_para_datas
