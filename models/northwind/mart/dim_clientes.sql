{{ config(materialized='table') }}

select * from {{ ref('staging_dim_clientes') }} order by company_name