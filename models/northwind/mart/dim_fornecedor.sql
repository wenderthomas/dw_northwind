{{ config(materialized='table') }}

select * from {{ ref('staging_dim_fornecedor') }} order by company_name