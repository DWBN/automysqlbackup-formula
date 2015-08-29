{% from 'automysqlbackup/map.jinja' import automysqlbackup with context %}


automysqlbackup:
  file.managed:
    - name: /usr/local/bin/automysqlbackup
    - user: root
    - source: salt://automysqlbackup/files/automysqlbackup
    - mode: 700

automysqlbackup.conf:
  file.managed:
    - name: /etc/automysqlbackup.conf
    - user: root
    - source: salt://automysqlbackup/files/automysqlbackup.conf
    - template: jinja


{% if automysqlbackup.daily_cron %}
/usr/local/bin/automysqlbackup /etc/automysqlbackup.conf | /usr/bin/logger:
  cron.present:
    - identifier: automysqlbackup
    - user: root
    - minute: 10
    - hour: 8
{% endif %}
