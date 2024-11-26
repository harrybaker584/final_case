{% docs int_orders %}

This model provides aggregated order data as a view, it combines date from multiple sources such as
orders, order_items, customers and stores to provide insights. The following metrics enhance the data:

- ** TOTAL ORDER AMOUNT:** The sum of all order items within an order
- ** TOTAL ORDER DISCOUNT: ** The total discount on an order
- ** TOTAL ITEMS:** The total number of items within an order
- ** TOTAL DISTINCT ITEMS: ** The total number of individual items in an order
- ** GENERAL USER DATA:** Data involving "users" of an order, the staff member involved and the customer

This provides a total view of every order, allowing for analysis of item performance, staff performance
and customer/regional data.

{% enddocs %}