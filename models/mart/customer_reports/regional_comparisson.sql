select
            customer_state,
            sum(total_amount_spent) as total_region_spending,
            avg(total_amount_spent) as average_regional_spending_per_customer,
            sum(total_items_ordered) as total_region_items_ordered,
            avg(total_items_ordered) as average_region_items_ordered_per_customer,
            sum(total_distinct_products) as total_region_distinct_products_ordered,
            avg(total_distinct_products) as average_region_distinct_products_ordered,
            sum(total_orders) as total_region_orders,
            count(favourite_product_id) as favourite_product_id,
        from {{ref('int_customers')}}
        group by customer_state



               

