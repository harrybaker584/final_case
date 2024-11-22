SELECT order_id,
       customer_id,
       order_status,
       order_date,
       required_date,
       CAST(shipped_date,null AS DATE) AS shipped_date,
       store_id,
       staff_id

FROM {{source('local_bike','orders')}}
ORDER BY order_id DESC