
-- FILE: 05_String_Functions.sql
-- TOPIC: String Functions
-- LEVEL: Beginner

USE COMPANY_DB;

-- ========================================================
-- Q61. Convert all employee names to uppercase.
-- ========================================================

SELECT UPPER(EMP_NAME) AS EMPLOYEE_NAME
FROM EMPLOYEES;

-- ========================================================
-- Q62. Convert all employee names to lowercase.
-- ========================================================

SELECT LOWER(EMP_NAME) AS EMPLOYEE_NAME
FROM EMPLOYEES;

-- ========================================================
-- Q63. Find the length of each employee name.
-- ========================================================

SELECT EMP_NAME,
LENGTH(EMP_NAME) AS LENGTH_OF_NAME
FROM EMPLOYEES;

-- ========================================================
-- Q64. Display the first 3 characters of each
-- employee name.
-- Note: SQL string positions start from 1.
-- ========================================================

SELECT EMP_NAME,
SUBSTRING(EMP_NAME, 1, 3) AS FIRST_THREE_CHARACTERS
FROM EMPLOYEES;

-- ========================================================
-- Q65. Concatenate employee name and city.
-- ========================================================

SELECT CONCAT(EMP_NAME, ' - ', CITY) AS EMPLOYEE_DETAILS
FROM EMPLOYEES;

-- ========================================================
-- Q66. Replace 'PUNE' with 'PUNE CITY'
-- using UPDATE.
-- ========================================================

UPDATE EMPLOYEES
SET CITY = 'PUNE CITY'
WHERE CITY = 'PUNE';


-- Q66. Display city names after replacing
-- 'PUNE' with 'PUNE CITY' using REPLACE().
-- ========================================================

SELECT EMP_NAME,
REPLACE(CITY, 'PUNE', 'PUNE CITY') AS CITY
FROM EMPLOYEES;

-- ========================================================
-- Q67. Find employees whose names start with 'A'.
-- ========================================================

SELECT *
FROM EMPLOYEES
WHERE EMP_NAME LIKE 'A%';

-- ========================================================
-- Q68. Find employees whose names end with 'A'.
-- ========================================================

SELECT *
FROM EMPLOYEES
WHERE EMP_NAME LIKE '%A';

-- ========================================================
-- Q69. Find employees whose names contain 'SH'.
-- ========================================================

SELECT *
FROM EMPLOYEES
WHERE EMP_NAME LIKE '%SH%';

-- ========================================================
-- Q70. Remove leading and trailing spaces
-- from employee names using TRIM().
-- ========================================================

SELECT TRIM(EMP_NAME) AS CLEAN_NAME
FROM EMPLOYEES;


-- ==================================
-- Q71. Display first 5 characters of employee names
-- using SUBSTRING()
-- ========================================================

SELECT SUBSTRING(EMP_NAME,1,5) AS NAME_PART
FROM EMPLOYEES;

