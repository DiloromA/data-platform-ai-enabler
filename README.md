# data-platform-ai-enabler

A reference implementation for how Databricks platform design enables trusted AI and analytics in media, sports, and entertainment.

This repository supports a Women in Data talk and a broader article on Databricks implementation for digital ad tech and media measurement. The demo uses an ad tech-style dataset with campaigns, impressions, clicks, conversions, cost, viewership duration, and engagement metrics.

## What this repo contains

- `notebooks/` — Sequential Databricks notebooks for platform foundations, business semantics, data quality, lineage, and AI/BI payoff.
- `databricks/` — SQL setup scripts and reusable Databricks asset definitions.
- `setup/` — environment and setup guidance for Databricks free tier.
- `docs/` — architecture and demo checklist to support the talk.
- `article/` — industry storytelling and reference material for media, sports, and entertainment.
- `resources/` — sample data generation and helpful reference links.

## Why this matters

This repo is built around a core idea: the platform builder's decisions on governance, data quality, semantics, and lineage are not infrastructure choices. They are the business choices that determine whether AI and analytics deliver trusted results.

## Quickstart

**Option 1: One-click import (recommended for talks)**
- Download `databricks/demo_export.dbc` from the repo.
- In Databricks, go to Workspace > Import and upload the `.dbc` file.
- The entire demo (notebooks, queries, data) will be imported and ready to run.

**Option 2: Manual setup**
1. In Databricks, create the catalog and schema if needed: `CREATE CATALOG IF NOT EXISTS adtech_demo; CREATE SCHEMA IF NOT EXISTS adtech_demo.adtech_platform; CREATE VOLUME adtech_demo.adtech_platform.generated_datasets;`
2. Run `databricks/00_setup.sql` to create the demo tables in schema `adtech_demo.adtech_platform`.
3. Run `notebooks/00_data_generation.ipynb` to generate synthetic data and save CSVs to volume `/Volumes/adtech_demo/adtech_platform/generated_datasets/`.
4. Run `databricks/03_ingest_sample_data.sql` to load CSVs into tables.
5. Run `databricks/01_business_semantics.sql` to create semantic views.
6. Run `databricks/02_quality_lineage.sql` to add quality checks and lineage views.
7. Execute the demo notebooks in `notebooks/` (01-06) to explore the platform story.

## Target audience

- Data engineers
- Platform builders
- Analytics architects
- Media and entertainment leaders looking for trusted measurement and AI enablement

## Notes

- The repo is designed to balance a ready-to-import experience with reusable build scripts.
- A Genie/agent demo recipe is included in the notebooks and may require Databricks conversational AI or SQL endpoint configuration.
