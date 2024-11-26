{% test is_positive(model, grouping_id, column_name) %}
    select 
    1 as id, 
    sum({{ column_name }}) as column_name_sum
    from {{model}}
    group by id
    having column_name_sum < 0
{% endtest %}
