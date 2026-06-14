
-- FILE: 14_Indexes.sql
-- TOPIC: Indexes
-- LEVEL: Intermediate


USE COMPANY_DB;

-- ========================================================
-- Q147. Create an index on the employee name column.
-- ========================================================

CREATE INDEX EMP_IDX
ON EMPLOYEES(EMP_NAME);

-- ========================================================
-- Q148. Create a composite index on
-- department name and employee name.
-- ========================================================

CREATE INDEX EMP_COMP_IDX
ON EMPLOYEES(DEPARTMENT_NAME, EMP_NAME);

-- Note:
-- A composite index is created on two or more
-- columns to improve query performance.

-- ========================================================
-- Q149. Display all indexes created on
-- the EMPLOYEES table.
-- ========================================================

SHOW INDEX FROM EMPLOYEES;

-- ========================================================
-- Q150. Drop the composite index.
-- ========================================================

ALTER TABLE EMPLOYEES
DROP INDEX EMP_COMP_IDX;

-- ========================================================
-- Q151. When should indexes be used?
-- ========================================================

/*
Use Indexes When:

1. Columns are frequently searched using WHERE.
2. Columns are frequently used in JOIN conditions.
3. Columns are used in ORDER BY clauses.
4. Columns are used in GROUP BY clauses.
5. Tables contain a large amount of data.
   */

-- ========================================================
-- Q152. When should indexes be avoided?
-- ========================================================

/*
Avoid Indexes When:

1. The table is very small.
2. Column values change frequently.
3. Columns have very few unique values.
4. Write operations are more frequent than reads.
   */

-- ========================================================
-- Q153. Explain the difference between
-- Clustered and Non-Clustered Indexes.
-- ========================================================

/*
CLUSTERED INDEX
---------------

1. Stores data physically in sorted order.
2. Only one clustered index per table.
3. Faster for range-based searches.
4. Usually associated with the Primary Key.

## NON-CLUSTERED INDEX

1. Stores pointers to actual data rows.
2. Multiple non-clustered indexes allowed.
3. Faster for exact lookups.
4. Created separately from table data.
   */

-- ========================================================
-- Q154. Create an index on the EMAIL column.
-- ========================================================

-- Note:
-- This query works only if the EMAIL column
-- exists in the EMPLOYEES table.

CREATE INDEX EMAIL_IDX
ON EMPLOYEES(EMAIL);

-- ========================================================
-- Q155. Check query performance before
-- and after indexing.
-- ========================================================

/*
Use EXPLAIN to analyze query performance.

Example:

EXPLAIN
SELECT *
FROM EMPLOYEES
WHERE EMP_NAME = 'RAM';

Compare the execution plan before and
after creating an index.
*/

-- ========================================================
-- Q156. What happens if too many indexes
-- are created?
-- ========================================================

/*
Problems Caused by Excessive Indexing:

1. Increased storage requirements.
2. Slower INSERT operations.
3. Slower UPDATE operations.
4. Slower DELETE operations.
5. Higher index maintenance overhead.
6. Longer database optimization time.
   */
