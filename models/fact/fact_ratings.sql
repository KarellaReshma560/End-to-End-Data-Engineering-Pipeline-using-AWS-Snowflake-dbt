--In this model we are telling the materialization to be incremental. This means that when we run dbt, it will only process new or updated records since the last run, rather than reprocessing the entire dataset. This is particularly useful for large datasets where processing everything would be time-consuming and resource-intensive.
--If we did not define the materialization as incremental, dbt would default to a table materialization (dbt_profile.yml we have it as TABLE), which would recreate the entire table each time the model is run. This could lead to longer run times and increased resource usage, especially for large datasets.

{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}

WITH src_ratings AS (
    SELECT * FROM {{ ref('src_ratings') }}
)

SELECT
    user_id,
    movie_id,
    rating,
    rating_timestamp
FROM src_ratings
WHERE rating IS NOT NULL

--syntax we can see from the documentation
--This is a conditional statement that checks if the model is being run in incremental mode. If it is, then it adds an additional filter to the WHERE clause to only include records that have a rating_timestamp greater than the maximum rating_timestamp already present in the fact_ratings table (which is represented by {{ this }}). This ensures that only new or updated records are processed and added to the fact_ratings table during an incremental run.
--While we say dbt run --select fact_ratings. This part will execute only.
{% if is_incremental() %}
    AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}

/*
src_ratings (base table) = 5PM (Max time) to 6 PM (later point of time we received the data at 6 PM into src_ratibgs base table)
fact_ratings (fact table) = 5PM (Max time)

this = fact_ratings

6 > 5 --> The condition is true and will update the fact_ratings table
*/