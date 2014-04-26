set echo off
set linesize 250
column dept_code format A10
column date_ended format A10
column date_assigned format A10
column start_date format A10
column client_ID format A10
column name format A30
column street format A30
column city  format A15
column zip_code format A10
column industry format A15
column web_address format A40
column CONTACT_NAME format A20
column name format A55
column description format A50
column comments format A61
column date_acquired format A13
column name format A40
column EMP_LAST format A15
column EMP_FIRST format A15
set echo on
select * from assignment;
select * from client;
select * from department;
select * from employee;
set echo off
column name format A60
set echo on
select * from project;
select * from skill;
set echo off
column name format A35
set echo on
select * from training;