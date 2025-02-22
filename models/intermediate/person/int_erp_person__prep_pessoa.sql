with
    pessoa as (
        select * from {{ref("stg_erp_person_person")}}
    )
select * from pessoa