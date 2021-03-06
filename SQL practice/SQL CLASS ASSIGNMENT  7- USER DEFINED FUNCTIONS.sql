--A-1: CREATE A FUNCTION CALC TO PERFORM THE SPECIFIED OPERATION ON THE GIVEN TWO NUMBERS .
USE DEMO;
CREATE FUNCTION CALC(@A AS INT ,@B AS INT ,@OP AS CHAR(1))
RETURNS INT
AS 
BEGIN 
	DECLARE @R AS INT;

	IF @OP='+'
		SET @R=@A + @B;
	ELSE IF @OP='-'
		SET @R=@A - @B;
	ELSE IF @OP='*'
		SET @R=@A * @B;
	ELSE IF @OP='/'
		SET @R=@A / @B;
	ELSE IF @OP='%'
		SET @R=@A % @B;
	ELSE
		SET @R=0;
	RETURN @R
END;

SELECT DBO.CALC(10,3,'+'),DBO.CALC(10,3,'-'),DBO.CALC(10,3,'*'),DBO.CALC(10,3,'/'),DBO.CALC(10,3,'%')

-- A-2: FUNCTION TO GENERATE THE EMAIL ID BY ACCEPTING NAME & EID. 
-- EMAIL SHOULD CONTAIN 1ST CHARACTER OF 1ST NAME , 1ST CHARACTER OF LAST NAME, LAST 3 DIGITS OF EMP ID FOLLOWED BY @RCG.COM; 
 CREATE FUNCTION EMAIL_CREATION(@NAME AS VARCHAR(20),@EID AS CHAR(5))
 RETURNS VARCHAR(20)
 AS 
 BEGIN 
	RETURN(CONCAT(LEFT(@NAME,1),SUBSTRING(@NAME,CHARINDEX(' ',@NAME)+1,1),RIGHT(@EID,3),'@RCG.COM'))
 END;

 SELECT EID,NAME,DBO.EMAIL_CREATION(NAME,EID) AS NEW_EMAIL FROM EMP;


-- A-3: FUNCTION TO RETURN EID, NAME, DESI, DEPT ,SALARY OF THE EMPLOYEES OF A SPECIFIED DEPARTMENT. 

 CREATE FUNCTION JOIN_DEPT(@DEPT AS VARCHAR(10))
 RETURNS TABLE 
 AS 
	RETURN(
			SELECT E.EID,E.NAME,ES.DESI,ES.DEPT,ES.SALARY 
			FROM EMP E INNER JOIN EMP_SAL ES ON E.EID=ES.EID 
			WHERE ES.DEPT=@DEPT
		);
--DROP FUNCTION JOIN_DEPT

SELECT * FROM DBO.JOIN_DEPT('HR');

-- A-4: FUNCTION TO DISPLAY THE NAME , DEPT . DESI , CITY OF THE EMPLOYEES WHO HAVE THE BIRTHDAY IN THE CURRENT MONTH. 
 
 CREATE FUNCTION BIRTHDAY_CURRENT_MONTH()
 RETURNS TABLE 
 AS 
	RETURN(
			SELECT E.NAME,ES.DEPT,ES.DESI,E.CITY 
			FROM EMP E INNER JOIN EMP_sAL ES ON E.EID=ES.EID
			WHERE MONTH(DOB)=MONTH(GETDATE())
	);

SELECT * FROM DBO.BIRTHDAY_CURRENT_MONTH();
 
-- A-5: FUNCTION TO DISPLAY THE NAME, DEPT & DOJ OF EMPLOYEES WHO HAVE COMPLETED 5 YEARS IN THE COMPANY.

CREATE FUNCTION TENURE(@YEARS AS INT)
RETURNS TABLE 
AS 
	RETURN(
			SELECT E.NAME,ES.DEPT,ES.DOJ 
			FROM EMP E INNER JOIN EMP_SAL ES ON E.EID=ES.EID
			WHERE DATEDIFF(YY,ES.DOJ,GETDATE())>=@YEARS
	);

--DROP FUNCTION TENURE

SELECT * FROM DBO.TENURE(5);