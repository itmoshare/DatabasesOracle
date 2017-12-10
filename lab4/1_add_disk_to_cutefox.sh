#!/usr/bin/bash

/usr/sbin/mkfile -n 50m /u01/cutefox/cutefox7

cat << 'EOF' | sqlplus / as sysasm
ALTER DISKGROUP cutefox ADD DISK '/u01/cutefox/cutefox7';
exit;
EOF