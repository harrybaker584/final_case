{{ config(
    tags=["weekly"]
) }}
SELECT
    DATE_TRUNC(report_date, week) as report_date,
    sum(total_number_of_orders) as total_number_of_orders,
    avg(total_distinct_products_ordered) as avg_distinct_products_ordered,
    avg(total_number_of_products_purchased) as avg_number_of_products_purchased,
    avg(avg_order_discount) as avg_order_discount,
    avg(total_order_amount) as avg_order_amount
FROM {{ref("daily_order_report")}}
GROUP BY report_date
ORDER BY report_date