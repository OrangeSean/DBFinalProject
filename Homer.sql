ALTER TABLE employee drop constraint employee_deptcode_FK;
DROP TABLE training purge;
DROP TABLE assignment purge;
DROP TABLE project purge;
DROP TABLE department purge;
DROP TABLE employee purge;
DROP TABLE client purge;
DROP TABLE skill purge;

CREATE TABLE skill
( Code VARCHAR2(5),
  Description VARCHAR2(350),
  CONSTRAINT skill_code_PK PRIMARY KEY (Code)
);

CREATE TABLE client
( Client_ID VARCHAR2(4),
  Name      VARCHAR2(80),
  Street    VARCHAR2(50),
  City 		VARCHAR2(20),
  State		VARCHAR2(2), 
  Zip_Code  VARCHAR2(5), 
  Industry  VARCHAR2(20),
  Web_Address VARCHAR2(80),
  Phone		  VARCHAR2(15), 
  Contact_Name VARCHAR(30),
  CONSTRAINT client_clientid_PK PRIMARY KEY (Client_ID)
);

CREATE TABLE employee
( Emp_Num	NUMBER(5),
  Emp_Last	VARCHAR2(25), 
  Emp_First VARCHAR2(25), 
  Hire_Date DATE DEFAULT SYSDATE,
  DOB		DATE,
  Super_ID  NUMBER(5),
  Dept_Code VARCHAR2(5),
  CONSTRAINT employee_empnum_PK PRIMARY KEY (Emp_Num),
  CONSTRAINT employee_superid_FK FOREIGN KEY (Super_ID) REFERENCES Employee (Emp_Num),
  CONSTRAINT employee_age_ck check (((hire_date - DOB)/365) > 17),
  CONSTRAINT employee_supervise_ck check (super_id != emp_num)
);

CREATE TABLE department
( Dept_Code	VARCHAR2(5), 
  Name VARCHAR2(80),
  Location VARCHAR2(50), 
  Phone VARCHAR2(15), 
  Manager_ID NUMBER(5),
  CONSTRAINT department_deptcode_PK PRIMARY KEY (Dept_Code),
  CONSTRAINT department_managerid_FK FOREIGN KEY (Manager_ID) REFERENCES Employee (Emp_Num)
);

CREATE TABLE project
( Project_Number NUMBER(2),
  Name VARCHAR2(80), 
  Start_Date DATE DEFAULT SYSDATE,
  Total_Cost NUMBER(10), 
  Dept_Code VARCHAR2(5), 
  Client_ID VARCHAR2(4),
  CONSTRAINT project_projnumber_PK PRIMARY KEY (Project_Number),
  CONSTRAINT project_deptcode_FK FOREIGN KEY (Dept_Code) REFERENCES Department (Dept_Code),
  CONSTRAINT project_clientid_FK FOREIGN KEY (Client_ID) REFERENCES Client (Client_ID),
  CONSTRAINT project_dept_admin_CK check (Dept_Code != 'ADMIN')
);

CREATE TABLE assignment
( Assign_Num  NUMBER(5),
  Proj_Number NUMBER(5),
  Emp_Num     NUMBER(5),
  Date_Assigned DATE DEFAULT SYSDATE,
  Date_Ended DATE, 
  Hours_Used NUMBER(5),
  CONSTRAINT assignment_assignnum_PK PRIMARY KEY (Assign_Num),
  CONSTRAINT assignment_projectnumber_FK FOREIGN KEY(Proj_Number) REFERENCES Project (Project_Number),
  CONSTRAINT assignment_empnum_FK FOREIGN KEY(Emp_Num) REFERENCES Employee (Emp_Num),
  CONSTRAINT assignment_endassign_CK check (Date_Assigned < Date_Ended),
  CONSTRAINT assignment_monthproj_CK unique (date_ended, proj_number)
);

CREATE TABLE training
( Train_Num NUMBER(5),
  Code VARCHAR2(5),
  Emp_Num NUMBER(5),
  Date_Acquired DATE,
  Name VARCHAR2(80),
  Comments VARCHAR2(350),
  CONSTRAINT training_trainnum_PK PRIMARY KEY (Train_Num),
  CONSTRAINT training_code_FK FOREIGN KEY (Code) REFERENCES Skill (Code),
  CONSTRAINT training_empnum_FK FOREIGN KEY (Emp_Num) REFERENCES Employee (Emp_Num)
);

ALTER TABLE EMPLOYEE ADD CONSTRAINT employee_deptcode_FK FOREIGN KEY (Dept_Code) REFERENCES Department (Dept_Code);
