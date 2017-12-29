sqlplusdb <<EOF
SELECT sid , serial#, inst_id FROM gv$session WHERE username=upper('frightenedblackdevourer');
EOF



#"SELECT sid , serial#, inst_id FROM gv$session WHERE username=upper('furiousyellowdrone');"