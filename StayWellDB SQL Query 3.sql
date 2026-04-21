--===========================================================================
--============================= CIS310 ASSIGNMENT 10 =========================
--===========================================================================
/*
STUDENT NAME: Isaiah Martinez
STUDENT ID: 5546381
SUBMISSION DATE: 11/19/24
For each of the following business request PROVIDE THE SQL Query that adequtely performs the tasks.
**These queries are based on STAYWELL DB Tables and their data contents**
Grading:
Proper Code Formatting is 20% of homework grade
Executable code can earn up to 100% of the grade
Unexecutable code can only earn up to a max of 50% of the grade
*/
SELECT * FROM PROPERTY;
EXEC sp_columns OWNER;
-- 1. Create a Stored Procedure DISPLAY_OWNER_YOURFIRSTNAMELASTNAME (E.G. DISPLAY_OWNER_JIAOWANG), and its corresponding execution/test code.
--This Stored Procedure takes a single parameter/variable named INPUT_PROPERTY_ID to store user input value of a PROPERTY_ID.
--It should output OFFICE_NUM, ADDRESS, OWNER_NUM and OWNER_NAME (concatenated FirstName LastName in proper format)
--from the PROPERTY and OWNER tables for the given PROPERTY_ID
CREATE PROCEDURE DISPLAY_OWNER_YOURFIRSTNAMELASTNAME @INPUT_PROPERTY_ID CHAR(2) = NULL
AS
 BEGIN
 SELECT PROPERTY.OFFICE_NUM, PROPERTY.[ADDRESS], PROPERTY.OWNER_NUM, FIRST_NAME+' '+ LAST_NAME AS OWNER_NAME
 FROM PROPERTY INNER JOIN OWNER ON PROPERTY.OWNER_NUM = OWNER.OWNER_NUM
 WHERE PROPERTY_ID = @INPUT_PROPERTY_ID
 END;
EXEC DISPLAY_OWNER_YOURFIRSTNAMELASTNAME '1';
-- 2. Create a Stored Procedure UPDATE_OWNER_YOURFIRSTNAMELASTNAME (E.G. UPDATE_OWNER_JIAOWANG), and its corresponding execution/test code.
--This Stored Procedure takes 2 parameters/variables:
--I_OWNER_NUM to store user input value of a OWNER_NUM, and I_LAST_NAME to store user input value of a new LAST_NAME.
--This stored procedure should update/change the last name to the given value, for the given owner num.
CREATE PROCEDURE UPDATE_OWNER_YOURFIRSTNAMELASTNAME @I_OWNER_NUM CHAR(5), @I_LAST_NAME VARCHAR(20)
AS
 BEGIN
 UPDATE OWNER
 SET LAST_NAME = @I_LAST_NAME
 WHERE OWNER_NUM = @I_OWNER_NUM
 END;
EXEC UPDATE_OWNER_YOURFIRSTNAMELASTNAME 'BU106', 'Martinez';
SELECT OWNER_NUM, LAST_NAME
 FROM OWNER
 WHERE OWNER_NUM = 'BU106';