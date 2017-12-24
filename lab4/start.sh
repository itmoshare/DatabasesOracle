/u01/app/11.2.0/grid/bin/crsctl start resource ora.cssd
sqlplus / as sysasm
startup;
ALTER DISKGROUP BEAUTIFULCHEETAH MOUNT;
ALTER DISKGROUP CUTEFOX MOUNT;
ALTER DISKGROUP RICHLION MOUNT;


CREATE SPFILE FROM PFILE = '$ORACLE_HOME/dbs/ASM.191999.ora';


srvctl add asm -l LISTENER -p '+DATA' -d +DATA
srvctl add listener -l LISTENER -s -o $ORACLE_HOME
srvctl add asm -l LISTENER -p '+DATA' -d +DATA
crsctl stat res | grep NAME\= |grep asm


create spfile from memory;


srvctl add asm -p '+beautifulcheetah' -d '+beautifulcheetah'