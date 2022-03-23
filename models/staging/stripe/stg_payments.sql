with payments as (
    select 
      id as payment_id,
      order_id,
      amount
from raw.stripe.payment
where status='success'
)
select * from payments