scp -r oracle@db181:/u01/rjb12/lastlaw/flash_recovery_area/* /u01/rjb12/lastlaw/flash_recovery_area/
scp oracle@db181:/u01/lab3/backup/replica.ctl /u01/lab3/backup/replica.ctl
sqlplus "sys/uze319 as sysdba" @create_repdb182.sql
./restore_db182.sh
./recover_db182.sh