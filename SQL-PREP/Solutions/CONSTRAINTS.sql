USE COMPANY_DB;
-- FILE: 02_Constraints.sql
-- TOPIC: Constraints and Foreign Keys
-- LEVEL: Beginner to Intermediate


-- =====================================================
-- CONSTRAINTS (Q11 - Q44)
-- =====================================================

-- Q11. Create a STUDENTS table using PRIMARY KEY,
-- NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.

CREATE TABLE STUDENTS(
STUDENT_ID INT PRIMARY KEY,
NAME VARCHAR(20) NOT NULL,
EMAIL VARCHAR(50) UNIQUE,
AGE INT CHECK(AGE >= 18),
CITY VARCHAR(20) DEFAULT 'PUNE'
);

-- Q12. Insert valid records into the STUDENTS table.

INSERT INTO STUDENTS
VALUES
(1,'ARMAN','[A@GMAIL.COM](mailto:A@GMAIL.COM)',22,'AKLUJ'),
(2,'NEHA','[N@GMAIL.COM](mailto:N@GMAIL.COM)',23,'PUNE'),
(3,'MAYA','[M@GMAIL.COM](mailto:M@GMAIL.COM)',21,'MUMBAI');

-- Q13. Try inserting a duplicate email value.

INSERT INTO STUDENTS
VALUES
(4,'RAM','[A@GMAIL.COM](mailto:A@GMAIL.COM)',25,'PUNE');

-- Q14. Try inserting NULL into a NOT NULL column.

INSERT INTO STUDENTS
VALUES
(5,NULL,'[R@GMAIL.COM](mailto:R@GMAIL.COM)',20,'PUNE');

-- Q15. Try inserting an age less than 18.

INSERT INTO STUDENTS
VALUES
(6,'OM','[O@GMAIL.COM](mailto:O@GMAIL.COM)',15,'PUNE');

-- Q16. Insert a record without specifying the city.

INSERT INTO STUDENTS(STUDENT_ID,NAME,EMAIL,AGE)
VALUES(7,'KAVYA','[K@GMAIL.COM](mailto:K@GMAIL.COM)',22);

-- Q17. Add a UNIQUE constraint to a new column.

ALTER TABLE STUDENTS
ADD COLUMN PHONE VARCHAR(15) UNIQUE;

-- Q18. Drop a column having a UNIQUE constraint.

ALTER TABLE STUDENTS
DROP COLUMN PHONE;

-- Q19. Add a CHECK constraint on marks.

ALTER TABLE STUDENTS
ADD COLUMN MARKS INT CHECK(MARKS > 0);

-- Q20. Add a JOINING_DATE column with a default value.

ALTER TABLE STUDENTS
ADD COLUMN JOINING_DATE DATE
DEFAULT '2026-06-14';

-- Q21. Modify a nullable column to NOT NULL.

ALTER TABLE STUDENTS
MODIFY EMAIL VARCHAR(50) NOT NULL;

-- Q22. Display all constraints on the table.

DESC STUDENTS;

-- Q23. Explain the difference between PRIMARY KEY and UNIQUE KEY.

/*
PRIMARY KEY

1. Cannot contain NULL values.
2. Only one per table.
3. Automatically unique.

UNIQUE KEY

1. Prevents duplicate values.
2. Multiple UNIQUE constraints allowed.
3. Can contain NULL values (DB dependent).
   */

-- Q24. Create a SUBJECT table.

CREATE TABLE SUBJECT(
SUBJECT_ID INT PRIMARY KEY,
NAME VARCHAR(20)
);

-- Q25. Create a TEACHER table with a FOREIGN KEY.

CREATE TABLE TEACHER(
TEACHER_ID INT PRIMARY KEY,
NAME VARCHAR(20),
SUBJECT_ID INT,
FOREIGN KEY (SUBJECT_ID)
REFERENCES SUBJECT(SUBJECT_ID)
);

-- Q26. Insert records into the SUBJECT table.

