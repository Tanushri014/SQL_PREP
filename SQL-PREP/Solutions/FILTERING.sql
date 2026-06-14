

-- FILE: 03_Filtering.sql
-- TOPIC: Filtering Data using WHERE Clause
-- LEVEL: Beginner


USE COMPANY_DB;

-- ========================================================
-- Setup: Create EMPLOYEES table
-- ========================================================

CREATE TABLE EMPLOYEES
(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(20) NOT NULL,
DEPARTMENT_NAME VARCHAR(10) NOT NULL,
SALARY INT NOT NULL,
CITY VARCHAR(20) NOT NULL,
JOINING_DATE DATE
);

INSERT INTO EMPLOYEES
(
EMP_ID,
EMP_NAME,
DEPARTMENT_NAME,
SALARY,
CITY,
JOINING_DATE
)
VALUES
(1,'NAYAN','IT',75000,'BOMBAY','2023-05-30'),
(2,'MAYA','HR',65000,'BOMBAY','2024-08-07'),
(3,'AAYESHA','FINANCE',15000,'PUNE','2026-05-30'),
(4,'ANI','IT',95000,'HYDERABAD','2012-06-04'),
(5,'RAM','HR',75000,'PUNE','2024-08-12'),
(6,'RAGHAV','IT',55000,'CHENNAI','2023-05-30'),
(7,'KEVAN','SDE',45000,'BOMBAY','2022-03-20'),
(8,'NAINA','SDE',95000,'PUNE','2026-07-10');

INSERT INTO EMPLOYEES
VALUES
(9,'CHAYA','SALES',15000,'DELHI','2021-07-03');

INSERT INTO EMPLOYEES
VALUES
(10,'SAMAY','MARKETING',65000,'SHRINAGAR','2013-07-03');

-- =====================================================
-- FILTERING DATA (Q45 - Q55)
-- =====================================================

-- Q45. Find employees with salary greater than 50,000.

SELECT *
FROM EMPLOYEES
WHERE SALARY > 50000;

-- Q46. Find employees from Pune.

SELECT *
FROM EMPLOYEES
WHERE CITY = 'PUNE';

-- Q47. Find employees not from Mumbai.

SELECT *
FROM EMPLOYEES
WHERE CITY <> 'MUMBAI';

-- Alternative
SELECT *
FROM EMPLOYEES
WHERE CITY NOT IN ('MUMBAI');

-- Q48. Find employees with salary between 30,000 and 60,000.

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 30000 AND 60000;

-- Q49. Find employees working in HR.

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_NAME = 'HR';

-- Q50. Find employees in HR or IT.

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_NAME IN ('HR','IT');

-- Alternative
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_NAME = 'HR'
OR DEPARTMENT_NAME = 'IT';

-- Q51. Find employees with salary less than 40,000.

SELECT *
FROM EMPLOYEES
WHERE SALARY < 40000;

-- Q52. Find employees who joined after 2023.

SELECT *
FROM EMPLOYEES
WHERE JOINING_DATE > '2023-12-31';

-- Q53. Find employees from Pune earning more than 50,000.

SELECT *
FROM EMPLOYEES
WHERE CITY = 'PUNE'
AND SALARY > 50000;

-- Q54. Find employees not working in Sales.

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_NAME <> 'SALES';

-- Alternative
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_NAME NOT IN ('SALES');

-- Q55. Use the LIKE operator to filter records.

-- Employees whose names start with 'A'

SELECT *
FROM EMPLOYEES
WHERE EMP_NAME LIKE 'A%';

-- Employees whose names end with 'A'

SELECT *
FROM EMPLOYEES
WHERE EMP_NAME LIKE '%A';

-- Employees whose names contain 'SH'

SELECT *
FROM EMPLOYEES
WHERE EMP_NAME LIKE '%SH%';
