with source_data as(
    select
        employee_id
        , city
        , region
        , country
        , reports_to
        , concat (first_name, ' ', last_name) as full_name
    from {{ source('dw_northwind', 'public_employees') }}
)

select * from source_data