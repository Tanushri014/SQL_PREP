
-- FILE: 16_Triggers.sql
-- TOPIC: Triggers
-- LEVEL: Advanced


USE COMPANY_DB;

-- ========================================================
-- Q167. Create a LOG table to store
-- trigger activity.
-- ========================================================

CREATE TABLE LOG
(
LOG_ID INT AUTO_INCREMENT PRIMARY KEY,
MESSAGE VARCHAR(100),
LOG_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- Q168. Create an AFTER INSERT trigger
-- to log employee insert operations.
-- ========================================================

DELIMITER //

CREATE TRIGGER AFTER_INSERT_TRIGGER
AFTER INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN

INSERT INTO LOG(MESSAGE)
VALUES('Employee Added');

END //

DELIMITER ;

-- ========================================================
-- Q169. Insert a new employee and verify
-- that the AFTER INSERT trigger works.
-- ========================================================

INSERT INTO EMPLOYEES
VALUES
(
12,
'RAHUL',
'IT',
50000,
'PUNE',
'2025-01-01'
);

SELECT *
FROM LOG;

-- ========================================================
-- Q170. Create a BEFORE INSERT trigger
-- to log insert attempts.
-- ========================================================

DELIMITER //

CREATE TRIGGER BEFORE_INSERT_TRIGGER
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN

INSERT INTO LOG(MESSAGE)
VALUES('Insert Operation Started');


END //

DELIMITER ;

-- ========================================================
-- Q171. Create a trigger to prevent
-- negative salary values.
-- ========================================================

DELIMITER //

CREATE TRIGGER CHECK_SALARY
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN

IF NEW.SALARY < 0 THEN

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Salary Cannot Be Negative';

END IF;


END //

DELIMITER ;

-- ========================================================
-- Q172. Test the negative salary trigger.
-- ========================================================

INSERT INTO EMPLOYEES
VALUES
(
20,
'NUSHI',
'HR',
-5000,
'MUMBAI',
'2025-01-01'
);

-- ========================================================
-- Q173. Create an AFTER UPDATE trigger
-- to track employee updates.
-- ========================================================

DELIMITER //

CREATE TRIGGER AFTER_UPDATE_TRIGGER
AFTER UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN


INSERT INTO LOG(MESSAGE)
VALUES('Employee Record Updated');


END //

DELIMITER ;

-- ========================================================
-- Q174. Create a SALARY_AUDIT table.
-- ========================================================

CREATE TABLE SALARY_AUDIT
(
EMP_ID INT,
OLD_SALARY DECIMAL(10,2),
NEW_SALARY DECIMAL(10,2),
CHANGE_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- Q175. Create a trigger to audit
-- salary changes.
-- ========================================================

DELIMITER //

CREATE TRIGGER SALARY_AUDIT_TRIGGER
AFTER UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN


IF OLD.SALARY <> NEW.SALARY THEN

    INSERT INTO SALARY_AUDIT
    (
        EMP_ID,
        OLD_SALARY,
        NEW_SALARY
    )
    VALUES
    (
        OLD.EMP_ID,
        OLD.SALARY,
        NEW.SALARY
    );

END IF;


END //

DELIMITER ;

-- ========================================================
-- Q176. Create a BEFORE DELETE trigger
-- to log employee deletions.
-- ========================================================

DELIMITER //

CREATE TRIGGER BEFORE_DELETE_TRIGGER
BEFORE DELETE ON EMPLOYEES
FOR EACH ROW
BEGIN


INSERT INTO LOG(MESSAGE)
VALUES('Employee Deleted');

END //

DELIMITER ;

-- ========================================================
-- Q177. Create a table to store deleted
-- employee records.
-- ========================================================

CREATE TABLE DELETED_EMPLOYEES
(
EMP_ID INT,
EMP_NAME VARCHAR(50),
SALARY DECIMAL(10,2),
DELETE_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ========================================================
-- Q178. Create a trigger to audit
-- deleted employee records.
-- ========================================================

DELIMITER //

CREATE TRIGGER EMP_DELETE_AUDIT
BEFORE DELETE ON EMPLOYEES
FOR EACH ROW
BEGIN


INSERT INTO DELETED_EMPLOYEES
(
    EMP_ID,
    EMP_NAME,
    SALARY
)
VALUES
(
    OLD.EMP_ID,
    OLD.EMP_NAME,
    OLD.SALARY
);


END //

DELIMITER ;

-- ========================================================
-- Q179. Delete an employee and verify
-- the delete audit trigger.
-- ========================================================

DELETE FROM EMPLOYEES
WHERE EMP_ID = 12;

SELECT *
FROM DELETED_EMPLOYEES;

-- ========================================================
-- Q180. Display all trigger-generated logs.
-- ========================================================

SELECT *
FROM LOG;
