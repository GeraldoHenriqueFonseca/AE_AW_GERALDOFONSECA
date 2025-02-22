with
    font_personcreditcard as (
        select
        *
        from {{source("erp_sales", "personcreditcard")}}
    )
 
    , renomeado_personcreditcard as (
        select
            cast(businessentityid as int) as pk_entidade_negocio,
            cast(creditcardid as int) as fk_cartao_credito,
            cast(modifieddate as timestamp) as data_modificacao
        from font_personcreditcard
    )
 
select * from renomeado_personcreditcard