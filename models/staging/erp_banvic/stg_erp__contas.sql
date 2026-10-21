with
source as (
    select * from {{ source('erp', 'contas') }}
),

renomeado as (
    select
        cast(NUM_CONTA as string) as pk_conta
        , cast(COD_CLIENTE as string) as fk_cliente
        , cast(COD_AGENCIA as string) as fk_agencia
        , cast(COD_COLABORADOR as string) as fk_colaborador
        , cast(NUM_CONTA as string) as numero_conta
        , TIPO_CONTA as tipo_conta
        , cast(DATA_ABERTURA as date) as data_abertura
        , cast(SALDO_TOTAL as decimal(18, 2)) as saldo_total
        , cast(SALDO_DISPONIVEL as decimal(18, 2)) as saldo_disponivel
        , cast(DATA_ULTIMO_LANCAMENTO as date) as data_ultimo_lancamento
    from source

)

select * from renomeado