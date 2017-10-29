SET SERVEROUTPUT ON FORMAT WRAPPED;
DECLARE
    tableName VARCHAR2(40) := 'Н_ЛЮДИ';

	CURSOR res IS 
		SELECT cols.COLUMN_ID AS num, cols.COLUMN_NAME AS colname, 
			'Type   : ' || cols.DATA_TYPE
						|| CASE 
							WHEN cols.DATA_TYPE='NUMBER' THEN ' (' || cols.DATA_PRECISION ||')'
							WHEN cols.DATA_TYPE LIKE'%CHAR%' THEN ' (' || cols.DATA_LENGTH ||')'
							ELSE ''
						   END as typ,
			'Commen : ' || coms.COMMENTS as coms,
			'Index  : ' || inds.INDEX_NAME as ind
			FROM ALL_TAB_COLUMNS cols
			LEFT JOIN  ALL_COL_COMMENTS coms ON coms.COLUMN_NAME=cols.COLUMN_NAME AND coms.TABLE_NAME=cols.TABLE_NAME
			LEFT JOIN ALL_IND_COLUMNS inds ON inds.COLUMN_NAME=coms.COLUMN_NAME AND inds.TABLE_NAME=coms.TABLE_NAME 
			WHERE cols.TABLE_NAME='Н_ЛЮДИ' ORDER BY cols.COLUMN_ID;
	
	r_num VARCHAR2(10);
	r_colname VARCHAR2(40);
	r_typ VARCHAR2(100);
	r_coms VARCHAR2(100);
	r_ind VARCHAR2(100);

	no_length integer;
	col_name_length integer;
	attrib_length integer;
BEGIN

	SELECT MAX(LENGTH(cols.COLUMN_ID)) into no_length FROM ALL_TAB_COLUMNS cols WHERE cols.TABLE_NAME='Н_ЛЮДИ';
	dbms_output.put_line(no_length)
	OPEN res;
	LOOP
		FETCH res into r_num, r_colname, r_typ, r_coms, r_ind;
		EXIT WHEN res%NOTFOUND;
		dbms_output.put_line(r_num || ' ' || r_colname || ' ' || r_typ);
		dbms_output.put_line(LENGTH(r_num)+LENGTH(r_colname)+2);
		dbms_output.put_line(RPAD(r_ind, LENGTH(r_num)+LENGTH(r_colname)+2, '-'));
	END LOOP;
	CLOSE res;
END;
/