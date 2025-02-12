{{ config(
    materialized='table'
) }}

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_amount) AS total_amount_spent
FROM {{ source('ecommerce', 'orders') }}
GROUP BY customer_id
