rman target / << EOF
STARTUP MOUNT;
run {
	recover database until scn $1;
	alter database open;
}
exit
EOF