select
        id as payment_id,
        orderid as order_id,
        {{upper_case('paymentmethod')}}  as payment_method,
        {{upper_case('status')}} as status,
        {{cents_to_dollars('amount', 4)}} as amount,
        created as created_at

    from {{source('stripe','payment')}}