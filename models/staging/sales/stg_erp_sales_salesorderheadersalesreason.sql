with
    font_salesorderheadersalesreason as (
        select
        *
        from {{source("erp_sales", "salesorderheadersalesreason")}}
    )
 
    , renomeado_salesorderheadersalesreason as (
        select
            cast(salesorderid as int) as pk_fk_ordem_venda,
            cast(salesreasonid as int) as pk_fk_razao_venda,
            cast(modifieddate as timestamp) as data_modificacao
        from font_salesorderheadersalesreason
    )
 
select * from renomeado_salesorderheadersalesreason