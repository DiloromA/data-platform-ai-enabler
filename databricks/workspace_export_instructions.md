# Databricks Workspace Export Instructions

To create exportable assets for easy import, follow these steps in your Databricks workspace.

## 1. Set up the demo environment
- Create catalog: `CREATE CATALOG IF NOT EXISTS adtech_demo;`
- Create schema: `CREATE SCHEMA IF NOT EXISTS adtech_demo.adtech_platform;`
- Create volume: `CREATE VOLUME adtech_demo.adtech_platform.generated_datasets;`
- Run `databricks/00_setup.sql` to create tables.
- Import and run `notebooks/00_data_generation.ipynb` to generate data.
- Run `databricks/03_ingest_sample_data.sql` to load data.
- Run `databricks/01_business_semantics.sql` and `databricks/02_quality_lineage.sql` to create views.

## 2. Export the workspace
- In Databricks, go to Workspace > Import/Export.
- Select "Export" and choose the folder containing your demo notebooks and queries.
- Export as `.dbc` file (Databricks archive) or JSON.
- Download the export file.

## 3. Add to repo
- Place the export file (e.g., `demo_export.dbc`) in the `databricks/` folder.
- Update `README.md` with download/import instructions.

## 4. Import instructions for users
Users can import the `.dbc` file into their Databricks workspace for one-click setup.

Note: Exports may include data if small; otherwise, users run the generation steps after import.