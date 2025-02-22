with
    dim_endereco as (
        select * from {{ref("int_erp_person_prep_endereco")}}
    )

select * from dim_endereco   