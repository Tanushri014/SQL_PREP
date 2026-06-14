
-- FILE: 09_Joins.sql
-- TOPIC: SQL Joins
-- LEVEL: Intermediate


USE COMPANY_DB;

-- ========================================================
-- Q101. Create the DEPARTMENTS table.
-- ========================================================

CREATE TABLE DEPARTMENTS
(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(20)
);

-- ========================================================
-- Q102. Insert department records.
-- ========================================================

INSERT INTO DEPARTMENTS
(DEPT_ID, DEPT_NAME)
VALUES
(1,'HR'),
(2,'IT'),
(3,'SALES'),
(4,'FINANCE'),
(5,'MARKETING'),
(6,'SDE');

-- ========================================================
-- Q102. Perform an INNER JOIN between
-- EMPLOYEES and DEPARTMENTS.
-- ========================================================

SELECT E.EMP_NAME,
D.DEPT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;

-- ========================================================
-- Q103. Perform a LEFT JOIN between
-- EMPLOYEES and DEPARTMENTS.
-- ========================================================

SELECT E.*,
D.DEPT_ID
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;

-- ========================================================
-- Q104. Perform a RIGHT JOIN between
-- EMPLOYEES and DEPARTMENTS.
-- ========================================================

SELECT E.EMP_NAME,
D.DEPT_NAME
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;

-- ========================================================
-- Q105. Perform a FULL OUTER JOIN.
-- Note: MySQL does not directly support
-- FULL OUTER JOIN, so UNION is used.
-- ========================================================

SELECT E.EMP_ID,
E.EMP_NAME,
E.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME

UNION

SELECT E.EMP_ID,
E.EMP_NAME,
E.DEPARTMENT_NAME
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;

-- ========================================================
-- Q106. Display employee names along with
-- their department names.
-- ========================================================

SELECT E.EMP_NAME,
D.DEPT_NAME
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;

-- ========================================================
-- Q107. Find employees whose department
-- does not exist in the DEPARTMENTS table.
-- ========================================================

SELECT E.*
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME
WHERE D.DEPT_ID IS NULL;

-- Note:
-- Use IS NULL instead of = NULL.

-- ========================================================
-- Q108. Count employees department-wise
-- using JOIN.
-- ========================================================

SELECT D.DEPT_NAME,
COUNT(E.EMP_ID) AS EMP_COUNT
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPT_NAME = E.DEPARTMENT_NAME
GROUP BY D.DEPT_NAME;

-- ========================================================
-- Q109. Find the highest salary in each
-- department using JOIN.
-- ========================================================

SELECT D.DEPT_NAME,
MAX(E.SALARY) AS MAX_SALARY
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPT_NAME = E.DEPARTMENT_NAME
GROUP BY D.DEPT_NAME;

-- ========================================================
-- Q110. Find departments having no employees.
-- ========================================================

SELECT D.DEPT_NAME
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPT_NAME = E.DEPARTMENT_NAME
WHERE E.EMP_ID IS NULL;

-- ========================================================
-- Q111. Find the total salary paid in
-- each department.
-- ========================================================

SELECT D.DEPT_NAME,
SUM(E.SALARY) AS TOTAL_SALARY
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPT_NAME = E.DEPARTMENT_NAME
GROUP BY D.DEPT_NAME;


-- Q112. Explain different types of joins

/*
JOINS are used to combine data from two or more tables
based on a related column.

1. INNER JOIN
--------------
Returns only matching records from both tables.

SELECT *
FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;


2. LEFT JOIN (LEFT OUTER JOIN)
------------------------------
Returns all records from the left table and matching
records from the right table.
Non-matching rows from the right table return NULL.

SELECT *
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;


3. RIGHT JOIN (RIGHT OUTER JOIN)
--------------------------------
Returns all records from the right table and matching
records from the left table.
Non-matching rows from the left table return NULL.

SELECT *
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;


4. FULL JOIN (FULL OUTER JOIN)
------------------------------
Returns all matching and non-matching records
from both tables.

MySQL does not support FULL JOIN directly.

SELECT *
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME

UNION

SELECT *
FROM EMPLOYEES E
RIGHT JOIN DEPARTMENTS D
ON E.DEPARTMENT_NAME = D.DEPT_NAME;


5. SELF JOIN
------------
A table is joined with itself.

SELECT E.EMP_NAME AS EMPLOYEE,
       M.EMP_NAME AS MANAGER
FROM MANAGER_EMPLOYEE E
JOIN MANAGER_EMPLOYEE M
ON E.MANAGER_ID = M.EMP_ID;


6. CROSS JOIN
-------------
Returns the Cartesian Product of both tables.
Every row of the first table combines with
every row of the second table.

SELECT *
FROM EMPLOYEES
CROSS JOIN DEPARTMENTS;


Summary
-------
INNER JOIN  -> Matching records only
LEFT JOIN   -> All left + matching right
RIGHT JOIN  -> All right + matching left
FULL JOIN   -> All records from both tables
SELF JOIN   -> Table joined with itself
CROSS JOIN  -> Every possible combination
*/