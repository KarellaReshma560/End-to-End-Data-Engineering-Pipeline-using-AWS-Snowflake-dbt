--Here i ma creating the ephemeral model for dim_movies_tags_scores.sql.
--Here we can use this model in other tables or view becoz this model wont physically store the data in the database. 
--It will be created as a temporary table in the database and will only exist for the duration of the dbt run.

{{config (
    materialized='ephemeral'
)
}}
WITH movies AS (
    SELECT * FROM {{ ref('dim_movies') }}
),
tags AS (
    SELECT * FROM {{ ref('dim_genome_tags') }}
),
scores AS (
    SELECT * FROM {{ ref('fact_genome_scores') }}
)

SELECT
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.relevance_score
FROM movies m
LEFT JOIN scores s ON m.movie_id = s.movie_id
LEFT JOIN tags t ON s.tag_id = t.tag_id