CREATE OR REPLACE VIEW retail_lakehouse_dr.gold.vw_product_sales AS
SELECT
    source,
    product_id,
    product_name,
    COUNT(DISTINCT cart_key) AS distinct_carts,
    SUM(quantity) AS units_sold,
    ROUND(SUM(gross_amount), 2) AS gross_sales,
    ROUND(SUM(net_amount), 2) AS net_sales,
    ROUND(SUM(gross_amount - net_amount), 2) AS discount_amount
FROM retail_lakehouse_dr.gold.fact_cart_items
GROUP BY
    source,
    product_id,
    product_name;