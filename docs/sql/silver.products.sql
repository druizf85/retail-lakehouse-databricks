CREATE TABLE IF NOT EXISTS retail_lakehouse_dr.silver.products (
    product_id INT,
    product_name STRING,
    category STRING,
    brand STRING,
    price DECIMAL(12,2),
    discount_percentage DECIMAL(5,2),
    rating DECIMAL(4,2),
    stock INT,
    sku STRING,
    availability_status STRING,
    minimum_order_quantity INT,
    source STRING,
    source_record_id STRING,
    run_id STRING,
    extracted_at TIMESTAMP
)
USING DELTA;