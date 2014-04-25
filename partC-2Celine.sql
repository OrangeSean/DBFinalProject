select T1.table_name "table_name", T2.column_name "column_name",
	T1.constraint_name "constraint_name",
	decode(T1.constraint_type, 'P', 'PK', 'R', 'FK', 'U', 'UK', 'C', 'CK') "type",
	T1.search_condition "search_condition",
	decode(T3.table_name, null, null, T3.table_name || ': ' || T3.column_name) "reference"
from user_constraints T1 left outer join user_cons_columns T2 on (T1.constraint_name = T2.constraint_name)
	left outer join (
	select user_constraints.table_name, column_name, constraint_name
	from user_constraints left outer join user_cons_columns using (constraint_name)
	) T3
	on (T1.r_constraint_name = T3.constraint_name);

select T4.table_name "table_name", t4.column_id, T4.column_name "column_name",
	T1.constraint_name "constraint_name",
	decode(T1.constraint_type, 'P', 'PK', 'R', 'FK', 'U', 'UK', 'C', 'CK') "type",
	T1.search_condition "search_condition",
	decode(T3.table_name, null, null, T3.table_name || ': ' || T3.column_name) "reference"
from 
  user_tab_columns t4 left outer join
  user_constraints T1 on (t4.table_name = t1.table_name) left outer join user_cons_columns T2 on (T1.constraint_name = T2.constraint_name and t4.COLUMN_NAME = T2.COLUMN_NAME)
	left outer join (
	select user_constraints.table_name, column_name, constraint_name
	from user_constraints left outer join user_cons_columns using (constraint_name)
	) T3
	on (T1.r_constraint_name = T3.constraint_name)
  order by t1.table_name, t4.column_id;
  
  
  select * from user_tab_columns;  
  select * from USER_CONSTRAINTS;
  select * from user_cons_columns;
  describe USER_CONSTRAINTS;
  
  select utc.table_name,  utc.column_name,
  t5.constraint_name, t5.CONS_type, t5.search_condition, t5.reference
  from user_tab_columns utc
  left join (select T1.table_name table_name, T2.column_name column_name,
	T1.constraint_name constraint_name,
	decode(T1.constraint_type, 'P', 'PK', 'R', 'FK', 'U', 'UK', 'C', 'CK') CONS_type,
	T1.search_condition search_condition,
	decode(T3.table_name, null, null, T3.table_name || ': ' || T3.column_name) reference
  from user_constraints T1 left outer join user_cons_columns T2 on (T1.constraint_name = T2.constraint_name)
	left outer join (
	select user_constraints.table_name, column_name, constraint_name
	from user_constraints left outer join user_cons_columns using (constraint_name)
	) T3
	on (T1.r_constraint_name = T3.constraint_name)) t5
  on (utc.table_name = t5.table_name and utc.column_name = t5.column_name)
  order by table_name, column_id
  ;
  
  
  select user_constraints.constraint_name, user_constraints.table_name, column_name from user_constraints join user_cons_columns
  on (user_constraints.constraint_name = user_cons_columns.constraint_name);