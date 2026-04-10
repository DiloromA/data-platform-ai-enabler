# data-platform-ai-enabler

A reference implementation for how Databricks platform design enables trusted AI and analytics in media, sports, and entertainment.

This repository supports a Women in Data talk and a broader article on Databricks implementation for digital ad tech and media measurement. The demo uses an ad tech-style dataset with campaigns, impressions, clicks, conversions, cost, viewership duration, and engagement metrics.

## What this repo contains

- `notebooks/` — Sequential Databricks notebooks for platform foundations, business semantics, data quality, lineage, and AI/BI payoff.
- `databricks/` — workspace export instructions and optional reference assets.
- `setup/` — environment and setup guidance for Databricks free tier.
- `docs/` — architecture and demo checklist to support the talk.
- `article/` — industry storytelling and reference material for media, sports, and entertainment.
- `resources/` — sample data generation and helpful reference links.

## Why this matters

This repo is built around a core idea: the platform builder's decisions on governance, data quality, semantics, and lineage are not infrastructure choices. They are the business choices that determine whether AI and analytics deliver trusted results.

## Quickstart

**Option 1: Workspace export instructions**
- Use `databricks/workspace_export_instructions.md` as a guide to create a one-click Databricks workspace export if you want an importable asset for the talk.
- If you do not have a `.dbc` file, proceed with Option 2.

**Option 2: Clone repo in Databricks (easiest for testing)**
- In Databricks, go to Repos > Create > Git.
- Clone `https://github.com/yourusername/data-platform-ai-enabler.git`.
- Run notebooks in order: `00_data_generation.ipynb` (creates catalog, schema, volume, and loads data), then `01-06`.
- No separate SQL scripts are required; the notebooks are self-contained.

**Option 3: Manual setup**
1. In Databricks, create the catalog and schema if needed:
   `CREATE CATALOG IF NOT EXISTS adtech_demo; CREATE SCHEMA IF NOT EXISTS adtech_demo.adtech_platform; CREATE VOLUME adtech_demo.adtech_platform.generated_datasets;`
2. Run `notebooks/00_data_generation.ipynb` to create the required catalog/schema/volume, generate synthetic data, save CSVs to volume `/dbfs/Volumes/adtech_demo/adtech_platform/generated_datasets/`, and load the tables.
3. Execute notebooks `01-06` in order to explore the platform story.

## Target audience

- Data engineers
- Platform builders
- Analytics architects
- Media and entertainment leaders looking for trusted measurement and AI enablement

## Notes

- The repo is designed to balance a ready-to-import experience with reusable build scripts.
- A Genie/agent demo recipe is included in the notebooks and may require Databricks conversational AI or SQL endpoint configuration.
