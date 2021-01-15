#Creating User
demouser:
  user.present:
    - fullname: DemoUser
    - shell: /bin/bash
    - home: /home/demouser
    - groups:
      - sudo

# Packages Needed for Install
needed-pkgs:
  pkg.installed:
    - pkgs:
      - git
      - mysql-server-5.7
      - mysql-client
      - unzip
      - open-vm-tools
      - apache2
      - php
      - php-mysql
      - libapache2-mod-php
      - php-cli
      - php-common
      - php-intl
      - php-gd
      - php-mbstring
      - php-xml
      - php-zip
      - php-curl
      - php-xmlrpc
      - python-mysqldb
      - python-pyinotify # required for beacon to function


# Final Script Configuration
/var/www/opencart:
  cmd:
    - script
    - source: salt://apjdemo/opencart/files/setup.sh
    - onlyif: 'test ! -e /var/www/opencart'
    
# Create Beacon to Protect Index.php
deploy_beacon_file:
  file.managed:
    - name: /etc/salt/minion.d/beacons.conf
    - source: salt://apjdemo/opencart/files/beacons.conf
    - makedirs: True
    
salt-minion:
  service.running:
    - enable: True
    - watch:
      - deploy_beacon_file