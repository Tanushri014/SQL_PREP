
-- FILE: 15_Stored_Procedures.sql
-- TOPIC: Stored Procedures
-- LEVEL: Advanced


USE COMPANY_DB;

-- ========================================================
-- Q157. Create a stored procedure to display
-- all employee records.
-- ========================================================

DELIMITER //

CREATE PROCEDURE GET_ALL_EMP()
BEGIN
SELECT *
FROM EMPLOYEES;
END //

DELIMITER ;

-- ========================================================
-- Q158. Execute the GET_ALL_EMP procedure.
-- ========================================================

CALL GET_ALL_EMP();

-- ========================================================
-- Q159. Create a procedure to fetch an
-- employee by ID.
-- ========================================================

DELIMITER //

CREATE PROCEDURE GET_EMP_BY_ID(IN P_ID INT)
BEGIN
SELECT *
FROM EMPLOYEES
WHERE EMP_ID = P_ID;
END //

DELIMITER ;

CALL GET_EMP_BY_ID(2);

-- ========================================================
-- Q160. Create a procedure to fetch employees
-- based on salary.
-- ========================================================

DELIMITER //

CREATE PROCEDURE GET_EMP_BY_SALARY(IN P_SAL DECIMAL(10,2))
BEGIN
SELECT *
FROM EMPLOYEES
WHERE SALARY = P_SAL;
END //

DELIMITER ;

CALL GET_EMP_BY_SALARY(650000);

-- ========================================================
-- Q161. Create a procedure that returns
-- the total employee count.
-- ========================================================

DELIMITER //

CREATE PROCEDURE GET_TOTAL_EMP_COUNT(OUT TOTAL_COUNT INT)
BEGIN
SELECT COUNT(*)
INTO TOTAL_COUNT
FROM EMPLOYEES;
END //

DELIMITER ;

SET @TOTAL_COUNT = 0;

CALL GET_TOTAL_EMP_COUNT(@TOTAL_COUNT);

SELECT @TOTAL_COUNT;

-- ========================================================
-- Q162. Create a procedure to insert
-- a new employee record.
-- ========================================================

DELIMITER //

CREATE PROCEDURE INSERT_EMP
(
IN P_ID INT,
IN P_NAME VARCHAR(20),
IN P_DEPT_NAME VARCHAR(20),
IN P_SAL INT,
IN P_CITY VARCHAR(20),
IN P_J_DATE DATE
)
BEGIN
INSERT INTO EMPLOYEES
VALUES
(
P_ID,
P_NAME,
P_DEPT_NAME,
P_SAL,
P_CITY,
P_J_DATE
);
END //

DELIMITER ;

CALL INSERT_EMP
(
11,
'NUSHI',
'SDE',
100000,
'BOMBAY',
'2027-04-12'
);

-- ========================================================
-- Q163. Create a procedure to update
-- employee salary.
-- ========================================================

DELIMITER //

CREATE PROCEDURE UPDATE_SALARY
(
IN P_ID INT,
IN P_SALARY INT
)
BEGIN
UPDATE EMPLOYEES
SET SALARY = P_SALARY
WHERE EMP_ID = P_ID;
END //

DELIMITER ;

CALL UPDATE_SALARY(3,650000);

-- ========================================================
-- Q164. Create a procedure to delete
-- an employee record.
-- ========================================================

DELIMITER //

CREATE PROCEDURE DELETE_EMP(IN P_ID INT)
BEGIN
DELETE FROM EMPLOYEES
WHERE EMP_ID = P_ID;
END //

DELIMITER ;

CALL DELETE_EMP(2);

-- ========================================================
-- Q165. Create a procedure using an
-- IF condition to check whether an
-- employee exists.
-- ========================================================

DELIMITER //

CREATE PROCEDURE CHECK_EMP(IN P_ID INT)
BEGIN


IF EXISTS
(
    SELECT *
    FROM EMPLOYEES
    WHERE EMP_ID = P_ID
)
THEN
    SELECT 'Employee Found' AS MESSAGE;
ELSE
    SELECT 'Employee Not Found' AS MESSAGE;
END IF;


END //

DELIMITER ;

CALL CHECK_EMP(1);

-- ========================================================
-- Q166. Difference between Procedure
-- and Function.
-- ========================================================

/*

## PROCEDURE

1. Called using CALL statement.
2. Can return multiple values.
3. Supports IN, OUT, INOUT parameters.
4. Can perform INSERT, UPDATE, DELETE.
5. Cannot be used directly inside SELECT.
6. Mainly used for business logic.

## FUNCTION

1. Called inside SQL statements.
2. Returns a single value.
3. Usually accepts only input parameters.
4. Primarily used for calculations.
5. Can be used directly in SELECT queries.
6. Must return a value.

Example:

SELECT FUNCTION_NAME();

CALL PROCEDURE_NAME();

*/