INSERT INTO SUBJECT
VALUES
(1,'MATH'),
(2,'CHEMISTRY'),
(3,'PHYSICS');

-- Q27. Insert records into the TEACHER table.

INSERT INTO TEACHER
VALUES
(1,'SUDHA',1),
(2,'NARAYAN',2);

-- Q28. Try inserting a teacher with a non-existing subject ID.

INSERT INTO TEACHER
VALUES
(3,'RAJ',99);

-- Q29. Display teachers with their subject names.

SELECT T.NAME AS TEACHER_NAME,
S.NAME AS SUBJECT_NAME
FROM TEACHER T
JOIN SUBJECT S
ON T.SUBJECT_ID = S.SUBJECT_ID;

-- Q30. Explain the concept of a FOREIGN KEY.

/*
FOREIGN KEY:
A column that references the PRIMARY KEY
of another table and maintains referential integrity.
*/

-- Q31. Create DEPARTMENT and EMPLOYEE tables using a FOREIGN KEY.

CREATE TABLE DEPARTMENT(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(30)
);

CREATE TABLE EMPLOYEE(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
DEPT_ID INT,
FOREIGN KEY(DEPT_ID)
REFERENCES DEPARTMENT(DEPT_ID)
);

-- Q32. Count employees department-wise.

SELECT DEPT_ID,
COUNT(*) AS EMP_COUNT
FROM EMPLOYEE
GROUP BY DEPT_ID;

-- Q33. Find the department with the maximum employees.

SELECT DEPT_ID,
COUNT(*) AS EMP_COUNT
FROM EMPLOYEE
GROUP BY DEPT_ID
ORDER BY EMP_COUNT DESC
LIMIT 1;

-- Q34. Find records with missing parent references.

SELECT E.*
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D
ON E.DEPT_ID = D.DEPT_ID
WHERE D.DEPT_ID IS NULL;

-- Q35. Delete a parent record referenced by a child table.

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 1;

-- Q36. Create a FOREIGN KEY using ON DELETE CASCADE.

CREATE TABLE EMPLOYEE_CASCADE(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
DEPT_ID INT,
FOREIGN KEY(DEPT_ID)
REFERENCES DEPARTMENT(DEPT_ID)
ON DELETE CASCADE
);

-- Q37. Test ON DELETE CASCADE.

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 1;

-- Q38. Create a FOREIGN KEY using ON DELETE SET NULL.

CREATE TABLE EMPLOYEE_SET_NULL(
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
DEPT_ID INT,
FOREIGN KEY(DEPT_ID)
REFERENCES DEPARTMENT(DEPT_ID)
ON DELETE SET NULL
);

-- Q39. Test ON DELETE SET NULL.

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 2;

-- Q40. Find departments with no employees.

SELECT D.*
FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E
ON D.DEPT_ID = E.DEPT_ID
WHERE E.EMP_ID IS NULL;

-- Q41. Move an employee from one department to another.

UPDATE EMPLOYEE
SET DEPT_ID = 3
WHERE EMP_ID = 101;

-- Q42. Create STUDENT and COURSE tables.

CREATE TABLE STUDENT(
STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME VARCHAR(30)
);

CREATE TABLE COURSE(
COURSE_ID INT PRIMARY KEY,
COURSE_NAME VARCHAR(30)
);

-- Q43. Create an ENROLLMENT table
-- for a many-to-many relationship.

CREATE TABLE ENROLLMENT(
STUDENT_ID INT,
COURSE_ID INT,
PRIMARY KEY(STUDENT_ID, COURSE_ID),


FOREIGN KEY(STUDENT_ID)
REFERENCES STUDENT(STUDENT_ID),

FOREIGN KEY(COURSE_ID)
REFERENCES COURSE(COURSE_ID)


);

-- Q44. Explain many-to-many relationships.

/*
Many-to-Many Relationship

One student can enroll in many courses.
One course can have many students.

This relationship is implemented using
a junction table (ENROLLMENT).
*/
