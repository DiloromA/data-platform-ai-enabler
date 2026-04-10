# Setup Guide

This guide helps you prepare the Databricks environment to run the demo.

## Recommended workflow

1. **Create catalog, schema, and volume** (if not using defaults):
   ```
   CREATE CATALOG IF NOT EXISTS adtech_demo;
   CREATE SCHEMA IF NOT EXISTS adtech_demo.adtech_platform;
   CREATE VOLUME adtech_demo.adtech_platform.generated_datasets;
   ```
   - **Catalog**: `adtech_demo`
   - **Schema**: `adtech_platform`
   - **Volume**: `generated_datasets` (path: `/Volumes/adtech_demo/adtech_platform/generated_datasets/`)

2. **Generate data and load tables**: Run `notebooks/00_data_generation.ipynb` to create the catalog/schema/volume, generate synthetic ad tech data, save CSVs to the volume, and load the tables.

3. **Run demo**: Execute notebooks `01-06` in `notebooks/` to view the curated flow.

## Databricks free tier notes

- Some features like Unity Catalog may require premium tier.
- The repo uses managed volumes for data storage.
- Adjust catalog/schema names if needed for your environment.

## Notes for the article

Use the repo as a reference for the architecture and implementation story. The setup guide is intentionally simple so readers can focus on the core platform narrative.
