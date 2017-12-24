#!/usr/bin/bash
. ./asm_env.sh

/u01/app/11.2.0/grid/bin/crsctl start resource ora.cssd; 

#create beautifulcheetah files
mkdir -p "/u01/beautifulcheetah";
for((n = 0; n < 6; n++)) do
    /usr/sbin/mkfile -n 50m "/u01/beautifulcheetah/beautifulcheetah$n";
done;

#create cutefox files
mkdir -p "/u01/cutefox";
for((n = 0; n < 7; n++)) do
    /usr/sbin/mkfile -n 50m "/u01/cutefox/cutefox$n";
done;

cp "init$ORACLE_SID.ora" "$ORACLE_HOME/dbs/init$ORACLE_SID.ora"

sqlplus / as sysasm @setup_disk_groups.sql
