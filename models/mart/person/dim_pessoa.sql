with
    dim_pessoa as (
        select * from {{ref("int_erp_person__prep_pessoa")}}
    )

select * from dim_pessoa
