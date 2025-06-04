#!/bin/sh

find /backups/ -name "*.dump" -type f -mtime +30 -print -delete
