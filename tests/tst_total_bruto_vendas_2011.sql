/*
Teste para garantir que o valor total bruto 
das vendas de 2011 está correto, conforme o valor informado
pelo CEO Carlos Silveira (R$ 12.646.112,16).
*/

with 
    vendas_2011 as (
        select 
            round(sum(valor_negociado), 2) as total_bruto
        from {{ ref('int_vendas_metricas') }}
        where data_pedido between '2011-01-01' and '2011-12-31'
    )

select 
    total_bruto
from vendas_2011 
-- Teste para verificar se a soma total está entre 99,9999% e 100,0001% do valor informado pelo CEO
where total_bruto not between round(12646112.16 * 0.999999, 2) and round(12646112.16 * 1.000001, 2)
