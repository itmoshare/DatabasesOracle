SET SERVEROUTPUT ON FORMAT WRAPPED;
DECLARE
    tableName VARCHAR2(40) := 'Н_ЛЮДИ';
    colNo VARCHAR2(128) := 'No.';
    colName VARCHAR2(128) := 'Имя столбца';
    colAttr VARCHAR2(128) := 'Атрибуты';

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
			WHERE cols.TABLE_NAME=tableName ORDER BY cols.COLUMN_ID;
	
	r_num VARCHAR2(10);
	r_colname VARCHAR2(40);
	r_typ VARCHAR2(100);
	r_coms VARCHAR2(100);
	r_ind VARCHAR2(100);

	no_length integer;
	col_name_length integer;
	attrib_length integer;

	type_length integer;
	comment_length integer;
	index_length integer;
BEGIN

	SELECT MAX(LENGTH(cols.COLUMN_ID)) into no_length FROM ALL_TAB_COLUMNS cols WHERE cols.TABLE_NAME=tableName;
	no_length := GREATEST(no_length, LENGTH(colNo));

	SELECT MAX(LENGTH(cols.COLUMN_NAME)) into col_name_length FROM ALL_TAB_COLUMNS cols WHERE cols.TABLE_NAME=tableName;
	col_name_length := GREATEST(col_name_length, LENGTH(colName));

	SELECT MAX(LENGTH(cols.DATA_TYPE) + 
						   CASE 
							WHEN cols.DATA_TYPE='NUMBER' THEN 3+LENGTH(cols.DATA_PRECISION)
							WHEN cols.DATA_TYPE LIKE'%CHAR%' THEN 3+LENGTH(cols.DATA_LENGTH)
							ELSE 0
						   END
				)
	into type_length 
	FROM ALL_TAB_COLUMNS cols WHERE cols.TABLE_NAME=tableName;

	SELECT MAX(LENGTH(coms.COMMENTS)) into comment_length FROM ALL_COL_COMMENTS coms WHERE coms.TABLE_NAME=tableName;

	comment_length := comment_length + LENGTH('Commen : ');

	SELECT MAX(LENGTH(inds.INDEX_NAME)) into index_length FROM ALL_IND_COLUMNS inds WHERE inds.TABLE_NAME=tableName;
	index_length:=index_length + LENGTH('Index  : ');

	attrib_length:=GREATEST(type_length, comment_length, index_length);
	
	dbms_output.put_line('Таблица: ' || tableName);
	-- HEADER START
    DBMS_OUTPUT.PUT_LINE(RPAD(colNo, no_length) || ' ' ||
                         RPAD(colName, col_name_length) || ' ' ||
                         RPAD(colAttr, attrib_length));

    DBMS_OUTPUT.PUT_LINE(RPAD('-', no_length, '-') || ' ' ||
                         RPAD('-', col_name_length, '-') || ' ' ||
                         RPAD('-', attrib_length, '-'));
    -- HEADER END

	OPEN res;
	LOOP
		FETCH res into r_num, r_colname, r_typ, r_coms, r_ind;
		EXIT WHEN res%NOTFOUND;
		dbms_output.put_line(RPAD(r_num, no_length) || ' ' || 
							 RPAD(r_colname, col_name_length) || ' ' || 
							 RPAD(r_typ, attrib_length));
		dbms_output.put_line(RPAD(' ', no_length + col_name_length + 2) || RPAD(r_coms, attrib_length));
		dbms_output.put_line(RPAD(' ', no_length + col_name_length + 2) || RPAD(r_ind, attrib_length));
	END LOOP;
	CLOSE res;
END;
/