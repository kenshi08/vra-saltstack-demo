{% if data['id'].startswith('oc-salt') %}
opencart_init:
  runner.state.orchestrate:
    - args:
      - mods: apjdemo.opencart
{% endif %}