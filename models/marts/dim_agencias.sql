with
    stg_agencias as (
        select *
        from {{ ref('stg_erp__agencias') }}
    )

    , stg_localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    )

    , dim_agencias_enriquecida as (
        select
            agencias.pk_agencia
            , agencias.fk_localidade
            , agencias.nome_agencia
            , agencias.endereco_agencia
            , agencias.tipo_agencia
            , agencias.data_abertura_agencia
            , localidades.cidade as city_agencia
            , localidades.uf as uf_agencia
        from stg_agencias as agencias
        left join stg_localidades as localidades 
            on agencias.fk_localidade = cast(localidades.pk_localidade as int)
    )

select *
from dim_agencias_enriquecida
