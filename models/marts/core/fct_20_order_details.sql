with orders as  (
    select * from {{ ref('stg_orders' )}}
),

top_20_orders as (
    select * from {{ref('top_20_order')}}
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    right join order_payments using (order_id)
)

select * from final