SELECT product_id,
       product_name,
       brand_id,
       category_id,
       model_year,
       CAST(list_price AS numeric) as list_price
FROM {{source('local_bike','products')}}
