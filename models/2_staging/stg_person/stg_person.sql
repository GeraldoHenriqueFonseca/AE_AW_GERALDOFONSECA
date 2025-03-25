with 
    person as (
        select 
            businessentityid
            , persontype
            , firstname
            , middlename
            , lastname
            , CONCAT(firstname, ' ', lastname) AS fullname
            , modifieddate
    from {{ source('stg_person', 'person') }}
    )

select *
from person