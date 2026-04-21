--===========================================================================
--============================= CIS310 ASSIGNMENT 7 =========================
--===========================================================================
/*
STUDENT NAME: Isaiah Martinez
STUDENT ID: 5546381
SUBMISSION DATE: 10/25/24
For each of the following business question, PROVIDE THE SQL Query that adequtely output the requested information
**These queries are based on STAYWELL DB Tables and their data contents**
**The Expected Output Tables are at the end of file, to help you check your queries**
Grading:
Proper Code Formatting is 20% of homework grade
Executable code can earn up to 100% of the grade
Unexecutable code can only earn up to a max of 50% of the grade
*/
--1. List the owner number, last name, and first name of every property owner.
SELECT OWNER_NUM, LAST_NAME, FIRST_NAME
 FROM OWNER;
--2. List the complete PROPERTY table (all rows and all columns).
SELECT *
 FROM PROPERTY;
--3. List the last name and first name of every owner who lives in Seattle.
SELECT LAST_NAME, FIRST_NAME
 FROM OWNER
 WHERE CITY = 'SEATTLE';
--4. List the first name, last name and address of every owner who does not live in Seattle.
SELECT FIRST_NAME, LAST_NAME, [ADDRESS]
 FROM OWNER
 WHERE NOT CITY = 'SEATTLE';
--5. List the property ID and office number for every property whose square footage
--is equal to or less than 1,400 square feet.
SELECT PROPERTY_ID, OFFICE_NUM
 FROM PROPERTY
 WHERE SQR_FT <= 1400;
--6. List the property ID for every property with two bedrooms that is managed by StayWell-Georgetown
--In case the names changes, you should reference the given name "StayWell-Georgetown" in your query search
--*hint use subquery
SELECT PROPERTY_ID
 FROM PROPERTY
 WHERE BDRMS = 2 AND OFFICE_NUM = (SELECT OFFICE_NUM
 FROM OFFICE
 WHERE OFFICE_NAME = 'StayWell-Georgetown');
--7. List the ADDRESS AND SQUARE FOOTAGE ID for every property with a monthly rent that is between $1,350 and $1,750
--MUST USE PROPER KEYWORD OPERATOR, FOR MOST SUCCINCT QUERY, FOR FULL CREDIT.
SELECT [ADDRESS], SQR_FT
 FROM PROPERTY
 WHERE MONTHLY_RENT BETWEEN 1350 AND 1750;
--8. Labor is billed at the rate of $35 per hour.
--List the property ID, category number, estimated hours, and estimated labor cost for every service request.
--Sort the results by the estimated cost from highes to lowest.
--To obtain the estimated labor cost, multiply the estimated hours by 35.
--Use the column name ESTIMATED_COST for the estimated labor cost.
SELECT PROPERTY_ID, CATEGORY_NUMBER, EST_HOURS, (EST_HOURS * 35) AS ESTIMATED_COST
 FROM SERVICE_REQUEST
 ORDER BY ESTIMATED_COST DESC;

--9. List the owner number and last name for all owners who live in Nevada (NV), Oregon (OR), Kentucky (KY), or Idaho (ID)
--USE THE APPROPRIATE KEYWORD OPERATOR TO WRITE THE MOST SUCCINCT QUERY, FOR FULL CREDIT.
SELECT OWNER_NUM, LAST_NAME
 FROM OWNER
 WHERE STATE IN ('NV', 'OR', 'KY', 'ID');
--10. list the number of three-bedroom properties managed by each office?
SELECT OFFICE_NUM, COUNT(*) AS PROPERTYAMOUNT
 FROM PROPERTY
 WHERE BDRMS = 3
 GROUP BY OFFICE_NUM;
--===========================================================================
--========================== Expected Output Tables =========================
--============Best used *AFTER* you've come up with your queries ============
--===========================================================================
/*
Q1:
OWNER_NUM LAST_NAME FIRST_NAME
AK102 Aksoy Ceyda
BI109 Bianchi Nicole
BU106 Burke Ernest
CO103 Cole Meerab
JO110 Jones Ammarah
KO104 Kowalczyk Jakub
LO108 Lopez Janine
MO100 Moore Elle-May
PA101 Patel Makesh
RE107 Redman Seth
SI105 Sims Haydon
Q2:
PROPERTY_ID OFFICE_NUM ADDRESS SQR_FT BDRMS FLOORS MONTHLY_RENT OWNER_NUM
1 1 30 West Thomas Rd. 1600 3 1 1400 BU106
2 1 782 Queen Ln. 2100 4 2 1900 AK102
3 1 9800 Sunbeam Ave. 1005 2 1 1200 BI109
4 1 105 North Illinois Rd. 1750 3 1 1650 KO104
5 1 887 Vine Rd. 1125 2 1 1160 SI105
6 1 8 Laurel Dr. 2125 4 2 2050 MO100
7 2 447 Goldfield St. 1675 3 2 1700 CO103
8 2 594 Leatherwood Dr. 2700 5 2 2750 KO104
9 2 504 Windsor Ave. 700 2 1 1050 PA101
10 2 891 Alton Dr. 1300 3 1 1600 LO108
11 2 9531 Sherwood Rd. 1075 2 1 1100 JO110
12 2 2 Bow Ridge Ave. 1400 3 2 1700 RE107
Q3:
FIRST_NAME LAST_NAME
Ceyda Aksoy
Ammarah Jones
Makesh Patel
Seth Redman
Q4:
FIRST_NAME LAST_NAME ADDRESS
Nicole Bianchi 7990 Willow Dr.
Ernest Burke 613 Old Pleasant St.
Meerab Cole 9486 Circle Ave.
Jakub Kowalczyk 7431 S. Bishop St.
Janine Lopez 9856 Pumpkin Hill Ln.
Elle-May Moore 8006 W. Newport Ave.
Haydon Sims 527 Primrose Rd.
Q5:
PROPERTY_ID OFFICE_NUM
3 1
5 1
9 2
10 2
11 2
12 2
Q6:
PROPERTY_ID
9
11
Q7:
ADDRESS SQR_FT
30 West Thomas Rd. 1600
105 North Illinois Rd. 1750
447 Goldfield St. 1675
891 Alton Dr. 1300
2 Bow Ridge Ave. 1400
Q8:
PROPERTY_ID CATEGORY_NUMBER EST_HOURS ESTIMATED_COST
8 3 10 350
9 1 6 210
4 1 4 140
6 5 3 105
11 2 2 70
12 6 2 70
2 2 1 35
1 4 1 35
2 4 1 35
Q9:
OWNER_NUM LAST_NAME
BU106 Burke
MO100 Moore
SI105 Sims
Q10:
OFFICE_NUM PROPERTYPEROFFICE
1 2
2 3
*/