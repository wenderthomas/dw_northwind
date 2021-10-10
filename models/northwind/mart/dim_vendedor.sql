{{ config(materialized='table') }}

select * from {{ ref('staging_dim_vendedor') }} order by full_name