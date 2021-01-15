install_opencart:
  salt.state:
    - tgt: 'oc-salt*'
    - tgt_type: glob
    - sls: 
      - apjdemo.opencart.ocinstall