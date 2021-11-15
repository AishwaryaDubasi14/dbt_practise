{% macro upper_case(column_name)%}

REPLACE(UPPER({{column_name}}), '_', '.')

{% endmacro%}