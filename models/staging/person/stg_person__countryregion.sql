with
source as (
    select * from {{ source('erp_person', 'countryregion') }}
)
, renamed as (
    select
        countryregioncode
        , name as country
    from source
)
select * from renamed