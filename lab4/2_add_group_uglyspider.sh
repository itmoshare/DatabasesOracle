#!/usr/bin/bash
#create uglyspider files
mkdir -p "/u01/uglyspider";
for((n = 0; n < 5; n++)) do
    /usr/sbin/mkfile -n 50m "/u01/uglyspider/uglyspider$n";
done;

asmcmd dsset "/u01/beautifulcheetah/*,/u01/cutefox/*,/u01/uglyspider/*";

cat << 'EOF' | sqlplus / as sysasm
CREATE DISKGROUP uglyspider EXTERNAL REDUNDANCY DISK
	'/u01/uglyspider/uglyspider0',
	'/u01/uglyspider/uglyspider1',
	'/u01/uglyspider/uglyspider2',
	'/u01/uglyspider/uglyspider3',
	'/u01/uglyspider/uglyspider4'
	ATTRIBUTE 'COMPATIBLE.ASM'='11.2.0.0.0',
    'au_size'='1M';
exit;
EOF