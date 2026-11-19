--it is checking the null values in the columns of fact_genome_scores table. If any column has null values then it will return those rows with null values or else returns FALSE.

{% macro no_nulls_in_columns(model)%}

    SELECT * FROM {{ model}} WHERE
    {% for col in adapter.get_columns_in_relation(model) %}
        {{ col.column }} IS NULL OR 
    {% endfor %}
     False
{% endmacro %}