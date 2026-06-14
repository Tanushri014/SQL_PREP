
-- FILE: 06_Aggregate_Functions.sql
-- TOPIC: Aggregate Functions
-- LEVEL: Beginner


USE COMPANY_DB;

-- ========================================================
-- Q72. Find the total salary paid to all employees.
-- ========================================================

SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q73. Find the average salary of all employees.
-- ========================================================

SELECT AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q74. Find the highest salary in the company.
-- ========================================================

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q75. Find the lowest salary in the company.
-- ========================================================

SELECT MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q76. Count the total number of employees.
-- ========================================================

SELECT COUNT(EMP_ID) AS TOTAL_EMP_COUNT
FROM EMPLOYEES;

-- ========================================================
-- Q77. Count employees in each department.
-- ========================================================

SELECT DEPARTMENT_NAME,
COUNT(EMP_ID) AS TOTAL_EMP_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;

-- ========================================================
-- Q78. Find the average salary for each department.
-- ========================================================

SELECT DEPARTMENT_NAME,
AVG(SALARY) AS AVG_SALARY_PER_DEPARTMENT
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;

-- ========================================================
-- Q79. Find the highest salary in each department.
-- ========================================================

SELECT DEPARTMENT_NAME,
MAX(SALARY) AS MAX_SALARY_PER_DEPARTMENT
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;

-- ========================================================
-- Q80. Find the lowest salary in each department.
-- ========================================================

SELECT DEPARTMENT_NAME,
MIN(SALARY) AS MIN_SALARY_PER_DEPARTMENT
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;

-- ========================================================
-- Q81. Find departments having more than
-- 2 employees.
-- ========================================================

SELECT DEPARTMENT_NAME,
COUNT(EMP_ID) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
HAVING COUNT(EMP_ID) > 2;
