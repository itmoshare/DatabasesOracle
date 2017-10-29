#!/usr/bin/bash
. ./env

export ORACLE_SID="s191999"
export ORACLE_HOME="/u01/app/oracle/product/11.2.0/dbhome_1"
export PATH=${PATH}:${ORACLE_HOME}/bin
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export ORADATA="/u01/rjb12/lastlaw"