/*
    Teste que valida se a vendas brutas no ano de 2011, 
    correspondem ao valor de 12.646.112,16; 
    conforme solicitação do CEO Carlos Silveira
*/

with 
    filtered_sales_header as (
        select 
            salesorderid
            , orderdate
        from 
            {{ ref('fact_sales_header') }}
        where 
            extract(year from orderdate) = 2011
    )

    , sales_2011 as (
        select 
            sd.salesorderid
            , sd.orderqty * sd.unitprice as gross_sales
        from 
            {{ ref('fact_sales_detail') }} sd
        join 
            filtered_sales_header sh
        on 
            sd.salesorderid = sh.salesorderid
    )

    , gross_sales_check as (
        select 
            round(sum(gross_sales), 2) as actual_gross_sales_2011
        from 
            sales_2011
    )

select *
from gross_sales_check
where actual_gross_sales_2011 != 12646112.16