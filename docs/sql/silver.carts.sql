CREATE TABLE IF NOT EXISTS retail_lakehouse_dr.silver.carts (
    cart_id INT,
    customer_id INT,
    total DECIMAL(14,2),
    discounted_total DECIMAL(14,2),
    total_products INT,
    total_quantity INT,
    products_json STRING,
    source STRING,
    source_record_id STRING,
    run_id STRING,
    extracted_at TIMESTAMP,
    cart_key STRING
)
USING DELTA;