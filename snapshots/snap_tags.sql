
--before running this run the packages.yml file by mentioning the dbt_utils --> dbt deps this will install the required packages mentione in that file.
--Later run this snapshot file.
{% snapshot snap_tags %}

{{
    config(
        target_schema = 'snapshots',
        unique_key=['user_id', 'movie_id', 'tag'],
        strategy='timestamp',
        updated_at='tag_timestamp',         
        invalidate_hard_deletes=True     
        )
}}

SELECT
--Where we will get the packages for below dbt_utils.generate_surrogate_key function. We need to install the dbt_utils package in our project. We can do this by adding the below code in packages.yml file and then run dbt deps command to install the package.
{{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'tag'])}} AS row_key, --This surrogate key is used to create a unique key for the snapshot table. This is important because the unique key is used to identify the records in the snapshot table. If we do not have a unique key, then we will not be able to identify the records in the snapshot table and we will not be able to update the snapshot table with the new data.
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp AS TIMESTAMP_NTZ) AS tag_timestamp --Need to have timestamp_NTZ format otherwise will get error.
FROM {{ref('src_tags')}}
LIMIT 100

{% endsnapshot %}

/*
Note:1. updated_at='tag_timestamp' : This is column from the src_tags table which we are using to check if any changes happened in the data. If any changes happened then it will update the snapshot table with the new data.
2. invalidate_hard_deletes=True  :This is used to handle the case where a record is deleted from the source table. If this is set to True, then the snapshot will mark the record as deleted in the snapshot table. If this is set to False, then the snapshot will not mark the record as deleted in the snapshot table.
3. run --> dbt snapshot --select snap_tags : This command will run the snapshot and create the snapshot table in the snapshots schema. The snapshot table will be created with the name snap_tags. The snapshot table will be created with the columns user_id, movie_id, tag, tag_timestamp and row_key. The row_key is a surrogate key which is used to create a unique key for the snapshot table. This is important because the unique key is used to identify the records in the snapshot table. If we do not have a unique key, then we will not be able to identify the records in the snapshot table and we will not be able to update the snapshot table with the new data
*/