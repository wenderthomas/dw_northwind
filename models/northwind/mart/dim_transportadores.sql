{{ config(materialized='table') }}

select * from {{ ref('staging_transportadores') }} order by company_name