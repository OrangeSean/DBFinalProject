select * from employee;
select * from department;

SELECT LEVEL,
LPAD(' ', 3*(LEVEL - 1)) || emp_num || ' ' ||
emp_first || ' ' || emp_last "Employee", dept_code
FROM employee
START WITH emp_num = 1
CONNECT BY PRIOR emp_num = super_ID;

alter table employee add bonus number(10);

--no 4. 
--projects started last year
select * from project where START_DATE > to_date('1-JAN-2013','DD-MON-YYYY');

select emp_num, proj_number, hours_used from assignment join project using (proj_number) 
where START_DATE > to_date('1-JAN-2013','DD-MON-YYYY')
and hours_used > 40
order by emp_num;

select * from assignment order by emp_num, date_assigned;

select 200*count(proj_number) from assignment join project using (proj_number) 
where START_DATE > to_date('1-JAN-2013','DD-MON-YYYY') and hours_used > 40
group by emp_num 
having count(proj_number) > 0
order by emp_num;

alter table employee add bonus number(10);

update employee set bonus = (select 200*count(proj_number) from assignment join project using (proj_number) 
where START_DATE > to_date('1-JAN-2013','DD-MON-YYYY') and hours_used > 40
group by emp_num 
having count(proj_number) > 0) where employee.EMP_NUM = 



--No. 8
select * from skill;
select * from training;
select * from skill join training using (code) 
join employee using (emp_num)
order by emp_num, code;

select distinct code from skill;
select distinct emp_num from training order by emp_num; -- 12, 13, 14, 15, 16

--Need to pivot this query
select emp_num, emp_first || ' ' || emp_last "Employee Name", code, max(training.DATE_ACQUIRED)
from skill join training using (code) join employee using (emp_num)
group by emp_num, emp_first, emp_last, code
order by emp_num;

select nvl(to_char(emp_num, '999'), ' ') id, emp_first || ' ' || emp_last "Employee Name",
       sum(decode(code, 'JAVA1', 1, 0)) "JAVA1",  
       case when sum(decode(code, 'JAVA1', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'JAVA2', 1, 0)) "JAVA2",     
       case when sum(decode(code, 'JAVA2', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'J2EE',  1, 0)) "J2EE",
       case when sum(decode(code, 'J2EE', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'SQL1',  1, 0)) "SQL1",
       case when sum(decode(code, 'SQL1', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'SQL2',  1, 0)) "SQL2",
       case when sum(decode(code, 'SQL2', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'PRJM1', 1, 0)) "PRJM1",
       case when sum(decode(code, 'PRJM1', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'PRJM2', 1, 0)) "PRJM2",
       case when sum(decode(code, 'PRJM2', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'RUBY',  1, 0)) "RUBY",
       case when sum(decode(code, 'RUBY', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",    
       sum(decode(code, 'PYTHO', 1, 0)) "PYTHO",
       case when sum(decode(code, 'PYTHO', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",   
       sum(decode(code, 'MOBDA', 1, 0)) "MOBDA",
       case when sum(decode(code, 'MOBDA', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
           else null end as "Date"           
from skill join training using (code) join employee using (emp_num)
group by GROUPING SETS ((emp_num, emp_first, emp_last ), ())
order by id;

select * from training;

select * from training order by train_num;

Insert into HOMER.TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (13,'JAVA1',12,to_date('05-JUN-13','DD-MON-RR'),'Spring IOC, MVC','Second take');
Insert into HOMER.TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (14,'JAVA1',12,to_date('05-AUG-13','DD-MON-RR'),'Spring IOC, MVC','Third take');
Insert into HOMER.TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (15,'JAVA1',12,to_date('05-AUG-13','DD-MON-RR'),'Spring IOC, MVC','Fourth take');


select emp_num,  emp_first || ' ' || emp_last "Employee Name", 
 sum(decode(code, 'JAVA1', 1, 0)) "JAVA1",  
       case when sum(decode(code, 'JAVA1', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'JAVA2', 1, 0)) "JAVA2",     
       case when sum(decode(code, 'JAVA2', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'J2EE',  1, 0)) "J2EE",
       case when sum(decode(code, 'J2EE', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'SQL1',  1, 0)) "SQL1",
       case when sum(decode(code, 'SQL1', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'SQL2',  1, 0)) "SQL2",
       case when sum(decode(code, 'SQL2', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'PRJM1', 1, 0)) "PRJM1",
       case when sum(decode(code, 'PRJM1', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'PRJM2', 1, 0)) "PRJM2",
       case when sum(decode(code, 'PRJM2', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",  
       sum(decode(code, 'RUBY',  1, 0)) "RUBY",
       case when sum(decode(code, 'RUBY', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",    
       sum(decode(code, 'PYTHO', 1, 0)) "PYTHO",
       case when sum(decode(code, 'PYTHO', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
            else null end as "Date",   
       sum(decode(code, 'MOBDA', 1, 0)) "MOBDA",
       case when sum(decode(code, 'MOBDA', 1, 0)) > 0 then max(training.DATE_ACQUIRED)
           else null end as "Date"       
from
(
select emp_num, emp_first, emp_last, code, max(training.DATE_ACQUIRED) training_date
from skill join training using (code) join employee using (emp_num)
group by emp_num, emp_first, emp_last, code) group by emp_num, emp_first, emp_last;




