
  create view "postgres"."public"."revenue_by_region__dbt_tmp"
    
    
  as (
    WITH revenue_by_region AS (
  SELECT
    o.ship_region,
    COUNT(o.order_id) AS num_orders,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_sales
  FROM
    "postgres"."public"."orders" o
    LEFT JOIN "postgres"."public"."order_details" od ON o.order_id = od.order_id
  GROUP BY
    o.ship_region
)

SELECT *
FROM revenue_by_region
  );