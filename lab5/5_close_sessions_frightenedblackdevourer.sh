sqlplus> SELECT sid , serial#, inst_id FROM gv$session WHERE username=upper('frightenedblackdevourer');
       SID    SERIAL#    INST_ID
---------- ---------- ----------
       372      60793          1
sqlplus> alter system kill session '372,60793,@1';
#'SID,SERIAL,@INST_ID'