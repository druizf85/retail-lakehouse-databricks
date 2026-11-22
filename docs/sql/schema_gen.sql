CREATE SCHEMA IF NOT EXISTS retail_lakehouse_dr.bronze
USING DELTA;

CREATE SCHEMA IF NOT EXISTS retail_lakehouse_dr.silver
USING DELTA;

CREATE SCHEMA IF NOT EXISTS retail_lakehouse_dr.gold
USING DELTA;