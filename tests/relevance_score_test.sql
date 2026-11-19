-- 

--Instead of writing the above query in this test file we can create a macro and call that macro here.

{{ no_nulls_in_columns(ref('fact_genome_scores')) }}