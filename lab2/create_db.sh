#!/usr/bin/bash
. ./env

if [ ! -e "$ORADATA" ]; then
    mkdir -p "$ORADATA"
    mkdir "$ORADATA/node01"
    mkdir "$ORADATA/node02"
    mkdir "$ORADATA/node03"
    mkdir "$ORADATA/node04"
    mkdir "$ORADATA/flash_recovery_area"
fi

orapwd file="orapwdorcl" password=uze319 entries=10

cp "init$ORACLE_SID.ora" "$ORACLE_HOME/dbs/"
sqlplus /nolog @create_db.sql