with
    int_de_para_datas as (
        select *
        from {{ ref('int_de_para_datas') }}
    ),

    dim_datas as (
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
        from int_de_para_datas
    )

select * 
from dim_datas
