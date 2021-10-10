with source_data as (
    select
        public_order_details.order_id	
        , product_id
        , unit_price
        , quantity
        , discount	
    from {{ source('dw_northwind', 'public_order_details') }}
)
, orders as (
    select
        public_orders.order_id as id
        , customer_id
        , employee_id
        , order_date
        , ship_via as shipper_id
    from {{ source('dw_northwind', 'public_orders')}}
)
, products_suppliers as (
    select
        public_products.product_id as p_id
        , supplier_id
    from {{ source('dw_northwind', 'public_products')}}
)
, vendas as (
    select 
        * 
    from source_data
    left join orders on source_data.order_id = orders.id
)

select
    row_number () over (order by order_date) as row_sk
    , order_id
    , product_id
    , unit_price
    , quantity
    , discount
    , customer_id
    , employee_id
    , order_date
    , supplier_id
    , shipper_id
from vendas
left join products_suppliers on vendas.product_id = products_suppliers.p_id