Use DEMO;

SELECT * FROM EMP;

----ASSIGNMENT 3----
ALTER TABLE EMP
ALTER COLUMN EID CHAR(5) NOT NULL;

ALTER TABLE EMP 
ADD CONSTRAINT PKID PRIMARY KEY (EID);

ALTER TABLE EMP
ALTER COLUMN NAME VARCHAR(20) NOT NULL;

ALTER TABLE EMP
ADD CONSTRAINT CKADDR CHECK(ADDR NOT LIKE '%UTTAM%NAGAR%');

UPDATE EMP 
SET CITY='DEL' 
WHERE EID IN ('E0001','E0006','E0004');

UPDATE EMP 
SET CITY='GGN' 
WHERE EID IN ('E0002','E0008','E0005');

UPDATE EMP 
SET CITY='FBD' 
WHERE EID IN ('E0003','E0009');

UPDATE EMP 
SET CITY='NOIDA' 
WHERE EID IN ('E0007','E0010');


ALTER TABLE EMP 
ADD CONSTRAINT CKCITY CHECK(CITY IN ('DEL','GGN','FBD','NOIDA'));

ALTER TABLE EMP 
ADD CONSTRAINT PHUNQ UNIQUE(PHONE);

ALTER TABLE EMP
ADD CONSTRAINT CKMAIL CHECK(EMAIL LIKE '%GMAIL%' OR EMAIL LIKE '%YAHOO%');

UPDATE EMP
SET DOB='01-JAN-1998' WHERE NAME='RIDDHI';

UPDATE EMP
SET DOB='22-SEP-1999' WHERE NAME='BABU';

ALTER TABLE EMP
ADD CONSTRAINT CKDOB CHECK(DOB<='01-JAN-2000');

SELECT * FROM EMP 
WHERE DOB>'01-JAN-2000';

SELECT * FROM EMP;

-- DIRECTLY WHILE CREATING TABLE 
create table TP_EMP
(EID CHAR(5) NOT NULL, 
NAME VARCHAR(20) NOT NULL,
ADDR VARCHAR(30) CHECK (ADDR NOT LIKE '%UTTAM%NAGAR%'),
CITY VARCHAR(10) CHECK (CITY IN ('DEL','GGN','FBD','NOIDA')),
DOB DATE CHECK(DOB<='01-JAN-2000'),
PHONE CHAR(10) UNIQUE,
EMAIL VARCHAR(30) CHECK(EMAIL LIKE '%GMAIL%' OR EMAIL LIKE '%YAHOO%')
PRIMARY KEY(EID)
);

ALTER TABLE EMP_SAL
ADD CONSTRAINT FKEID FOREIGN KEY (EID) REFERENCES EMP(EID);	

ALTER TABLE EMP_SAL
ADD CONSTRAINT DEFDEP DEFAULT 'TEMP' FOR DEPT;

UPDATE EMP_SAL 
SET DEPT='HR' 
WHERE EID IN ('E0001','E0006');

UPDATE EMP_SAL 
SET DEPT='MIS' 
WHERE EID IN ('E0002','E0008');

UPDATE EMP_SAL 
SET DEPT='OPS' 
WHERE EID IN ('E0003','E0009');

UPDATE EMP_SAL 
SET DEPT='IT' 
WHERE EID IN ('E0007','E0010');

UPDATE EMP_SAL 
SET DEPT='ADMIN' 
WHERE EID IN ('E0004','E0005');

ALTER TABLE EMP_SAL
ADD CONSTRAINT CKDEP CHECK(DEPT IN ('HR','MIS','OPS','IT','ADMIN','TEMP'))


UPDATE EMP_SAL 
SET DESI='ASSO' 
WHERE EID IN ('E0001','E0008','E0010','E0009');

UPDATE EMP_SAL 
SET DESI='MGR' 
WHERE EID IN ('E0005','E0002','E0006');

UPDATE EMP_SAL 
SET DESI='VP' 
WHERE EID IN ('E0004','E0007');

UPDATE EMP_SAL 
SET DESI='DIR' 
WHERE EID IN ('E0003');

ALTER TABLE EMP_SAL
ADD CONSTRAINT CKDESI CHECK(DESI IN('ASSO','MGR','VP','DIR'));

ALTER TABLE EMP_SAL
ADD CONSTRAINT CKSAL CHECK(SALARY>=20000);


--DIRECTLY AT TIME OF CREATITON
CREATE TABLE TP_EMP_SAL
(EID CHAR(5) REFERENCES TP_EMP(EID),
DEPT VARCHAR(10) CHECK(DEPT IN ('HR','MIS','OPS','IT','ADMIN','TEMP')) DEFAULT 'TEMP',
DESI VARCHAR(20) CHECK(DESI IN ('ASSO','MGR','VP','DIR') ),
DOJ DATE,
SALARY FLOAT CHECK(SALARY>=20000)
)

------ ASSIGNMENT 4-----

--CITYWISE COUNT OF EMPLOYEES ARRANGED IN DESCENDING ORDER
SELECT CITY,COUNT(CITY) AS 'COUNT OF EMPLOYEES' FROM EMP
GROUP BY CITY 
ORDER BY COUNT(CITY) DESC;

--DETAILS OF EMPLOYEES WHO DOES NOT HAVE AN ACCOUNT ON YAHOO DOMAIN
-- LETS UPDATE SOME OF OUR EMPLOEE DOMAINS TO YAHOO JUST TO DO THIS THING
UPDATE EMP
SET EMAIL='RS@YAHOO.COM'
WHERE NAME='RIDDHI';

UPDATE EMP
SET EMAIL='BS@YAHOO.COM'
WHERE NAME='BABU';

-- NOW ACTUAL QUERY  BOTH BELOW QUERIES GIVE SAME RESULTS

SELECT * FROM EMP 
WHERE EMAIL NOT LIKE '%YAHOO%';

SELECT * FROM EMP 
WHERE NOT EMAIL LIKE '%YAHOO%';

--FROM EMP_SAL TABLE, DISPLAY DESIGNATION WISE TOTAL COST AND 
--NUMBER OF MEMBERS ARRANGED IN DESCENDING ORDER OF THE TOTAL COST

SELECT DESI,COUNT(DESI) AS 'NUMBER OF MEMBERS',SUM(SALARY) AS 'TOTAL COST' FROM EMP_SAL
GROUP BY DESI
ORDER BY SUM(SALARY) DESC;

