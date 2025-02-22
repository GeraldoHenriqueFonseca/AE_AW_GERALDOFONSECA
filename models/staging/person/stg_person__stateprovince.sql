with
source as (
    select * from {{ source('erp_person', 'stateprovince') }}
)
, renamed as (
    select
        stateprovinceid
        , territoryid
        , stateprovincecode
        , countryregioncode
        , isonlystateprovinceflag
        , name as name_province
    from source
)
select * from renamed