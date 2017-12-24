@db1
sqlplusdb <<EOF
create table test2 (ID NUMBER, DATA NUMBER);
insert into test2 values(1,100);
insert into test2 values(2,200);
EOF