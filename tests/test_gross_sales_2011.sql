/*
    Teste que valida se a vendas brutas no ano de 2011, 
    correspondem ao valor de 12.646.112,16; 
    conforme solicitação do CEO Carlos Silveira
*/

with vendas_brutas_2011 as (
    select 
    sum(preco_unitario * quantidade_pedido) as soma_total_bruto 
    from {{ref("int_erp_sales_prep_vendas")}}
    where cast(data_compra as date) between '2011-01-01' and '2011-01-31'
)

select soma_total_bruto
from vendas_brutas_2011
where soma_total_bruto not between 12646111.00 and 12646113.00