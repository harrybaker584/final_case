{% macro total_order_item_amount(price_column, discount_column,quantity_column) %}
    ({{price_column}}*{{discount_column}})*{{quantity_column}}
{% endmacro %}
