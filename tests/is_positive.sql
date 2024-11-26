{% test is_positive(model, grouping_id, column_name) %}
    select {{ grouping_id }}, 
    sum({{ column_name }}) as column_name_sum
    from {{ ref("model") }}
    group by grouping_id
    having column_name_sum < 0
{% endtest %}
