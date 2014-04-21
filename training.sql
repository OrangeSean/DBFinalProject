--------------------------------------------------------
--  File created - Wednesday-April-16-2014   
--------------------------------------------------------
REM INSERTING into TRAINING
SET DEFINE OFF;
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (1,'JAVA1',12,to_date('05-MAY-13','DD-MON-RR'),'Spring IOC, MVC','Need to develop better references.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (2,'PRJM1',13,to_date('06-MAY-12','DD-MON-RR'),'PPM for PMI Certification','It would have been better if we had more hands on experience.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (3,'J2EE',14,to_date('07-MAY-11','DD-MON-RR'),'Struts','Schedule was too tight.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (4,'JAVA1',15,to_date('08-DEC-11','DD-MON-RR'),'Unit testing and regression testing','We need better trainers.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (5,'J2EE',16,to_date('09-MAY-12','DD-MON-RR'),'Black box testing and use cases','Trainers were excellent.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (6,'J2EE',12,to_date('10-MAY-13','DD-MON-RR'),'Struts vs Spring','Very good');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (7,'SQL1',13,to_date('11-MAY-13','DD-MON-RR'),'Mobile development','Trainers voices were too soft');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (8,'SQL1',14,to_date('12-NOV-11','DD-MON-RR'),'Mainframe and assembly','Too long.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (9,'MOBDA',15,to_date('13-DEC-11','DD-MON-RR'),'Wicket, Thymeleaf','Need to explain better the concept of aardvark.');
Insert into TRAINING (TRAIN_NUM,CODE,EMP_NUM,DATE_ACQUIRED,NAME,COMMENTS) values (10,'MOBDA',16,to_date('14-MAY-13','DD-MON-RR'),'IOS Mobile Development','It would be nice if snacks were given.');
commit;
