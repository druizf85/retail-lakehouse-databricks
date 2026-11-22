CREATE OR REPLACE TABLE retail_lakehouse_dr.gold.fact_cart_items
USING DELTA
AS

WITH ranked_carts AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY source, source_record_id
            ORDER BY extracted_at DESC, run_id DESC
        ) AS rn
    FROM retail_lakehouse_dr.silver.carts
),

selected_carts AS (
    SELECT *
    FROM ranked_carts
    WHERE rn = 1
),

ranked_cart_items AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY
                source,
                cart_source_record_id,
                run_id,
                item_index
            ORDER BY extracted_at DESC
        ) AS rn
    FROM retail_lakehouse_dr.silver.cart_items
),

selected_items AS (
    SELECT *
    FROM ranked_cart_items
    WHERE rn = 1
)

SELECT
    ci.cart_key,
    c.cart_id,
    ci.customer_id,
    ci.product_id,
    ci.item_index,
    ci.product_name,
    ci.price,
    ci.quantity,
    ci.total AS gross_amount,
    ci.discount_percentage,
    ci.discounted_total AS net_amount,
    ci.source,
    ci.cart_source_record_id,
    ci.run_id AS item_run_id,
    ci.extracted_at AS item_extracted_at,
    c.run_id AS cart_run_id,
    c.extracted_at AS cart_extracted_at

FROM selected_items ci

INNER JOIN selected_carts c
    ON  ci.source = c.source
    AND ci.cart_source_record_id = c.source_record_id
    AND ci.cart_key = c.cart_key
    AND ci.run_id = c.run_id;