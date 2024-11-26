{{ config(
    tags=["quarterly"]
) }}



SELECT
    DATE_TRUNC(report_date, quarter) as report_date,
    sum(total_number_of_orders) as total_number_of_orders,
    avg(avg_distinct_products_ordered) as avg_distinct_products_ordered,
    avg(avg_number_of_products_purchased) as avg_number_of_products_purchased,
    avg(avg_order_discount) as avg_order_discount,
    avg(avg_order_amount) as avg_order_amount
FROM {{ref("monthly_order_report")}}
GROUP BY report_date
ORDER BY report_date