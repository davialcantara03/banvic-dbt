with 
    fonte_agencia as (
        select *
        from {{ source("erp", 'agencias') }}
    )

, renomeado as (
    select
        cast(cod_agencia as int) as pk_agencia
        , cast(cod_localidade as int) as fk_localidade
        , nome as nome_agencia
        , endereco as endereco_agencia
        , tipo_agencia as tipo_agencia
        , cast(data_abertura as date) as data_abertura_agencia
)

select * 
from renomeado