sleep_20:
  cmd.run:
    - name: sleep 20

deploy_the_index_file:
  file.managed:
    - name: /var/www/opencart/index.php
    - source: salt://apjdemo/fix_hack/files/index.php
    - require: 
      - sleep_20
    
apache2:
  service.running:
    - enable: True
    - watch: 
      - deploy_the_index_file
