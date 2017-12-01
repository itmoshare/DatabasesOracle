rman target / << EOF
STARTUP MOUNT;
run {
	restore database;
}
exit
EOF