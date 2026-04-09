-- 02_quality_lineage.sql
-- Define data quality checks and lineage examples for the ad tech demo.

-- Example data quality query: invalid timestamps, missing required campaign IDs, negative costs.
CREATE OR REPLACE VIEW adtech_demo.adtech_platform.vw_data_quality_issues AS
SELECT
  'impressions' AS source_table,
  impression_id AS record_id,
  CASE
    WHEN campaign_id IS NULL THEN 'missing_campaign_id'
    WHEN event_timestamp IS NULL THEN 'missing_timestamp'
    WHEN view_duration_seconds < 0 THEN 'negative_view_duration'
    ELSE NULL
  END AS issue_type,
  *
FROM adtech_demo.adtech_platform.impressions
WHERE campaign_id IS NULL
   OR event_timestamp IS NULL
   OR view_duration_seconds < 0
UNION ALL
SELECT
  'clicks' AS source_table,
  click_id AS record_id,
  CASE
    WHEN campaign_id IS NULL THEN 'missing_campaign_id'
    WHEN click_timestamp IS NULL THEN 'missing_timestamp'
    WHEN cost < 0 THEN 'negative_cost'
    ELSE NULL
  END AS issue_type,
  *
FROM adtech_demo.adtech_platform.clicks
WHERE campaign_id IS NULL
   OR click_timestamp IS NULL
   OR cost < 0
UNION ALL
SELECT
  'conversions' AS source_table,
  conversion_id AS record_id,
  CASE
    WHEN campaign_id IS NULL THEN 'missing_campaign_id'
    WHEN conversion_timestamp IS NULL THEN 'missing_timestamp'
    WHEN revenue < 0 THEN 'negative_revenue'
    ELSE NULL
  END AS issue_type,
  *
FROM adtech_demo.adtech_platform.conversions
WHERE campaign_id IS NULL
   OR conversion_timestamp IS NULL
   OR revenue < 0;

-- Lineage example: a helper view showing how campaign metrics derive from source tables.
CREATE OR REPLACE VIEW adtech_demo.adtech_platform.vw_lineage_summary AS
SELECT
  'campaigns' AS source_table,
  'campaign_id' AS source_column,
  'adtech_demo.adtech_platform.vw_campaign_metrics.campaign_id' AS derived_column,
  'joins impressions, clicks, conversions' AS logic_description
UNION ALL
SELECT
  'impressions', 'view_duration_seconds', 'adtech_demo.adtech_platform.vw_campaign_metrics.avg_view_duration_seconds', 'average of impression durations'
UNION ALL
SELECT
  'impressions', 'viewability', 'adtech_demo.adtech_platform.vw_campaign_metrics.viewability_rate', 'ratio of viewable impressions to total impressions'
UNION ALL
SELECT
  'clicks', 'click_id', 'adtech_demo.adtech_platform.vw_campaign_metrics.total_clicks', 'count of clicks linked to impressions'
UNION ALL
SELECT
  'costs', 'daily_cost', 'adtech_demo.adtech_platform.vw_campaign_metrics.total_spend', 'sum of campaign daily cost';
