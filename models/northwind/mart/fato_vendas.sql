{{ config(materialized='table') }}

select * from {{ ref('staging_fato_vendas') }} order by order_date