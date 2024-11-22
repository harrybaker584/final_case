{% macro order_item_price_after_discount(price_column, discount_column,quantity_column) %}
   ({{price_column}}*(1-{{discount_column}}))*{{quantity_column}}
{% endmacro %}
