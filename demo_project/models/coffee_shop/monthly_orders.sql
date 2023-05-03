
{{ config(
    materialized='view'
 ) }}

with monthly_orders as (
    select 
    date_trunc(first_order_at, month) as signup_month, 
    date_trunc(first_order_at, year) as signup_year, 
    sum(n_orders) as n_orders

    from {{  ref('customer_orders')  }}

    group by 1,2
)

select * from monthly_orders