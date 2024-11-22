SELECT customer_id,
       concat(first_name,' ',last_name) AS customer_name,
       phone AS customer_phone_number,
       email AS customer_email,
       street as customer_street,
       city as customer_city,
       state as customer_state,
       zip_code as customer_zip_code
FROM {{source('local_bike','customers')}}