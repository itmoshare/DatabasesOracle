rman target / << EOF
STARTUP MOUNT;
run {
	shutdown;
    startup mount;
    recover database;
    alter database open;
}
exit
EOF