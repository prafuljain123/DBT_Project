{{
    config(
        materialized = 'table'
    )
}}

select
  customer_id,
  name,
  email,
  order_id,
  order_date,
  order_amount,
  status,
  last_updated
from {{ source('Temp_database','customers_orders') }}