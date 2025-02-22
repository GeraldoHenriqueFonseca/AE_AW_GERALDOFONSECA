with
    source_person as (
        select
        *
        from {{source("erp_person", "person")}}
    ),
     rename_person as (
        select
            cast(businessentityid as int) as pk_fk_business_entity
            ,cast(persontype as string) as person_type
            ,cast(namestyle as boolean) as name_style
            ,cast(title as string) as title
            ,cast(firstname as string)
            ,cast(middlename as string)
            ,cast(lastname as string)
            ,cast(suffix as string)
            ,cast(emailpromotion as int) as email_promo
            ,cast(additionalcontactinfo as string) as contact_info
            ,cast(demographics as string)
            ,cast(rowguid as string) as row_id
            ,cast(modifieddate as date) as modified_date
        from source_person
    )
 
select * from rename_person