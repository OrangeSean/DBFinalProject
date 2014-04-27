spool d:\dbm\fp\temp.txt
TTITLE 'Employee Information'
set pagesize 41 linesize 150
column employee format A18
column supervisor format A16
column Skill word_wrapped format A40
column Training word_wrapped format A40
column Date_Acquired heading 'Date|Acquired' format A15
column months heading 'Months|Since|Training' format 999
break on report on employee skip 1
compute count label 'Number of Trainings' of training on employee
select e.emp_first || ' ' || e.emp_last as employee, 
       s.emp_first || ' ' || s.emp_last as supervisor,
       t.name training, t.DATE_ACQUIRED, sk.description as Skill, 
       months_between(sysdate, t.date_acquired) months
from employee e inner join employee s on e.super_id = s.emp_num
                inner join training t on e.EMP_NUM = t.EMP_NUM
                inner join skill sk   on t.code = sk.code
order by e.emp_last;
set linesize 180 pagesize 200
spool out
