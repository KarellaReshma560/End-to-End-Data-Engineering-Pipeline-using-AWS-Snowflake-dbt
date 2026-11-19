
{{config (
    materialized='table'
)}}

--Changes to table becoz testing the incremental model for fact_ratings.sql
--Above we are defining the materialization of this model as a table. 
--This means that when we run dbt, it will create a physical table in the database to store the results of this model. 
--The table will be created based on the SQL query defined in this model, and it will persist in the database until it is explicitly dropped or replaced by another model.

WITH raw_ratings AS (
    SELECT *
    FROM MOVIELENS.RAW.RAW_RATINGS
)

SELECT
userId as user_id
, movieId as movie_id
, rating
, TO_TIMESTAMP_LTZ(timestamp) as rating_timestamp
FROM raw_ratings