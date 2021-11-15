with orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from raw.jaffle_shop.orders

) select * from orders

{{limit_data_in_dev('order_date', 2000)}}
