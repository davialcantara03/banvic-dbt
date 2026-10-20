with
    fonte_colaboradores as (
        select *
        from {{ source('erp', 'colaboradores') }}
    )

, renomeado as (
    select
        cast(COD_COLABORADOR as int) as pk_colaborador
        , cast(COD_LOCALIDADE as int) as fk_localidade
        , cast(COD_GERENTE as int) as fk_gerente
        , PRIMEIRO_NOME || ' ' || ULTIMO_NOME as nome_colaborador
        , EMAIL as email_colaborador
        , regexp_replace(CPF, '[^a-zA-Z0-9]', '') as cpf_colaborador
        , cast(DATA_NASCIMENTO as date) as data_nascimento_colaborador
        , ENDERECO as endereco_colaborador
        , regexp_replace(CEP, '[^a-zA-Z0-9]', '') as cep_colaborador
    from fonte_colaboradores
)

select *
from renomeado
