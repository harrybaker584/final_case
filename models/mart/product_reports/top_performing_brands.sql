SELECT 
       brand_name,
       sum(total_product_sold) as total_products_sold,
       sum( total_sales_amount )as total_brand_sales_amount,
       avg(product_list_price) as average_brand_list_price,
       avg(average_discount_on_product) as avg_brand_discount
FROM {{ref("int_products")}}  
GROUP BY brand_name
ORDER BY total_brand_sales_amount DESC
