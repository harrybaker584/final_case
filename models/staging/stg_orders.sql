SELECT order_id,
       customer_id,
       order_status,
       order_date,
       required_date,
       COALESCE(shipped_date,'Unknown') as shipped_date,
       store_id,
       staff_id
FROM {{source('local_bike','orders')}}