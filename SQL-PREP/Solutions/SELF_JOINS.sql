
-- FILE: 10_Self_Joins.sql
-- TOPIC: Self Joins
-- LEVEL: Intermediate

USE COMPANY_DB;

-- ========================================================
-- Q113. Create the MANAGER_EMPLOYEE table.
-- ========================================================

CREATE TABLE MANAGER_EMPLOYEE
(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
MANAGER_ID INT
);


INSERT INTO MANAGER_EMPLOYEE
VALUES
(1,'NAYAN',NULL),
(2,'RAM',1),
(3,'MAYA',1),
(4,'ANI',2),
(5,'NAINA',2),
(6,'RAGHAV',1);

-- ========================================================
-- Q114. Display employee names along with
-- their manager names.
-- ========================================================

SELECT E.EMP_NAME AS EMPLOYEE,
M.EMP_NAME AS MANAGER
FROM MANAGER_EMPLOYEE E
JOIN MANAGER_EMPLOYEE M
ON E.MANAGER_ID = M.EMP_ID;

-- ========================================================
-- Q115. Find employees who do not have
-- a manager.
-- ========================================================

SELECT *
FROM MANAGER_EMPLOYEE
WHERE MANAGER_ID IS NULL;

-- ========================================================
-- Q116. Find managers who supervise
-- more than 2 employees.
-- ========================================================

SELECT M.EMP_NAME AS MANAGER,
COUNT(*) AS EMPLOYEE_COUNT
FROM MANAGER_EMPLOYEE E
JOIN MANAGER_EMPLOYEE M
ON E.MANAGER_ID = M.EMP_ID
GROUP BY M.EMP_NAME
HAVING COUNT(*) > 2;

-- ========================================================
-- Q117. Display all employee-manager pairs.
-- ========================================================

SELECT E.EMP_NAME AS EMPLOYEE,
M.EMP_NAME AS MANAGER
FROM MANAGER_EMPLOYEE E
JOIN MANAGER_EMPLOYEE M
ON E.MANAGER_ID = M.EMP_ID;

-- ========================================================
-- Q118. Display the organizational hierarchy.
-- Include employees even if they do not
-- have a manager.
-- ========================================================

SELECT E.EMP_NAME AS EMPLOYEE,
M.EMP_NAME AS MANAGER
FROM MANAGER_EMPLOYEE E
LEFT JOIN MANAGER_EMPLOYEE M
ON E.MANAGER_ID = M.EMP_ID;


-- Q 119 SAME ANSWER AS Q 117