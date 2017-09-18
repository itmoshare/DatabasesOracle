SELECT cols.COLUMN_ID AS "No.", cols.COLUMN_NAME AS "Имя стобца", 
'Type   : ' || cols.DATA_TYPE
			|| CASE 
				WHEN cols.DATA_TYPE='NUMBER' THEN ' (' || cols.DATA_PRECISION ||')'
				WHEN cols.DATA_TYPE LIKE'%CHAR%' THEN ' (' || cols.DATA_LENGTH ||')'
				ELSE ''
			   END
|| chr(10)  || 
'Commen : ' || coms.COMMENTS || chr(10) || 
'Index  : ' || inds.INDEX_NAME 
AS "Атрибуты"
FROM ALL_TAB_COLUMNS cols
LEFT JOIN  ALL_COL_COMMENTS coms ON coms.COLUMN_NAME=cols.COLUMN_NAME AND coms.TABLE_NAME=cols.TABLE_NAME
LEFT JOIN ALL_IND_COLUMNS inds ON inds.COLUMN_NAME=coms.COLUMN_NAME AND inds.TABLE_NAME=coms.TABLE_NAME 
WHERE cols.TABLE_NAME='Н_ЛЮДИ' ORDER BY cols.COLUMN_ID;