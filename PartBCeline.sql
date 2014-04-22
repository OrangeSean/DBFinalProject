--No. 2
column level format A5
column employee format A25

SELECT LEVEL,
LPAD(' ', 3*(LEVEL - 1)) || emp_num || ' ' ||
emp_first || ' ' || emp_last "Employee", dept_code
FROM employee
START WITH emp_num = 1
CONNECT BY PRIOR emp_num = super_ID;

--No. 4
alter table employee add bonus number(10);
update employee x set x.bonus = 
(
select 200*count(proj_number) from assignment join project using (proj_number) 
where START_DATE > to_date('1-JAN-2013','DD-MON-YYYY') and hours_used > 40 and emp_num = x.emp_num
group by emp_num
having count(proj_number) > 0
);

--No. 6
select name, start_date, --date_assigned, date_ended, 
case when total_cost is null  then 'On Going' else 'Completed' end as "On Going?"
from
(
select name, start_date, date_assigned, date_ended, total_cost,
lead(date_assigned, 1) over (PARTITION BY name order by name) - date_ended as discontinue
from project join assignment using (proj_number)
order by name
)
where discontinue > 0;

--No. 8
column id format 999
column "employee name" format A30
column JAVA1 format 9
column JAVA2 format 9
column J2EE format 9
column SQL1 format 9
column SQL2 format 9
column PRJM1 format 9
column PRJM2 format 9
column RUBY format 9
column PYTHO format 9

select decode(emp_num, null, ' ', emp_num) id, 
decode(emp_first || ' ' || emp_last, ' ', 'Number of Trainings', emp_first || ' ' || emp_last) "Employee Name",
sum(decode(code, 'JAVA1', 1, 0)) "JAVA1",
nvl(to_char(max(case when code = 'JAVA1' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'JAVA2', 1, 0)) "JAVA2",
nvl(to_char(max(case when code = 'JAVA2' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'J2EE', 1, 0)) "J2EE",
nvl(to_char(max(case when code = 'J2EE' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'MOBDA', 1, 0)) "MOBDA",
nvl(to_char(max(case when code = 'MOBDA' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'PRJM1', 1, 0)) "PRJM1",
nvl(to_char(max(case when code = 'PRJM1' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'PRJM2', 1, 0)) "PRJM2",
nvl(to_char(max(case when code = 'PRJM2' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired", 
sum(decode(code, 'PYTHO', 1, 0)) "PYTHO",
nvl(to_char(max(case when code = 'PYTHO' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'RUBY', 1, 0)) "RUBY",
nvl(to_char(max(case when code = 'RUBY' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'SQL1', 1, 0)) "SQL1",
nvl(to_char(max(case when code = 'SQL1' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
sum(decode(code, 'SQL2', 1, 0)) "SQL2",
nvl(to_char(max(case when code = 'SQL2' then  date_acquired else null end), 'dd-Mon-yyyy'), ' ') as "Latest Date Acquired",
count(code)
from employee join training using (emp_num)
group by GROUPING SETS 
  ((emp_num, emp_first, emp_last), ());
