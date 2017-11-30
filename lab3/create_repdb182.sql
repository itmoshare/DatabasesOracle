startup nomount pfile='/u01/lab3/inits191999_rep.ora';
create spfile from pfile='/u01/lab3/inits191999_rep.ora';
shutdown immediate;
startup mount;