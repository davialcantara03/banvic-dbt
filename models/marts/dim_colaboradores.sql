with
    int_colaboradores as(
        select *
        from {{ ref("int_dimensao_colaboradores") }}
    )
select *
from int_colaboradores