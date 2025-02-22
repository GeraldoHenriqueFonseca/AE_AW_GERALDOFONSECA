with 
    razao_solicitacao_venda as (
        select * from {{ref("stg_erp_sales_salesorderheadersalesreason")}}
    ),
    razao_venda as (
        select * from {{ref("stg_erp_sales_salesreason")}}
    ),
    razao_solicitacao_venda_incrementado as (
        select
        ROW_NUMBER() OVER (ORDER BY razao_solicitacao_venda.pk_fk_ordem_venda, razao_solicitacao_venda.pk_fk_razao_venda) AS seq_int_razao_vendas, 
        razao_solicitacao_venda.pk_fk_ordem_venda as pk_ordem_venda,
        razao_solicitacao_venda.pk_fk_razao_venda,
        razao_venda.nome,
        razao_venda.tipo_razao,
        razao_venda.data_modificacao
        from razao_solicitacao_venda
        left join razao_venda
        on razao_solicitacao_venda.pk_fk_razao_venda = razao_venda.pk_razao_venda
    )

select * from razao_solicitacao_venda_incrementado    