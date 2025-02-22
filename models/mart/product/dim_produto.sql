with
    dim_produto as (
        select * from {{ref("int_erp_product__prep_produto")}}
    )

select * from dim_produto    