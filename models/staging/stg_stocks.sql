SELECT concat(store_id,'_',product_id) as store_product_id,
        store_id,
        product_id,
        quantity
FROM {{source('local_bike','stocks')}}
    