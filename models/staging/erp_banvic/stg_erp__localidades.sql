with
    fonte_localidade as(
        select *
        from {{ source('erp', 'localidades') }}
    )

, renomeado as(
    select
        cod_localidade as pk_localidade
        , cast(cidade as string) as cidade
        , cast(uf as string) as uf
    from fonte_localidade
)

select *
from renomeado