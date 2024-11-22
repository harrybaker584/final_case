select
    concat(order_id, '_', item_id) as order_item_id,
    order_id,
    item_id,
    product_id,
    quantity,
    cast(list_price as decimal) as list_price,
    (discount * 100) as percentage_discount,
    cast((list_price * discount) as decimal) as discount_amount,
    cast(
        {{ order_item_price_after_discount("list_price", "discount", "quantity") }}
        as decimal
    ) as total_order_item_price
from {{ source("local_bike", "order_items") }}
