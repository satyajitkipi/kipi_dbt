with payments as (
    select * from {{ ref('stg_payments') }}
),


select
order_id,
sum(case when status = 'success' then amount end) as amount
from payments
group by 1