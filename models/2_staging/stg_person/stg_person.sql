with 
    person as (
        select 
            businessentityid
            , persontype
            , cast(firstname as string) as firstname
            , cast(middlename as string) as middlename
            , cast(lastname as string) as lastname
            , CONCAT(firstname, ' ', lastname) AS fullname
            , modifieddate
    from {{ source('stg_person', 'person') }}
    )

select *
from person