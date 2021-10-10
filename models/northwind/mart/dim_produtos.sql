{{ config(materialized='table') }}

select * from {{ ref('staging_dim_produtos') }} order by product_name