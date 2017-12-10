#!/usr/bin/bash

cat << 'EOF' | sqlplus / as sysasm
ALTER DISKGROUP CUTEFOX DROP DISK CUTEFOX_0000;
exit;
EOF