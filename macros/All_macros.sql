{% macro format_dat(date_col) %}
    FORMAT_DATE('%b-%Y', {{date_col}})
{% endmacro %}