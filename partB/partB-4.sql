alter table employee add bonus number(10);
update employee x set x.bonus = 
(
	select 200 * count(proj_number) from assignment join project using (proj_number) 
	where START_DATE > to_date('1-JAN-2013','DD-MON-YYYY') and hours_used > 40 and emp_num = x.emp_num
	group by emp_num
	having count(proj_number) > 0
);
