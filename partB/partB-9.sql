CLEAR COLUMN
COLUMN "DEPARTMENT" FORMAT A30
SELECT DEPARTMENT.NAME "DEPARTMENT",
	SKILL.CODE "SKILL", COUNT(TRAIN_NUM) "TRAIN TIMES",
	RANK() OVER (PARTITION BY (DEPARTMENT.DEPT_CODE) ORDER BY COUNT(SKILL.CODE) DESC) AS "DEPT RANK"
FROM EMPLOYEE JOIN TRAINING ON EMPLOYEE.EMP_NUM = TRAINING.EMP_NUM
	JOIN SKILL ON SKILL.CODE = TRAINING.CODE
	JOIN DEPARTMENT ON DEPARTMENT.DEPT_CODE= EMPLOYEE.DEPT_CODE
GROUP BY DEPARTMENT.DEPT_CODE, DEPARTMENT.NAME, SKILL.CODE;
