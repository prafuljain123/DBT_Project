{{
    config(
        materialized = 'table'
    )
}}

with agg as (
    select
        customer_id,
        count(order_id) as total_orders,
        round(sum(order_amount),2) as total_revenue,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date
    from {{ ref('stg_customers_orders') }}
    group by customer_id
)

select
  customer_id,
  total_orders,
  total_revenue,
  {{ format_dat('first_order_date') }} as formatted_first_order_month,
  last_order_date
from agg