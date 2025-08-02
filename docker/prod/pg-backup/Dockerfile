FROM postgres:17.4-alpine

ADD crontab.txt /crontab.txt
ADD make_pg_backup.sh /make_pg_backup.sh
ADD remove_old_backups.sh /remove_old_backups.sh
COPY entry.sh /entry.sh
RUN chmod 755 /remove_old_backups.sh /make_pg_backup.sh /entry.sh
RUN /usr/bin/crontab /crontab.txt

CMD ["/entry.sh"]
