SELECT product_name,
       sum(total_product_sold) as total_product_sold,
       sum(total_sales_amount) as total_sales_amount,
       avg(average_discount_on_product) as average_discount_on_product
FROM {{ref("int_products")}}
GROUP BY product_name
ORDER BY total_sales_amount DESC
LIMIT 100 