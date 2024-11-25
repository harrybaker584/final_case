SELECT customer_id,
       customer_name,
       customer_city,
       customer_state,
       sum(total_amount_spent) as total_amount_spent,
       sum(total_items_ordered) as total_items_ordered,
       sum(total_orders) as total_orders,
       favourite_product_id
FROM {{ref("int_customers")}}
GROUP BY customer_id, customer_name, customer_city, customer_state, favourite_product_id
ORDER BY total_amount_spent DESC