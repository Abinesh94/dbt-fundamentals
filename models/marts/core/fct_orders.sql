with payments as(
    select * from {{ref('stg_payments')}}
)
,stg_orders as (
    select * from {{ref('stg_orders')}}
)
,order_payments as(
    select
        stg_orders.customer_id,
        stg_orders.order_id,
        stg_orders.order_date,
        payments.amount

    from stg_orders
    left join payments using (order_id)
)
select * from order_payments