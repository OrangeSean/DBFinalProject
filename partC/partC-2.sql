set linesize 140 pagesize 60
clear column
break on "table_name" on "column_name"
column "table_name" format A15
column "column_name" format A15
column "constraint_name" format A30
column "search_condition" format A35
column "reference" format A25
ttitle 'CONSTRAINTS INFORMATION'
btitle center 'END OF REPORT'

select utc.table_name,  utc.column_name,
	t5.constraint_name, t5.CONS_type, t5.search_condition, t5.reference
from user_tab_columns utc
left join (
	select T1.table_name table_name, T2.column_name column_name, T1.constraint_name constraint_name,
		decode(T1.constraint_type, 'P', 'PK', 'R', 'FK', 'U', 'UK', 'C', 'CK') CONS_type,
		T1.search_condition search_condition,
		decode(T3.table_name, null, null, T3.table_name || ': ' || T3.column_name) reference
	from user_constraints T1 left outer join user_cons_columns T2 on (T1.constraint_name = T2.constraint_name)
	left outer join (
		select user_constraints.table_name, column_name, constraint_name
		from user_constraints left outer join user_cons_columns using (constraint_name)
	) T3 on (T1.r_constraint_name = T3.constraint_name)
) t5 on (utc.table_name = t5.table_name and utc.column_name = t5.column_name)
order by table_name, column_id;

clear break column
ttitle off
btitle off
set linesize 180 pagesize 200
