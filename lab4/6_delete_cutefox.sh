#!/usr/bin/bash

cat << EOF | sqlplus / as sysasm
drop diskgroup cutefox including contents;
EOF