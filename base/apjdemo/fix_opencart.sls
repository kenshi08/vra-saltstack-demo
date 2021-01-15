fix_the_hack:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - arg:
      - apjdemo.fix_hack