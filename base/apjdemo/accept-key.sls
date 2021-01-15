{% if 'act' in data and data['act'] == 'pend' and data['id'].startswith('oc-salt') %}
minion_add:
  wheel.key.accept:
    - match: {{ data['id'] }}
{% endif %}