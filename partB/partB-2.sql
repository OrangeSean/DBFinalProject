clear column
column level format A5
column employee format A25

SELECT LEVEL,
LPAD(' ', 3*(LEVEL - 1)) || emp_num || ' ' ||
emp_first || ' ' || emp_last "Employee", dept_code
FROM employee
START WITH emp_num = 1
CONNECT BY PRIOR emp_num = super_ID;
clear column