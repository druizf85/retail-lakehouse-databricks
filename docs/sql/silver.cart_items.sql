CREATE TABLE IF NOT EXISTS retail_lakehouse_dr.silver.cart_items (
    cart_id INT,
    cart_key STRING,
    customer_id INT,
    product_id INT,
    product_name STRING,
    price DECIMAL(12,2),
    quantity INT,
    total DECIMAL(14,2),
    discount_percentage DECIMAL(5,2),
    discounted_total DECIMAL(14,2),
    thumbnail STRING,
    item_index INT,
    source STRING,
    cart_source_record_id STRING,
    run_id STRING,
    extracted_at TIMESTAMP
)
USING DELTA;