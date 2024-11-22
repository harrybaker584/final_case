 WITH sales_by_product AS
 (SELECT product_id,
           sum(quantity) AS total_product_sold,
           sum(total_order_item_price) AS total_amount,
           avg(percentage_discount) AS average_discount
FROM {{ref("stg_order_items")}}
GROUP BY product_id
)

SELECT p.product_id,
       p.product_name,
       p.brand_id,
       b.brand_name,
       c.category_id,
       c.category_name,
       coalesce(sp.total_product_sold,0) AS total_product_sold,
       coalesce(sp.total_amount,0) AS total_sales_amount,
       coalesce(sp.average_discount,0) AS average_discount_on_product,
FROM {{ref('stg_products')}} AS p
left join sales_by_product AS sp on p.product_id = sp.product_id
left join {{ref('stg_brands')}} AS b on p.brand_id = b.brand_id
left join {{ref("stg_categories")}} AS c on p.category_id = c.category_id

       
