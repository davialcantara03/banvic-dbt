with
    fonte_agencias as (
        select *
        from {{ source('erp', 'agencias') }}
    )

, renomeado as (
    select
        cast(COD_AGENCIA as int) as pk_agencia
        , cast(COD_LOCALIDADE as int) as fk_localidade
        , NOME as nome_agencia
        , ENDERECO as endereco_agencia
        , TIPO_AGENCIA as tipo_agencia
        , cast(DATA_ABERTURA as date) as data_abertura_agencia
    from fonte_agencias
)

select *
from renomeado