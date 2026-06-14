
-- FILE: 07_GroupBy_Having.sql
-- TOPIC: GROUP BY and HAVING Clause
-- LEVEL: Beginner to Intermediate

USE COMPANY_DB;

-- ========================================================
-- Q82. Count employees city-wise.
-- ========================================================

SELECT CITY,
COUNT(EMP_ID) AS EMP_PER_CITY
FROM EMPLOYEES
GROUP BY CITY;

-- ========================================================
-- Q83. Find the average salary city-wise.
-- ========================================================

SELECT CITY,
AVG(SALARY) AS AVG_SALARY_PER_CITY
FROM EMPLOYEES
GROUP BY CITY;

-- ========================================================
-- Q84. Find departments whose average salary
-- is greater than 50,000.
-- ========================================================

SELECT DEPARTMENT_NAME,
AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
HAVING AVG(SALARY) > 50000;

-- ========================================================
-- Q85. Find cities having more than 3 employees.
-- ========================================================

SELECT CITY,
COUNT(EMP_ID) AS EMP_PER_CITY
FROM EMPLOYEES
GROUP BY CITY
HAVING COUNT(EMP_ID) > 3;

-- ========================================================
-- Q86. Find the department with the maximum
-- number of employees.
-- ========================================================

SELECT DEPARTMENT_NAME,
COUNT(EMP_ID) AS EMP_PER_DEPARTMENT
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
ORDER BY EMP_PER_DEPARTMENT DESC
LIMIT 1;

-- Note:
-- If multiple departments have the same maximum
-- employee count, LIMIT 1 returns only one of them.

-- ========================================================
-- Q87. Find the total salary paid department-wise.
-- ========================================================

SELECT DEPARTMENT_NAME,
SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;

-- ========================================================
-- Q88. Find the total salary paid city-wise.
-- ========================================================

SELECT CITY,
SUM(SALARY) AS TOTAL_SALARY_CITY_WISE
FROM EMPLOYEES
GROUP BY CITY;

-- ========================================================
-- Q89. Find departments whose total salary
-- exceeds 100,000.
-- ========================================================

SELECT DEPARTMENT_NAME,
SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
HAVING SUM(SALARY) > 100000;

-- ========================================================
-- Q90. Find cities where the average salary
-- is greater than 40,000.
-- ========================================================

SELECT CITY,
AVG(SALARY) AS AVG_SALARY_CITY_WISE
FROM EMPLOYEES
GROUP BY CITY
HAVING AVG(SALARY) > 40000;

-- ========================================================
-- Q91. Find the employee count department-wise.
-- ========================================================

SELECT DEPARTMENT_NAME,
COUNT(EMP_ID) AS TOTAL_EMPLOYEES
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;
