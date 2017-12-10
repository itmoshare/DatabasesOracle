rman target / << EOF
STARTUP MOUNT;
run {
	shutdown;
    startup mount;
    recover database;
}
exit
EOF