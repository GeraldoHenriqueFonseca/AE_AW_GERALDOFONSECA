with
source as (
    select * from {{ source('erp_person', 'address') }}
)
, renamed as (
    select
        addressid 
        , stateprovinceid
        , addressline1 as addressline
        , city
        , postalcode
        , spatiallocation
    from source
)
select * from renamed
