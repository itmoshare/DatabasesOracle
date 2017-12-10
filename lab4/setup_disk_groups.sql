startup

CREATE DISKGROUP beautifulcheetah EXTERNAL REDUNDANCY DISK
	'/u01/beautifulcheetah/beautifulcheetah0',
	'/u01/beautifulcheetah/beautifulcheetah1',
	'/u01/beautifulcheetah/beautifulcheetah2',
	'/u01/beautifulcheetah/beautifulcheetah3',
	'/u01/beautifulcheetah/beautifulcheetah4',
	'/u01/beautifulcheetah/beautifulcheetah5'
	ATTRIBUTE 'COMPATIBLE.ASM'='11.2.0.0.0';

CREATE DISKGROUP cutefox EXTERNAL REDUNDANCY DISK
	'/u01/cutefox/cutefox0',
	'/u01/cutefox/cutefox1',
	'/u01/cutefox/cutefox2',
	'/u01/cutefox/cutefox3',
	'/u01/cutefox/cutefox4',
	'/u01/cutefox/cutefox5',
	'/u01/cutefox/cutefox6'
	ATTRIBUTE 'COMPATIBLE.ASM'='11.2.0.0.0';
