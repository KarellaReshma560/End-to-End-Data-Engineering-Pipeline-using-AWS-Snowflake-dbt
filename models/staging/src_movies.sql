WITH raw_movies AS (
    SELECT *
    FROM {{ source('netflix', 'r_movies') }}
    -- Instead of this MOVIELENS.RAW.RAW_MOVIES we can define r_movies becoz we created in source.yml file and we can use this r_movies in other models. 
    
)

SELECT movieId as movie_id
, title, genres
FROM raw_movies