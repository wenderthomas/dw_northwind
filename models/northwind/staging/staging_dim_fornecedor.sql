with source_data as (
    select
        supplier_id
        , company_name
        , city
        , region
        , country
    from {{ source('dw_northwind', 'public_suppliers') }}
)

select * from source_data