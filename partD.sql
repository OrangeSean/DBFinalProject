---------------------------Part D Report
column project format A50
column department format A25
column "Cost per Hour" format A18
break on report on department skip 1
compute sum label "Total Department Cost" of  total_cost on department
column duration heading 'Duration | (In Days)'
set feedback off linesize 130 pagesize 45
TTITLE 'Total Cost Per Department | from January 1, 2011 to December 31, 2014'
BTITLE CENTER 'End of Report' -
       RIGHT 'Run By: ' SQL.USER FORMAT A7
spool "C:\Users\ChibeePatag\git\DBFinalProject\partDResults.txt"
select department.name Department, project.name Project,  max(assignment.date_ended)- project.start_date as duration, 
total_cost, count(emp_num) "Employees", to_char(total_cost/sum(hours_used), '$9999999.99') "Cost per Hour"
from department join project using (DEPT_CODE)
join assignment using (proj_number)
where project.start_date > to_date('1-JAN-2011','DD-MON-YYYY')     
group by department.name, project.name, project.START_DATE, total_cost
having max(assignment.date_ended) < to_date('31-DEC-2014','DD-MON-YYYY')
order by department, total_cost desc;
spool out;












