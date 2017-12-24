#!/usr/bin/bash

#create richlion files
mkdir -p "/u01/richlion";
for((n = 0; n < 5; n++)) do
    /usr/sbin/mkfile -n 100m "/u01/richlion/richlion$n";
done;

asmcmd dsset "/u01/beautifulcheetah/*,/u01/cutefox/*,/u01/uglyspider/*,/u01/richlion/*";

cat << 'EOF' | sqlplus / as sysasm
CREATE DISKGROUP richlion EXTERNAL REDUNDANCY DISK
	'/u01/richlion/richlion0',
	'/u01/richlion/richlion1',
	'/u01/richlion/richlion2',
	'/u01/richlion/richlion3',
	'/u01/richlion/richlion4'
	ATTRIBUTE 'COMPATIBLE.ASM'='11.2.0.0.0',
    'au_size'='16M';
exit;
EOF