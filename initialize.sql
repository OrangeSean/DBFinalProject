--Sean's local (Change to point to your local, comment out mine below and run in sqlplus
-- please don't delete mine below so we dont have to keep changing. Thanks!
SET ECHO ON
SPOOL D:\DBM\FP\spoolout.txt
START D:\DBM\FP\HOMER;
START D:\DBM\FP\SKILL;
START D:\DBM\FP\DEPARTMENT;
START D:\DBM\FP\EMPLOYEE;
START D:\DBM\FP\DEPARTMENT2;
START D:\DBM\FP\TRAINING;
START D:\DBM\FP\CLIENT;
START D:\DBM\FP\PROJECT;
START D:\DBM\FP\ASSIGNMENT;
SPOOL OUT


--Celine's Local
set echo on
spool C:\Users\ChibeePatag\git\DBFinalProject\session.txt
start C:\Users\ChibeePatag\git\DBFinalProject\Homer.sql;
start C:\Users\ChibeePatag\git\DBFinalProject\skill.sql;
start C:\Users\ChibeePatag\git\DBFinalProject\department.sql;
start C:\Users\ChibeePatag\git\DBFinalProject\employee.sql;
start C:\Users\ChibeePatag\git\DBFinalProject\department2.sql;
start C:\Users\ChibeePatag\git\DBFinalProject\training.sql;
spool out;