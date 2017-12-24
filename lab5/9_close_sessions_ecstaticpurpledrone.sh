sqlplus> SELECT sid , serial#, inst_id FROM gv$session WHERE username=upper('ecstaticpurpledrone');
       SID    SERIAL#    INST_ID
---------- ---------- ----------
       354      60421          1
sqlplus> alter system kill session '354,60421,@1';