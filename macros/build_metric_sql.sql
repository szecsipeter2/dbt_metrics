{%- macro build_metric_sql(metric, model, grain, dimensions, secondary_calculations, start_date, end_date, where, calendar_tbl) %}

    {# This is the SQL Gen part - we've broken each component out into individual macros #}
    {{metrics.gen_aggregate_cte(metric,model,grain,dimensions,secondary_calculations, start_date, end_date, where, calendar_tbl)}}
    {{metrics.gen_dimensions_cte(metric,dimensions)}}
    {{metrics.gen_spine_time_cte(metric,grain,dimensions)}}
    {{metrics.gen_joined_cte(metric,grain,dimensions)}}

{% endmacro %}