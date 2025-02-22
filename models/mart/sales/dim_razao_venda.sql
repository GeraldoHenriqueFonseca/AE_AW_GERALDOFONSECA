with
    dim_razao_venda as (
        select * from {{ref("int_erp_sales__prep_razao_vendas")}}
    )

select * from dim_razao_venda     