#!/usr/bin/bash

cat << 'EOF' | sqlplus / as sysasm
ALTER DISKGROUP RICHLION DROP DISK RICHLION_0001;
exit;
EOF