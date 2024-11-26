{{ config(
    tags=["daily"]
) }}
SELECT 
    DATE_TRUNC(order_date,DAY) as report_date,
    sum(distinct order_id) AS total_number_of_orders,
    sum(total_distinct_items) AS total_distinct_products_ordered,
    sum(total_items) AS total_number_of_products_purchased,
    avg(total_order_discount) AS avg_order_discount,
    sum(total_order_amount) as total_order_amount
FROM {{ref("int_orders")}}
GROUP BY report_date
ORDER BY report_date ASC
   

