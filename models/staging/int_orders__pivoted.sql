{%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'coupon'] -%}

with payments as (
      SELECT * FROM {{ref('stg_payment')}}
),

  final as (

        SELECT
            order_id,

            

            {%- for payment_method in payment_methods -%}

             sum(case when payment_method = '{{payment_method}}' then amount else 0 end) as {{payment_method}}_amount


            {%- if not loop.last -%}
                 ,
            {% endif -%}

            {%- endfor %}
        
            from payments

            group by 1

  ) select *from final


