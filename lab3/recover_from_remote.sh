ssh oracle@db181 './u01/lab3/backupdb181.sh'
scp -r oracle@db181:/u01/rjb12/lastlaw/flash_recovery_area/LASTLAW/archivelog/* /u01/rjb12/lastlaw/flash_recovery_area/LASTLAW/archivelog/*
./recover_db182.sh