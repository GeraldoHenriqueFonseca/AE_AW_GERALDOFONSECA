with
    solicitacao_venda as (
        select * from {{ref("stg_erp_sales_salesorderheader")}}
    ),
    detalhe_solicitacao_venda as (
        select * from {{ref("stg_erp_sales_salesorderdetail")}}
    ),
    solicitacao_venda_incrementado as (
        select
            ROW_NUMBER() OVER (ORDER BY solicitacao_venda.pk_ordem_venda, detalhe_solicitacao_venda.fk_detalhe_pedido_venda) AS seq_int_vendas, 
            solicitacao_venda.pk_ordem_venda,
            solicitacao_venda.numero_revisao,
            solicitacao_venda.data_compra,
            solicitacao_venda.data_vencimento,
            solicitacao_venda.data_envio,
            solicitacao_venda.status,
            solicitacao_venda.ind_ordem_online,
            solicitacao_venda.numero_ordem_compra,
            solicitacao_venda.numero_conta,
            solicitacao_venda.fk_cliente,
            solicitacao_venda.fk_vendedor,
            solicitacao_venda.fk_territorio,
            solicitacao_venda.fk_endereco_cobranca,
            solicitacao_venda.fk_endereco_envio,
            solicitacao_venda.fk_metodo_envio,
            solicitacao_venda.fk_cartao_credito,
            solicitacao_venda.codigo_aprovacao_cartao_credito,
            solicitacao_venda.fk_taxa_cambio,
            solicitacao_venda.subtotal,
            solicitacao_venda.taxamt,
            solicitacao_venda.frete,
            solicitacao_venda.total_devido,
            solicitacao_venda.comentario,
            solicitacao_venda.data_modificacao data_modificacao_ordem_venda,
            detalhe_solicitacao_venda.fk_detalhe_pedido_venda,
            detalhe_solicitacao_venda.numero_rastreamento,
            detalhe_solicitacao_venda.quantidade_pedido,
            detalhe_solicitacao_venda.fk_produto,
            detalhe_solicitacao_venda.fk_oferta_especial,
            detalhe_solicitacao_venda.preco_unitario,
            detalhe_solicitacao_venda.desconto_preco_unitario,
            detalhe_solicitacao_venda.data_modificacao data_modificacao_detalhe_ordem_venda,
        from solicitacao_venda
        left join detalhe_solicitacao_venda
        on solicitacao_venda.pk_ordem_venda = detalhe_solicitacao_venda.pk_pedido_venda
    )


select * from solicitacao_venda_incrementado