CREATE OR REPLACE VIEW retail_lakehouse_dr.gold.vw_sales_by_source AS
SELECT
    source,
    COUNT(DISTINCT cart_key) AS distinct_carts,
    COUNT(*) AS item_rows,
    SUM(quantity) AS units_sold,
    ROUND(SUM(gross_amount), 2) AS gross_sales,
    ROUND(SUM(net_amount), 2) AS net_sales,
    ROUND(SUM(gross_amount - net_amount), 2) AS discount_amount,
    ROUND(
        SUM(net_amount) / NULLIF(COUNT(DISTINCT cart_key), 0),
        2
    ) AS avg_net_amount_per_cart
FROM retail_lakehouse_dr.gold.fact_cart_items
GROUP BY source;