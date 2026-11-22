CREATE OR REPLACE VIEW retail_lakehouse_dr.gold.vw_sales_enriched AS
SELECT
    f.cart_key,
    f.cart_id,
    f.customer_id,
    f.product_id,
    f.item_index,
    f.product_name,
    p.category,
    p.brand,
    p.sku,
    f.price AS sale_price,
    p.price AS current_product_price,
    f.quantity,
    f.gross_amount,
    f.discount_percentage AS sale_discount_percentage,
    f.net_amount,
    f.gross_amount - f.net_amount AS discount_amount,
    p.rating AS current_product_rating,
    p.stock AS current_stock,
    p.availability_status AS current_availability_status,
    f.source,
    f.cart_source_record_id,
    f.item_run_id,
    f.item_extracted_at,
    f.cart_run_id,
    f.cart_extracted_at,
    p.product_extracted_at
FROM retail_lakehouse_dr.gold.fact_cart_items f
LEFT JOIN retail_lakehouse_dr.gold.vw_dim_products p
    ON f.product_id = p.product_id;
