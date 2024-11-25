SELECT 
    DATE_TRUNC(order_date,DAY) as report_date,
    store_name,
    count(distinct order_id) AS total_number_of_orders,
    AVG(total_distinct_items) AS avg_distinct_products_ordered,
    AVG(total_items) AS avg_number_of_products_purchased,
    AVG(total_order_discount) AS avg_order_discount,
    AVG(total_order_amount) as avg_order_amount
FROM {{ref("int_orders")}}
GROUP BY report_date, store_name
ORDER BY store_name, report_date ASC
   

