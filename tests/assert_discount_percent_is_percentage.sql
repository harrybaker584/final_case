select
    order_item_id,
    sum(percentage_discount) as percentage_discount
from {{ref('stg_order_items')}}
group by order_item_id
having percentage_discount<0 and percentage_discount>=100
