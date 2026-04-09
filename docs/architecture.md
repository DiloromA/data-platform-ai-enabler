# Architecture

This demo is built around a Databricks platform architecture that makes media/ad tech analytics and AI trustworthy and self-serve.

## Platform components

- Unity Catalog: centralized governance, catalog management, and access control.
- Delta Lake: reliable storage for raw and curated event data.
- Metrics Views / semantic layer: shared business definitions for metrics such as CTR, ROAS, viewability, and average watch duration.
- Data quality checks: pipeline-enforced rules that catch bad data at the source.
- Lineage tracking: visibility into how dashboards, metrics, and agents derive from raw events.
- Genie/agent demo: conversational access to the curated semantic layer.

## Industry relevance

In media and entertainment, platform decisions make the difference between trusted measurement and fragmented reporting:

- Ad tech campaigns need consistent cost allocation and audience engagement metrics.
- Content owners need viewership duration and ad effectiveness tied to business outcomes.
- Sports and entertainment businesses need audit-ready lineage for sponsorship reporting and fan engagement analysis.

## Demo flow

1. Ingest sample ad tech data into Delta tables.
2. Define the semantic layer: campaign-level metrics, audience metrics, and engagement metrics.
3. Enforce data quality: validity of timestamps, cost consistency, and event attribution.
4. Surface lineage and trust: show how metrics map to source tables and transformations.
5. Build dashboards and Genie/agent queries on top of the curated semantic layer.
