#!/bin/bash
now=$(date +%d%m%Y-%H:%M:%S)
filename=$1
backupfilename=$1-$now
rm -r ~/my-mysql/sql-scripts/backups/*
mysqldump -u root -p userlogin > ~/my-mysql/sql-scripts/backups/backup$backupfilename.sql
zip -r ~/my-mysql/sql-scripts/backups/backup$backupfilename.zip ~/my-mysql/sql-scripts/backups/backup$backupfilename.sql
# rm -r ~/my-mysql/sql-scripts/backups/backup$backupfilename.sql 
# mysql -u root -p userlogin < /home/ndulue/my-mysql/sql-scripts/backup$backupfilename.sql
#Delete a Cronjob
# find /home/ndulue/my-mysql/sql-scripts/backups/ -name "*.sql" -type f -mtime +1 -delete

# Cronjob
cd ~/Downloads/
scp -i "test-app.pem" -r /home/ndulue/my-mysql/sql-scripts/ ubuntu@ec2-54-145-2-186.compute-1.amazonaws.com:~/back-up/
