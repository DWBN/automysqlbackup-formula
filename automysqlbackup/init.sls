automysqlbackup:
  file.managed:
    - name: /usr/local/bin/automysqlbackup
    - user: root
    - source: salt://automysqlbackup/files/automysqlbackup

automysqlbackup.conf:
  file.managed:
    - name: /etc/automysqlbackup.conf
    - user: root
    - source: salt://automysqlbackup/files/automysqlbackup.conf
    - template: jinja


#

