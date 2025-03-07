______________________________________________
-- Variables
_____________________________________________
{% set var1 = 'Hello world' -%}

{{ var1 }}

{%- set var2 -%}
    Hello world 2
{% endset %}

{{ var2 }}

{%- set var3 = ['Hello', 'Bye', 'Welcome'] -%}

{{ var3[2] }}
______________________________________________
-- Conditional statements
______________________________________________
{% set temperature = -3 %}

{%- if temperature > 20 -%}
It is hot
{%- elif temperature < 0 -%}
It is freezing
{%- else -%}
It is cold
{%- endif %}
______________________________________________
-- For loops
______________________________________________
{%- set names = ['id', 'quantity', 'unit_price'] %}

{{names}}

select
{%- for col in names %}
    {{col}}
    {%- if not loop.last-%}
    ,
    {%- endif -%}
{%- endfor %}
from table
______________________________________________
-- Some functions available
______________________________________________

{{ ref("bronze_orders") }}

{% set now = modules.datetime.datetime.now() %}

{{ now }}
______________________________________________
-- Loading sql dynamic jinja
______________________________________________

select
{%- set var4 = adapter.get_columns_in_relation(ref("bronze_orders")) -%}
{%- for column in var4 %}
    {{column.name}}
    {%- if not loop.last-%}
    ,
    {%- endif -%}
{%- endfor %}
from table1
