sqlplus "sys/uze319 as sysdba" @taldb181.sql

rman target / << EOF
STARTUP MOUNT;
run {
	backup current controlfile for standby format '/u01/lab3/backup/replica.ctl';
}
exit
EOF

./backupdb181.sh

