-- =====================================================
-- 1. CREATE DATABASE
-- =====================================================

CREATE DATABASE IF NOT EXISTS ABC_BANK_DB;

-- =====================================================
-- 2. CREATE SCHEMA
-- =====================================================

CREATE SCHEMA IF NOT EXISTS ABC_BANK_DB.abc_bank_schema;

-- =====================================================
-- 3. CREATE TRANSIENT TABLE, INSERT DATA & SELECT
-- =====================================================

CREATE OR REPLACE TRANSIENT TABLE CUSTOMER (
    CUSTOMER_ID INT,
    CUSTOMER_NAME VARCHAR(50),
    CITY VARCHAR(50)
);

INSERT INTO CUSTOMER VALUES
(1, 'John', 'London'),
(2, 'Emma', 'New York'),
(3, 'David', 'Toronto');

SELECT *
FROM CUSTOMER;


-- =====================================================
-- 4. CREATE VIEW & SELECT DATA
-- =====================================================

CREATE OR REPLACE VIEW CUSTOMER_VIEW AS
SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME
FROM CUSTOMER;

SELECT *
FROM CUSTOMER_VIEW;


-- =====================================================
-- 5. INFORMATION SCHEMA - SCHEMAS
-- =====================================================

SELECT SCHEMA_NAME
FROM ABC_BANK_DB.INFORMATION_SCHEMA.SCHEMATA;


-- =====================================================
-- 6. INFORMATION SCHEMA - TABLES
-- =====================================================

SELECT
    TABLE_NAME,
    TABLE_TYPE
FROM ABC_BANK_DB.INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'ABC_BANK_SCHEMA';


-- =====================================================
-- 7. INFORMATION SCHEMA - VIEWS
-- =====================================================

SELECT TABLE_NAME AS VIEW_NAME
FROM ABC_BANK_DB.INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'ABC_BANK_SCHEMA';


-- =====================================================
-- 8. INFORMATION SCHEMA - COLUMNS
-- =====================================================

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    ORDINAL_POSITION
FROM ABC_BANK_DB.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ABC_BANK_SCHEMA'
  AND TABLE_NAME = 'CUSTOMER'
ORDER BY ORDINAL_POSITION;


-- =====================================================
-- 9. EXPLORE SNOWFLAKE SYSTEM DATABASE
-- =====================================================

-- View database information
SELECT
    DATABASE_NAME,       -- Name of the database
    DATABASE_OWNER,      -- Role that owns the database
    CREATED,              -- Database creation date
    DELETED,              -- Database deletion date; NULL means active
    COMMENT               -- Description of the database
FROM SNOWFLAKE.ACCOUNT_USAGE.DATABASES
ORDER BY CREATED DESC
LIMIT 10;


-- View recent query history
SELECT
    QUERY_TEXT,            -- SQL statement that was executed
    USER_NAME,             -- User who executed the query
    DATABASE_NAME,         -- Database used by the query
    SCHEMA_NAME,            -- Schema used by the query
    START_TIME,             -- Query start date and time
    EXECUTION_STATUS,       -- Query execution status
    TOTAL_ELAPSED_TIME      -- Total execution time in milliseconds
FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
ORDER BY START_TIME DESC
LIMIT 10;


-- =====================================================
-- 10. EXPLORE SNOWFLAKE.INFORMATION_SCHEMA
-- =====================================================

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM SNOWFLAKE.INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_SCHEMA, TABLE_NAME
LIMIT 10;


-- =====================================================
-- 11. EXPLORE SNOWFLAKE SAMPLE DATABASE
-- =====================================================

-- Show schemas in the sample database
SHOW SCHEMAS IN DATABASE SNOWFLAKE_SAMPLE_DATA;

-- View sample customer data
SELECT *
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
LIMIT 10;
