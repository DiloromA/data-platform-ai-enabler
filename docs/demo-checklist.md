# Demo Checklist

Use this checklist before and during your talk to keep the demo smooth.

## Before the talk

- [ ] Verify the Databricks workspace is accessible.
- [ ] Confirm required features are available in your workspace (Delta Lake, SQL, Unity Catalog if possible).
- [ ] Import or prepare the notebooks from `notebooks/`.
- [ ] Run the setup script in `databricks/00_setup.sql` or the equivalent notebook to create sample tables.
- [ ] Confirm sample data loads successfully.
- [ ] Run the key notebooks at least once and verify outputs.
- [ ] Ensure the Genie/agent notebook runs in your target workspace.
- [ ] Save a backup copy of the notebooks or exported assets.

## Live demo flow

- [ ] Start with platform foundations and governance.
- [ ] Show the semantic layer and shared metrics definitions.
- [ ] Demonstrate data quality rules and issue detection.
- [ ] Explain lineage and trust with a concrete example.
- [ ] Run the BI/dashboard query and show the business payoff.
- [ ] Execute the Genie/agent query as a conversational example.

## Fallback plan

- If the live Genie/agent demo fails, use the prepared SQL query example instead.
- If data loading fails, switch to a pre-loaded import asset or a simplified dataset.
- Keep the narrative focused on platform decisions even if a notebook step is skipped.
