SELECT staff_id,
       concat(first_name,' ', last_name) as staff_name,
       email as staff_email,
       phone as staff_phone_number,
       active,
       store_id,
       manager_id
FROM {{source('local_bike','staffs')}}
