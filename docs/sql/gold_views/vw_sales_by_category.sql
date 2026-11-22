CREATE OR REPLACE VIEW retail_lakehouse_dr.gold.vw_sales_by_category AS
SELECT
    source,
    category,
    COUNT(DISTINCT cart_key) AS distinct_carts,
    COUNT(*) AS item_rows,
    SUM(quantity) AS units_sold,
    ROUND(SUM(gross_amount), 2) AS gross_sales,
    ROUND(SUM(net_amount), 2) AS net_sales,
    ROUND(SUM(discount_amount), 2) AS discount_amount,
    ROUND(
        100.0 * SUM(discount_amount)
        / NULLIF(SUM(gross_amount), 0),
        2
    ) AS discount_rate_pct
FROM retail_lakehouse_dr.gold.vw_sales_enriched
GROUP BY
    source,
    category;
