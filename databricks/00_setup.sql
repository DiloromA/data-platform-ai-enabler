-- 00_setup.sql
-- Create the demo schema and raw event tables for digital ad tech.

CREATE SCHEMA IF NOT EXISTS adtech_demo.adtech_platform;

CREATE TABLE IF NOT EXISTS adtech_demo.adtech_platform.campaigns (
  campaign_id STRING,
  campaign_name STRING,
  advertiser STRING,
  start_date DATE,
  end_date DATE,
  budget DOUBLE,
  target_audience STRING,
  created_at TIMESTAMP
)
USING DELTA;

CREATE TABLE IF NOT EXISTS adtech_demo.adtech_platform.impressions (
  impression_id STRING,
  campaign_id STRING,
  publisher STRING,
  placement STRING,
  event_timestamp TIMESTAMP,
  viewability BOOLEAN,
  view_duration_seconds DOUBLE,
  audience_segment STRING
)
USING DELTA;

CREATE TABLE IF NOT EXISTS adtech_demo.adtech_platform.clicks (
  click_id STRING,
  impression_id STRING,
  campaign_id STRING,
  click_timestamp TIMESTAMP,
  cost DOUBLE,
  device STRING,
  geo STRING
)
USING DELTA;

CREATE TABLE IF NOT EXISTS adtech_demo.adtech_platform.conversions (
  conversion_id STRING,
  click_id STRING,
  campaign_id STRING,
  conversion_timestamp TIMESTAMP,
  revenue DOUBLE,
  conversion_type STRING
)
USING DELTA;

CREATE TABLE IF NOT EXISTS adtech_demo.adtech_platform.costs (
  campaign_id STRING,
  cost_date DATE,
  daily_cost DOUBLE,
  channel STRING
)
USING DELTA;

-- Seed sample data with INSERT or via notebook/python script in Databricks.
