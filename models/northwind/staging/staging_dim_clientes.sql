with source_data as(
    select
        customer_id
        , company_name
        , city
        , region
        , country
    from {{ source('dw_northwind', 'public_customers') }}
)

select * from source_data order by company_name