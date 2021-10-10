with source_data as (
    select
        product_id
        , product_name
        , quantity_per_unit
        , category_id
        , units_in_stock
        , units_on_order
        , discontinued
    from {{ source('dw_northwind', 'public_products') }}
)
, categories as (
    select
        category_id as cat_id
        , category_name
        , "description"
    from {{ source('dw_northwind', 'public_categories') }}
)

select 
    product_id
    , product_name
    , quantity_per_unit
    , category_name
    , "description" as category_description
    , units_in_stock
    , units_on_order
    , discontinued
from source_data
left join categories on source_data.category_id = categories.cat_id