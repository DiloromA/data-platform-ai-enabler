-- 01_business_semantics.sql
-- Define reusable business semantics and metric views for the ad tech demo.

CREATE OR REPLACE VIEW adtech_demo.adtech_platform.vw_campaign_metrics AS
SELECT
  c.campaign_id,
  c.campaign_name,
  c.advertiser,
  SUM(i.viewability::INT) AS total_viewable_impressions,
  COUNT(i.impression_id) AS total_impressions,
  SUM(CASE WHEN c2.click_id IS NOT NULL THEN 1 ELSE 0 END) AS total_clicks,
  SUM(c2.cost) AS total_spend,
  SUM(co.revenue) AS total_revenue,
  AVG(i.view_duration_seconds) AS avg_view_duration_seconds,
  SUM(CASE WHEN i.view_duration_seconds >= 1 THEN 1 ELSE 0 END) / NULLIF(COUNT(i.impression_id), 0) AS viewability_rate,
  SUM(CASE WHEN c2.click_id IS NOT NULL THEN 1 ELSE 0 END) / NULLIF(COUNT(i.impression_id), 0) AS click_through_rate,
  SUM(co.revenue) / NULLIF(SUM(c2.cost), 0) AS roas,
  SUM(CASE WHEN i.view_duration_seconds >= 5 THEN 1 ELSE 0 END) / NULLIF(COUNT(i.impression_id), 0) AS engaged_view_rate
FROM adtech_demo.adtech_platform.campaigns c
LEFT JOIN adtech_demo.adtech_platform.impressions i ON c.campaign_id = i.campaign_id
LEFT JOIN adtech_demo.adtech_platform.clicks c2 ON i.impression_id = c2.impression_id
LEFT JOIN adtech_demo.adtech_platform.conversions co ON c2.click_id = co.click_id
GROUP BY c.campaign_id, c.campaign_name, c.advertiser;

CREATE OR REPLACE VIEW adtech_demo.adtech_platform.vw_audience_engagement AS
SELECT
  audience_segment,
  COUNT(DISTINCT impression_id) AS impressions,
  SUM(CASE WHEN viewability THEN 1 ELSE 0 END) AS viewable_impressions,
  AVG(view_duration_seconds) AS avg_view_duration_seconds,
  SUM(CASE WHEN view_duration_seconds >= 5 THEN 1 ELSE 0 END) / NULLIF(COUNT(impression_id), 0) AS engaged_view_rate
FROM adtech_demo.adtech_platform.impressions
GROUP BY audience_segment;
