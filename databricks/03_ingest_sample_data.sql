-- 03_ingest_sample_data.sql
-- Load sample data from CSV files in Databricks volume into the ad tech demo tables.
-- Assumes CSVs are generated in /Volumes/adtech_demo/adtech_platform/generated_datasets/
-- Adjust volume path as needed for your catalog/schema/volume.

-- Load campaigns
CREATE OR REPLACE TEMPORARY VIEW temp_campaigns
USING CSV
OPTIONS (
  path '/Volumes/adtech_demo/adtech_platform/generated_datasets/campaigns.csv',
  header 'true',
  inferSchema 'true'
);

INSERT INTO adtech_demo.adtech_platform.campaigns
SELECT * FROM temp_campaigns;

-- Load impressions
CREATE OR REPLACE TEMPORARY VIEW temp_impressions
USING CSV
OPTIONS (
  path '/Volumes/adtech_demo/adtech_platform/generated_datasets/impressions.csv',
  header 'true',
  inferSchema 'true'
);

INSERT INTO adtech_demo.adtech_platform.impressions
SELECT * FROM temp_impressions;

-- Load clicks
CREATE OR REPLACE TEMPORARY VIEW temp_clicks
USING CSV
OPTIONS (
  path '/Volumes/adtech_demo/adtech_platform/generated_datasets/clicks.csv',
  header 'true',
  inferSchema 'true'
);

INSERT INTO adtech_demo.adtech_platform.clicks
SELECT * FROM temp_clicks;

-- Load conversions
CREATE OR REPLACE TEMPORARY VIEW temp_conversions
USING CSV
OPTIONS (
  path '/Volumes/adtech_demo/adtech_platform/generated_datasets/conversions.csv',
  header 'true',
  inferSchema 'true'
);

INSERT INTO adtech_demo.adtech_platform.conversions
SELECT * FROM temp_conversions;

-- Load costs
CREATE OR REPLACE TEMPORARY VIEW temp_costs
USING CSV
OPTIONS (
  path '/Volumes/adtech_demo/adtech_platform/generated_datasets/costs.csv',
  header 'true',
  inferSchema 'true'
);

INSERT INTO adtech_demo.adtech_platform.costs
SELECT * FROM temp_costs;

-- Verify data load
SELECT 'campaigns' AS table_name, COUNT(*) AS row_count FROM adtech_demo.adtech_platform.campaigns
UNION ALL
SELECT 'impressions', COUNT(*) FROM adtech_demo.adtech_platform.impressions
UNION ALL
SELECT 'clicks', COUNT(*) FROM adtech_demo.adtech_platform.clicks
UNION ALL
SELECT 'conversions', COUNT(*) FROM adtech_demo.adtech_platform.conversions
UNION ALL
SELECT 'costs', COUNT(*) FROM adtech_demo.adtech_platform.costs;