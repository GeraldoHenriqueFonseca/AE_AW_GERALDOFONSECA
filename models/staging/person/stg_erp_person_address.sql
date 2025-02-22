with
    fonte_address as (
        select
        *
        from {{source("erp_person", "address")}}
    ),
     rename_address as (
        select
            cast(addressid as int) as pk_address
            ,cast(addressline1 as string) as address_line
            ,cast(addressline2 as string) as adress_complement
            ,cast(city as string) as city
            ,cast(stateprovinceid as int) as fk_state_province
            ,cast(postalcode as string) as postal_code
            ,cast(spatiallocation as string) as geolocation
            ,cast(rowguid as string) as row_id
            ,cast(modifieddate as date) as modified_date
        from fonte_address
    )
 
select * from rename_address