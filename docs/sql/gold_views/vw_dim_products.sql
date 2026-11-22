CREATE OR REPLACE VIEW retail_lakehouse_dr.gold.vw_dim_products AS

WITH ranked_products AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY product_id
            ORDER BY extracted_at DESC, run_id DESC
        ) AS rn
    FROM retail_lakehouse_dr.silver.products
)

SELECT
    product_id,
    product_name,
    category,
    brand,
    price,
    discount_percentage,
    rating,
    stock,
    sku,
    availability_status,
    minimum_order_quantity,
    extracted_at AS product_extracted_at
FROM ranked_products
WHERE rn = 1;
