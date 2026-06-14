
-- FILE: 12_CTEs.sql
-- TOPIC: Common Table Expressions (CTEs)
-- LEVEL: Intermediate to Advanced


USE COMPANY_DB;

-- ========================================================
-- Q130. Find employees earning above the
-- company average salary using a CTE.
-- ========================================================

WITH AVG_SALARY AS
(
SELECT AVG(SALARY) AS AVG_SALARY_EMP
FROM EMPLOYEES
)
SELECT *
FROM EMPLOYEES
WHERE SALARY >
(
SELECT AVG_SALARY_EMP
FROM AVG_SALARY
);

-- ========================================================
-- Q131. Find the highest-paid employee
-- in each department using a CTE.
-- ========================================================

WITH DEPT_RANK AS
(
SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
ROW_NUMBER() OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY SALARY DESC
) AS RN
FROM EMPLOYEES
)
SELECT *
FROM DEPT_RANK
WHERE RN = 1;

-- ========================================================
-- Q132. Find the second highest-paid employee
-- in each department using a CTE.
-- ========================================================

WITH DEPT_RANK AS
(
SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
ROW_NUMBER() OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY SALARY DESC
) AS RN
FROM EMPLOYEES
)
SELECT *
FROM DEPT_RANK
WHERE RN = 2;

-- ========================================================
-- Q133. Assign department-wise salary ranks
-- using a CTE.
-- ========================================================

WITH DEPT_RANK AS
(
SELECT EMP_NAME,
DEPARTMENT_NAME,
SALARY,
RANK() OVER(
PARTITION BY DEPARTMENT_NAME
ORDER BY SALARY DESC
) AS RANKING
FROM EMPLOYEES
)
SELECT *
FROM DEPT_RANK;

-- ========================================================
-- Q134. Use multiple CTEs to display the
-- average salary and maximum salary
-- department-wise.
-- ========================================================

WITH DEPT_AVG AS
(
SELECT DEPARTMENT_NAME,
AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
),
DEPT_MAX AS
(
SELECT DEPARTMENT_NAME,
MAX(SALARY) AS MAX_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_NAME
)
SELECT A.DEPARTMENT_NAME,
A.AVG_SALARY,
M.MAX_SALARY
FROM DEPT_AVG A
JOIN DEPT_MAX M
ON A.DEPARTMENT_NAME = M.DEPARTMENT_NAME;
