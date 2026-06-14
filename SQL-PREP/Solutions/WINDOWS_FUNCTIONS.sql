
-- FILE: 11_Window_Functions.sql
-- TOPIC: Window Functions
-- LEVEL: Intermediate to Advanced

USE COMPANY_DB;

-- ========================================================
-- Q120. Rank employees based on salary.
-- Employees with the same salary receive
-- the same rank, and gaps may occur.
-- ========================================================

SELECT EMP_NAME,
SALARY,
RANK() OVER(
ORDER BY SALARY DESC
) AS SALARY_RANK
FROM EMPLOYEES;

-- ========================================================
-- Q121. Assign dense ranks based on salary.
-- Employees with the same salary receive
-- the same rank, but no gaps occur.
-- ========================================================

SELECT EMP_NAME,
SALARY,
DENSE_RANK() OVER(
ORDER BY SALARY DESC
) AS DENSE_SALARY_RANK
FROM EMPLOYEES;

-- ========================================================
-- Q122. Assign row numbers department-wise.
-- ========================================================

SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
ROW_NUMBER() OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY SALARY DESC
) AS DEPARTMENT_ROW_NUMBER
FROM EMPLOYEES;

-- ========================================================
-- Q123. Find the highest-paid employee
-- in each department.
-- ========================================================

SELECT *
FROM
(
SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
ROW_NUMBER() OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY SALARY DESC
) AS RN
FROM EMPLOYEES
) T
WHERE RN = 1;

-- ========================================================
-- Q124. Find the second highest-paid employee
-- in each department.
-- ========================================================

SELECT *
FROM
(
SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
ROW_NUMBER() OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY SALARY DESC
) AS RN
FROM EMPLOYEES
) T
WHERE RN = 2;

-- ========================================================
-- Q125. Calculate the running total of salaries.
-- ========================================================

SELECT EMP_ID,
EMP_NAME,
SALARY,
SUM(SALARY) OVER(
ORDER BY EMP_ID
) AS RUNNING_TOTAL
FROM EMPLOYEES;

-- ========================================================
-- Q126. Calculate department-wise
-- cumulative salary.
-- ========================================================

SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
SUM(SALARY) OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY EMP_ID
) AS DEPARTMENT_RUNNING_TOTAL
FROM EMPLOYEES;

-- ========================================================
-- Q127. Display the previous employee's
-- salary using LAG().
-- ========================================================

SELECT EMP_NAME,
SALARY,
LAG(SALARY) OVER(
ORDER BY EMP_ID
) AS PREVIOUS_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q128. Display the next employee's
-- salary using LEAD().
-- ========================================================

SELECT EMP_NAME,
SALARY,
LEAD(SALARY) OVER(
ORDER BY EMP_ID
) AS NEXT_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q129. Compare each employee's salary
-- with the previous employee's salary.
-- ========================================================

SELECT EMP_NAME,
SALARY,
LAG(SALARY) OVER(
ORDER BY EMP_ID
) AS PREVIOUS_SALARY,
SALARY -
LAG(SALARY) OVER(
ORDER BY EMP_ID
) AS SALARY_DIFFERENCE
FROM EMPLOYEES;
