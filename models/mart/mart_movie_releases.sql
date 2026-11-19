
{{config (
    materialized='table'
)
}}

WITH fcat_ratings AS (
    SELECT * FROM {{ref ('fact_ratings')}}
),
seed_dates AS (
    SELECT * FROM {{ref ('seed_movies_release_dates')}}
)

SELECT
    f.*,
    CASE
        WHEN s.release_date IS NULL THEN 'Unknown Movie'
        ELSE 'Known Movie'
    END AS movie_release_status
FROM fact_ratings f
LEFT JOIN seed_dates s ON f.movie_id = s.movie_id
