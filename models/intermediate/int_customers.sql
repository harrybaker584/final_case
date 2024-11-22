with orders_summary as(
    SELECT o.customer_id,
        sum(oi.total_order_item_price) As total_amount_spent,
        sum(oi.quantity) AS total_products,
        count(distinct(oi.product_id)) AS total_distinct_products,
        count(distinct(o.order_id)) AS total_orders
FROM {{ref('stg_orders')}} AS o
INNER JOIN {{ref('stg_order_items')}} AS oi on o.order_id = oi.order_id
GROUP BY o.customer_id
),

product_summary AS(
SELECT 
    o.customer_id,
    oi.product_id,
ROW_NUMBER() OVER(
partition by o.customer_id
ORDER BY SUM(quantity) desc
    ) as rn
FROM {{ref('stg_order_items')}} as oi
INNER JOIN {{ref('stg_orders')}} as o on oi.order_id = o.order_id
GROUP BY o.customer_id,oi.product_id
     
)

SELECT c.customer_id,
       c.customer_city,
       c.customer_state,
       o.total_amount_spent,
       o.total_products,
       o.total_distinct_products,
       o.total_orders,
       p.product_id AS favourite_product_id
FROM {{ref('stg_customers')}} as c
INNER JOIN orders_summary as o on c.customer_id = o.customer_id
LEFT JOIN product_summary as p on o.customer_id = p.customer_id AND p.rn=1