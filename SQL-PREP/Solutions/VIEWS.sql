
-- FILE: 13_Views.sql
-- TOPIC: Views
-- LEVEL: Intermediate


USE COMPANY_DB;

-- ========================================================
-- Q135. Create a view showing employees
-- whose salary is greater than 50,000.
-- ========================================================

CREATE VIEW SALARY_GREATER_THAN_50000 AS
SELECT *
FROM EMPLOYEES
WHERE SALARY > 50000;

-- ========================================================
-- Q136. Display records from the
-- SALARY_GREATER_THAN_50000 view.
-- ========================================================

SELECT *
FROM SALARY_GREATER_THAN_50000;

-- ========================================================
-- Q137. Create a department-wise salary
-- summary view.
-- ========================================================

CREATE VIEW DEPARTMENT_WISE_SALARY AS
SELECT DEPARTMENT_NAME,
COUNT(*) AS TOTAL_EMPLOYEES,
AVG(SALARY) AS AVG_SALARY,
SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME;

-- ========================================================
-- Q138. Create a simple employee view
-- containing employee id, name and salary.
-- ========================================================

CREATE VIEW EMP_VIEW AS
SELECT EMP_ID,
EMP_NAME,
SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q139. Update employee salary through
-- a simple view.
-- ========================================================

UPDATE EMP_VIEW
SET SALARY = 80000
WHERE EMP_ID = 2;

-- ========================================================
-- Q140. Drop a view.
-- ========================================================

DROP VIEW EMP_VIEW;

-- ========================================================
-- Q141. Create a view containing only
-- HR department employees.
-- ========================================================

CREATE VIEW HR_EMP AS
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_NAME = 'HR';

-- ========================================================
-- Q142. Display all records from
-- the HR employee view.
-- ========================================================

SELECT *
FROM HR_EMP;

-- ========================================================
-- Q143. Create a view showing the
-- highest salary in the company.
-- ========================================================

CREATE VIEW HIGHEST_SALARY AS
SELECT MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES;

-- ========================================================
-- Q144. Create a view using a LEFT JOIN.
-- ========================================================

CREATE VIEW LEFT_JOIN_VIEW AS
SELECT D.DEPT_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPT_NAME = E.DEPARTMENT_NAME;


SELECT *
FROM LEFT_JOIN_VIEW;

-- ========================================================
-- Q145. Create a view using multiple tables.
-- Display employee and department details.
-- ========================================================

CREATE VIEW EMPLOYEE_DETAILS AS
SELECT E.EMP_ID,
E.EMP_NAME,
D.DEPT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;


-- 146
-- ========================================================
-- NOTES: Difference Between TABLE and VIEW
-- ========================================================

/*
TABLE
-----

1. Stores data physically.
2. Occupies storage space.
3. Contains actual records.
4. Supports INSERT, UPDATE, DELETE operations.
5. Exists permanently until dropped.

## VIEW

1. Virtual table based on a query.
2. Stores only the query definition.
3. Does not store data separately.
4. Used for security and abstraction.
5. Data is fetched from underlying tables.
   */
