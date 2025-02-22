with
    source_countryregion as (
        select
        *
        from {{source("erp_person", "countryregion")}}
    ),
    rename_countryregion as (
        select
            cast(countryregioncode as string) as pk_country_code
            ,cast(name as string) as country_name
            ,cast(modifieddate as date) as modified_date
        from source_countryregion
    )
 
select * from renomeado_countryregion