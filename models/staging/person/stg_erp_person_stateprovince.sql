with
    source_stateprovince as (
        select
        *
        from {{source("erp_person", "stateprovince")}}
    ), 
    rename_stateprovince as (
        select
            cast(stateprovinceid as int) as pk_state
            ,cast(stateprovincecode as string) as state_code
            ,cast(countryregioncode as string) as fk_country_code
            ,cast(isonlystateprovinceflag as boolean) as flag_unique_state_province
            ,cast(name as string) as province_name
            ,cast(territoryid as int) as fk_territory
            ,cast(rowguid as string) as row_id
            ,cast(modifieddate as date) as modified_date
        from source_stateprovince
    )
 
select * from rename_stateprovince