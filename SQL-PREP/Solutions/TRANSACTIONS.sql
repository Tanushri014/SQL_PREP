
-- FILE: 17_Transactions.sql
-- TOPIC: Transactions
-- LEVEL: Advanced


USE COMPANY_DB;

-- ========================================================
-- Q181. Create an ACCOUNTS table.
-- ========================================================

CREATE TABLE ACCOUNTS
(
ACC_NO INT PRIMARY KEY,
HOLDER_NAME VARCHAR(50),
BALANCE DECIMAL(10,2)
);

-- ========================================================
-- Q182. Insert sample account records.
-- ========================================================

INSERT INTO ACCOUNTS
VALUES
(101, 'Tanushri', 50000),
(102, 'Rahul', 30000);

-- ========================================================
-- Q183. Transfer money from one account
-- to another using a transaction.
-- ========================================================

START TRANSACTION;

UPDATE ACCOUNTS
SET BALANCE = BALANCE - 5000
WHERE ACC_NO = 101;

UPDATE ACCOUNTS
SET BALANCE = BALANCE + 5000
WHERE ACC_NO = 102;

-- ========================================================
-- Q184. Commit the transaction.
-- ========================================================

COMMIT;

-- ========================================================
-- Q185. Demonstrate ROLLBACK.
-- ========================================================

START TRANSACTION;

UPDATE ACCOUNTS
SET BALANCE = BALANCE - 2000
WHERE ACC_NO = 101;

ROLLBACK;

-- ========================================================
-- Q186. Create a SAVEPOINT inside
-- a transaction.
-- ========================================================

START TRANSACTION;

UPDATE ACCOUNTS
SET BALANCE = BALANCE - 1000
WHERE ACC_NO = 101;

SAVEPOINT SP1;

-- ========================================================
-- Q187. Roll back to a SAVEPOINT.
-- ========================================================

ROLLBACK TO SP1;

COMMIT;

-- ========================================================
-- Q188. Simulate a failed transaction.
-- ========================================================

START TRANSACTION;

UPDATE ACCOUNTS
SET BALANCE = BALANCE - 10000
WHERE ACC_NO = 101;

UPDATE UNKNOWN_TABLE
SET VALUE = 10;

ROLLBACK;

-- ========================================================
-- Q189. Display all account details after
-- transaction operations.
-- ========================================================

SELECT *
FROM ACCOUNTS;

-- ========================================================
-- Q190. Explain ACID properties.
-- ========================================================

/*

# ACID PROPERTIES OF TRANSACTIONS
Q191. What is Atomicity? Explain with an example.
## A - Atomicity

A transaction is treated as a single unit.
Either all operations succeed or none do.

Example:
Money is deducted from Account A and added
to Account B. If one operation fails,
the entire transaction is rolled back.

---
Q192. What is Consistency? Explain with an example.
## C - Consistency

A transaction must move the database from
one valid state to another valid state.

Example:
If total bank balance before a transfer is
80,000, it should remain 80,000 after the
transfer.

---

## I - Isolation
Q193. What is ISOLATION? Explain with an example.
Multiple transactions should not interfere
with each other while executing.

Example:
Two users updating the same account should
not see incomplete changes made by the
other transaction.

---

## D - Durability
Q194. What is DURABILITY? Explain with an example.
Once a transaction is committed,
the changes are permanently saved.

Example:
Even if the database server crashes after
COMMIT, the committed data remains stored.

*/
