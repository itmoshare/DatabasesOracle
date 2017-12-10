. /u01/lab2_191999/set_env.sh;
rman target / << EOF
STARTUP MOUNT;
run {
	BACKUP DATABASE PLUS ARCHIVELOG;
}
exit
EOF