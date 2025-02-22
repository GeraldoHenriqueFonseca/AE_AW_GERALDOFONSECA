with
    produto as (
        select * from {{ref('stg_erp_product_product')}}
    )

select * from produto