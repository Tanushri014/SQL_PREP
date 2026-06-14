

-- FILE: 08_Subqueries.sql
-- TOPIC: Subqueries
-- LEVEL: Intermediate


USE COMPANY_DB;

-- ========================================================
-- Q92. Find employee(s) earning the highest salary.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES
WHERE SALARY =
(
SELECT MAX(SALARY)
FROM EMPLOYEES
);

-- ========================================================
-- Q93. Find employee(s) earning the second
-- highest salary.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES
WHERE SALARY =
(
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY <
(
SELECT MAX(SALARY)
FROM EMPLOYEES
)
);

-- ========================================================
-- Q94. Find employee(s) earning the lowest salary.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES
WHERE SALARY =
(
SELECT MIN(SALARY)
FROM EMPLOYEES
);

-- ========================================================
-- Q95. Find employees earning above the
-- average salary.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES
WHERE SALARY >
(
SELECT AVG(SALARY)
FROM EMPLOYEES
);

-- ========================================================
-- Q96. Find employees earning below the
-- average salary.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES
WHERE SALARY <
(
SELECT AVG(SALARY)
FROM EMPLOYEES
);

-- ========================================================
-- Q97. Find employees working in the same
-- department as RAM.
-- ========================================================

SELECT EMP_NAME,
DEPARTMENT_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_NAME =
(
SELECT DEPARTMENT_NAME
FROM EMPLOYEES
WHERE EMP_NAME = 'RAM'
);
-- ========================================================
-- Q98. Find the city having the maximum
-- number of employees.
-- ========================================================

SELECT CITY,
COUNT(*) AS EMP_COUNT
FROM EMPLOYEES
GROUP BY CITY
ORDER BY EMP_COUNT DESC
LIMIT 1;


-- ========================================================
-- Q99. Find employees whose salary is greater
-- than all HR employees.
-- ========================================================

SELECT EMP_NAME,
SALARY
FROM EMPLOYEES
WHERE SALARY >
(
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_NAME = 'HR'
);

-- ========================================================
-- Q100. Find the department having the highest
-- average salary.
-- ========================================================

SELECT *
FROM
(
SELECT DEPARTMENT_NAME,
AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
) AS DEPT_AVG
ORDER BY AVG_SALARY DESC
LIMIT 1;

