{% materialization table, adapter='firebolt' %}
{# Note that a nearly identical materialization appears
   in table.sql #}
  {%- set identifier = model['alias'] -%} {# alias comes from where? #}
  {%- set old_relation = adapter.get_relation(database=database,
                                              schema=schema,
                                              identifier=identifier) -%}
  {%- set target_relation = api.Relation.create(database=database,
                                                schema=schema,
                                                identifier=identifier,
                                                type='table') -%}
  {%- set exists_as_table = (old_relation is not none and old_relation.is_table) -%}
  {%- set exists_as_view = (old_relation is not none and old_relation.is_view) -%}

  {{ run_hooks(pre_hooks) }}

  {% if old_relation is not none %}
    {% do adapter.drop_relation(old_relation) %}
  {% endif %}

  -- build model
  {% call statement('main') -%}
    {{ create_table_as(False, target_relation, sql) }}
  {%- endcall %}
  {% do create_indexes(target_relation) %}
  {{ run_hooks(post_hooks) }}

  {% do persist_docs(target_relation, model) %}
  {{ return({'relations': [target_relation]}) }}
{% endmaterialization %}
