set echo on
set linesize 180 pagesize 200
ttitle off
btitle off
spool D:\DBM\FP\output\partA.txt
start D:\DBM\FP\partA\homer.sql;
start D:\DBM\FP\partA\skill.sql;
start D:\DBM\FP\partA\department.sql;
start D:\DBM\FP\partA\employee.sql;
start D:\DBM\FP\partA\department_manager_id.sql;
start D:\DBM\FP\partA\training.sql;
start D:\DBM\FP\partA\client.sql;
start D:\DBM\FP\partA\project.sql;
start D:\DBM\FP\partA\assignment.sql;
spool out
