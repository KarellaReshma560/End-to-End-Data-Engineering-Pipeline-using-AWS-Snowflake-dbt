# MovieLens Data Engineering Pipeline | AWS S3, Snowflake & dbt

An end-to-end data engineering project using the MovieLens dataset to build a cloud-based data transformation and analytics workflow with **AWS S3, Snowflake, and dbt**.

## Project Overview

This project demonstrates how raw movie, rating, and tag data can be ingested into a cloud data warehouse, transformed into analytics-ready models, and validated using dbt.

The workflow follows a layered approach, separating raw source data from transformed models and analytical outputs.

## Architecture

**MovieLens CSV → AWS S3 → Snowflake RAW → dbt Transformations → Analytics-ready Models**

## Technologies Used

- **AWS S3** – Storage for the MovieLens source CSV files.
- **Snowflake** – Cloud data warehouse for raw data storage and transformations.
- **dbt Core** – SQL-based data transformation, testing, documentation, and model management.
- **SQL** – Data transformation, joins, aggregations, and validation.
- **Python** – Project environment and dbt setup.

## Key Implementations

- Uploaded MovieLens CSV files to AWS S3 and connected the data to Snowflake.
- Loaded source data into Snowflake RAW tables.
- Built dbt staging, dimension, and fact models.
- Implemented table, view, incremental, and ephemeral materializations.
- Created reusable dbt macros for data-quality checks.
- Added generic and singular tests to validate transformed data.
- Implemented a dbt snapshot to demonstrate Slowly Changing Dimension (SCD) Type 2.
- Used dbt seeds for static reference data.
- Created analytical SQL to identify highly rated movies.
- Generated dbt documentation to explore model descriptions, dependencies, lineage, and tests.

## Data Quality and Testing

Implemented dbt tests including:

- `not_null`
- `relationships`
- Custom singular SQL tests
- A reusable macro to check for NULL values across model columns

These tests help identify data-quality issues before data moves further through the transformation workflow.

## Documentation

Generated dbt documecally using:

```bash
dbt dontation locs generate
dbt docs serve
```

The documentation provides visibility into models, dependencies, lineage, descriptions, and tests.

## Key Skills Demonstrated

Through this project, I gained hands-on experience with:

- **Cloud Data Integration:** Loading source CSV files from AWS S3 into Snowflake.
- **SQL & Data Modelling:** Building staging, dimension, and fact models.
- **dbt Development:** Working with sources, seeds, macros, snapshots, and different materializations.
- **Incremental Processing:** Implementing incremental models to process new records.
- **Data Quality:** Creating generic tests, singular tests, and reusable macros to validate transformed data.
- **Historical Data Tracking:** Implementing dbt snapshots to demonstrate Slowly Changing Dimension (SCD) Type 2.
- **Data Lineage & Documentation:** Generating dbt documentation to understand model dependencies, descriptions, and test results.

## Project Status

Completed as a hands-on learning project using the MovieLens dataset. The project demonstrates cloud data integration, SQL transformations, data modelling, and data quality practices. It uses a static dataset and is not a continuously running production pipeline.