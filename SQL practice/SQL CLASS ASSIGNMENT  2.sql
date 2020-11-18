Use Demo;

CREATE TABLE EMP_SAL
(EID CHAR(5),
DEPT VARCHAR(10),
DESI VARCHAR(20),
DOJ DATE,
SALARY FLOAT
)

--ALTER TABLE EMP_SAL ALTER COLUMN DESI VARCHAR(20);

INSERT INTO EMP_SAL VALUES('E0001','AIML','JR DATA SCIENTIST','2020-11-27','150000');
INSERT INTO EMP_SAL VALUES('E0002','DEV','SR SOFTWARE DEV','2019-05-22','100000');
INSERT INTO EMP_SAL VALUES('E0003','DEVOPS','JR ARCHITECH','2018-05-22','100000');
INSERT INTO EMP_SAL VALUES('E0004','OPS','MANAGER','2017-05-01','70000');
INSERT INTO EMP_SAL VALUES('E0005','HR','TECH RECRUITER','2009-10-22','60000');
INSERT INTO EMP_SAL VALUES('E0006','ADMIN','TRAVEL SUPPORT','2013-02-22','40000');
INSERT INTO EMP_SAL VALUES('E0007','HR','RESOURCE DEVELOPER','2014-08-28','50000');
INSERT INTO EMP_SAL VALUES('E0008','OPS','SR MANAGER','2015-01-22','80000');
INSERT INTO EMP_SAL VALUES('E0009','DEVOPS','SR ARCHITECH','2017-09-18','175000');
INSERT INTO EMP_SAL VALUES('E0010','AIML','DATA SCIENTIST','2018-05-22','200000');

SELECT * FROM EMP_SAL;

--DELETE EMP_SAL;

SELECT * FROM EMP;

--SELECT ALL EMP NAMES STARTING WITH D
SELECT * FROM EMP
WHERE NAME LIKE 'D%';

--INCREASE SALARY OF ALL HR BY 10%

UPDATE EMP_SAL
SET SALARY=SALARY*1.1
WHERE DEPT='HR';

SELECT * FROM EMP_SAL;



DELETE EMP_SAL WHERE EID='E0003';

SELECT * FROM EMP_SAL;
