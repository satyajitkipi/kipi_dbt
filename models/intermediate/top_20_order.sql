select orderid, amount , DENSE_RANK() OVER (ORDER BY AMOUNT DESC ) AS rank 
FROM {{ ref('stg_payments') }}
WHERE status = 'success' and created_at  BETWEEN '2018-01-01' AND '2018-03-31' LIMIT 20;