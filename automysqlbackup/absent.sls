
automysqlbackup:
  file.absent:
    - name: /usr/local/bin/automysqlbackup


automysqlbackup.conf:
  file.absent:
    - name: /etc/automysqlbackup.conf

/usr/local/bin/automysqlbackup /etc/automysqlbackup.conf | /usr/bin/logger:
  cron.absent:
     - identifier: automysqlbackup
