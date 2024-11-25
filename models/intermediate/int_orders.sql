WITH order_item_grouped_by_order AS(
    SELECT order_id,
            sum(discount_amount) AS total_order_discount,
            sum(total_order_item_price) AS total_order_amount,
            sum(quantity) AS total_items,
            count(distinct(product_id)) AS total_distinct_items,
FROM {{ref('stg_order_items')}}
GROUP BY order_id
)


SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.store_id,
    s.store_name,
    o.staff_id,
    c.customer_city,
    c.customer_state,
    coalesce(oi.total_order_amount,0) AS total_order_amount,
    coalesce(oi.total_order_discount,0) AS total_order_discount,
    coalesce(oi.total_items,0) AS total_items,
    coalesce(oi.total_distinct_items,0) AS total_distinct_items
FROM {{ref('stg_orders')}} AS o
left join {{ref('stg_customers')}} AS c ON o.customer_id = c.customer_id
left join order_item_grouped_by_order AS oi ON o.order_id= oi.order_id
left join {{ref('stg_stores')}} AS s ON o.store_id = s.store_id

