SELECT concat(order_id,'_',item_id) AS order_item_id,
        order_id,
        item_id,
        product_id,
        quantity,
        cast(list_price AS numeric) AS list_price,
        (discount*100) AS percentage_discount,
        {{order_item_price_after_discount('list_price','discount','quantity')}} AS total_order_item_price
FROM {{source('local_bike','order_items')}}
