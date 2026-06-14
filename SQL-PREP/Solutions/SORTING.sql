
-- FILE: 04_Sorting.sql
-- TOPIC: Sorting Data using ORDER BY
-- LEVEL: Beginner


USE COMPANY_DB;

-- ========================================================
-- Q56. Sort employees by salary in ascending order.
-- Note: ORDER BY sorts in ascending order by default.
-- ========================================================

SELECT *
FROM EMPLOYEES
ORDER BY SALARY;

-- ========================================================
-- Q57. Sort employees by salary in descending order.
-- ========================================================

SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC;

-- ========================================================
-- Q58. Sort employees alphabetically by employee name.
-- ========================================================

SELECT *
FROM EMPLOYEES
ORDER BY EMP_NAME;

-- ========================================================
-- Q59. Sort employees by department name and then
-- salary within each department.
-- ========================================================

SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT_NAME, SALARY;

-- ========================================================
-- Q60. Display the top 5 highest-paid employees.
-- ========================================================

SELECT *
FROM EMPLOYEES
ORDER BY SALARY DESC
LIMIT 5;
