{% set PAYMENTMETHOD = ["credit_card", "coupon", "bank_transfer", "gift_card"] %}
with payments as (select * from {{ ref("stg_payments") }})

select
 order_id,
{% for payment in PAYMENTMETHOD %}
    sum( case when paymentmethod = '{{payment}}' then amount else 0 end) as payment_method_{{payment}},
{% endfor %}
from payments
where status <> 'fail'
group by order_id

