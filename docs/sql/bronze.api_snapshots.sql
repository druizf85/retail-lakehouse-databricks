CREATE TABLE IF NOT EXISTS retail_lakehouse_dr.bronze.api_snapshots (
    source STRING NOT NULL,
    record_id STRING NOT NULL,
    run_id STRING NOT NULL,
    extracted_at STRING NOT NULL,
    payload_json STRING NOT NULL
)
USING DELTA;