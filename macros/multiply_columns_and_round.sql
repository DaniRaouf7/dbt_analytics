{% macro multiply_columns_and_round(col1, col2, decimal_place=2) -%}
    round({{col1}} * {{col2}}, {{decimal_place}})
{% endmacro %}