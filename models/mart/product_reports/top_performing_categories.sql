SELECT category_name,
       sum(total_product_sold) as total_products_sold,
       sum( total_sales_amount )as total_category_sales_amount,
       avg(product_list_price) as average_category_list_price,
       avg(average_discount_on_product) as average_category_discount
FROM {{ref("int_products")}}  
GROUP BY category_name
ORDER BY total_category_sales_amount DESC
