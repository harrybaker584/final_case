SELECT customer_id,
       concat(first_name,' ',last_name) AS customer_name,
       cast(phone as varchar(15)) AS customer_phone_number,
       email AS customer_email,
       street,
       city,
       state,
       zip_code
FROM {{source('local_bike','customers')}}