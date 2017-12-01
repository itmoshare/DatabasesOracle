rman target / << EOF
STARTUP MOUNT;
run {
	backup current controlfile for standby format '/u01/lab3/backup/replica.ctl';
}
exit
EOF