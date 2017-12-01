rman target / << EOF
STARTUP MOUNT;
run {
	restore database until scn $1;
}
exit
EOF