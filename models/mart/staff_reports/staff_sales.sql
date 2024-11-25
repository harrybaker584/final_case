with orders_by_staff as(
    SELECT staff_id,
           sum(total_order_amount) as total_order_amount,
           avg(total_order_discount) as average_discount_given,
           sum(total_items) as total_items_sold,
           sum(total_distinct_items) as total_distinct_items_sold
    from {{ref('int_orders')}}
    group by staff_id
)

select os.staff_id,
       s.staff_name,
       s.store_id,
       coalesce(os.total_order_amount,0) as total_staff_sales,
       coalesce(os.average_discount_given) as average_discount_given,
       coalesce(os.total_items_sold) as total_items_sold,
       coalesce(os.total_distinct_items_sold) as total_distinct_items_sold
from orders_by_staff as os
left join {{ref('stg_staffs')}} as s on os.staff_id = s.staff_id
order by total_staff_sales DESC


