with
    dim_solicitacao_venda as (
        select * from {{ref("int_erp_sales_prep_vendas")}}
    )

select * from dim_solicitacao_venda    