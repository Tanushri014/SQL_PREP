
-- FILE: 01_Database_and_Tables.sql
-- TOPIC: Database and Table Creation
-- LEVEL: Beginner

-- ========================================================
-- Q1. Create a database named COMPANY_DB.
-- ========================================================

CREATE DATABASE COMPANY_DB;

USE COMPANY_DB;

-- ========================================================
-- Q2. Create an EMPLOYEES table with the following columns:
--     - EMP_ID (Primary Key)
--     - EMP_NAME
--     - DEPARTMENT_NAME
--     - SALARY
--     - CITY
--     - JOINING_DATE
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

-- ========================================================
-- Q3. Insert at least 8 employee records into the table.
-- ========================================================

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
(6,'RAGHAV','FINANCE',55000,'CHENNAI','2023-05-30'),
(7,'KEVAN','SDE',45000,'BOMBAY','2022-03-20'),
(8,'NAINA','SDE',95000,'PUNE','2026-07-10');

-- ========================================================
-- Q4. Display all employee records.
-- ========================================================

SELECT *
FROM EMPLOYEES;

-- ========================================================
-- Q5. Display only employee names.
-- ========================================================

SELECT EMP_NAME
FROM EMPLOYEES;

-- ========================================================
-- Q6. Display employee names and salaries.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q7. Display all unique department names.
-- ========================================================

SELECT DISTINCT DEPARTMENT_NAME
FROM EMPLOYEES;

-- ========================================================
-- Q8. Display all unique city names.
-- ========================================================

SELECT DISTINCT CITY
FROM EMPLOYEES;

-- ========================================================
-- Q9. Display the structure of the EMPLOYEES table.
-- ========================================================

DESC EMPLOYEES;

-- ========================================================
-- Q10. Delete the EMPLOYEES table from the database.
-- ========================================================

DROP TABLE EMPLOYEES;

