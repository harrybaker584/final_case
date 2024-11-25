with orders_summary as(
    SELECT customer_id,
        sum(total_order_amount) AS total_amount_spent,
        sum(total_items) AS total_items_ordered,
        sum(distinct(total_distinct_items)) AS total_distinct_products,
        count(distinct(order_id)) AS total_orders
FROM {{ref('int_orders')}}
GROUP BY customer_id
),

product_summary AS(
SELECT 
    customer_id,
    oi.product_id,
ROW_NUMBER() OVER(
partition by customer_id
ORDER BY total_items desc
    ) as rn
FROM {{ref('int_orders')}} as io 
inner join {{ref('stg_order_items')}} as oi on io.order_id=oi.order_id   
)

SELECT io.customer_id,
       c.customer_name,
       io.customer_city,
       io.customer_state,
       o.total_amount_spent,
       o.total_items_ordered,
       o.total_distinct_products,
       o.total_orders,
       p.product_id AS favourite_product_id
FROM {{ref('int_orders')}} as io
INNER JOIN orders_summary as o on io.customer_id = o.customer_id
LEFT JOIN product_summary as p on o.customer_id = p.customer_id AND p.rn=1
LEFT JOIN {{ref('stg_customers')}} as c on o.customer_id=c.customer_id