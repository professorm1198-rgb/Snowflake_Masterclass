
-- =====================================================
-- 1. SET ROLE
-- =====================================================

USE ROLE SYSADMIN;


-- =====================================================
-- 2. CREATE STANDARD VIRTUAL WAREHOUSE
-- =====================================================

CREATE OR REPLACE WAREHOUSE First_WH
WITH
    WAREHOUSE_SIZE = 'X-SMALL'
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 3
    SCALING_POLICY = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    STATEMENT_TIMEOUT_IN_SECONDS = 3600
    COMMENT = 'Analytics Multi-Cluster Warehouse';


-- =====================================================
-- 3. USE WAREHOUSE
-- =====================================================

USE WAREHOUSE First_WH;

SELECT CURRENT_WAREHOUSE();


-- =====================================================
-- 4. CHECK WAREHOUSE DETAILS
-- =====================================================

SHOW WAREHOUSES LIKE 'FIRST_WH';

DESCRIBE WAREHOUSE First_WH;


-- =====================================================
-- 5. VERTICAL SCALING - INCREASE WAREHOUSE SIZE
-- =====================================================

-- Increase warehouse size

ALTER WAREHOUSE First_WH
SET WAREHOUSE_SIZE = 'SMALL';

-- Increase to MEDIUM

ALTER WAREHOUSE First_WH
SET WAREHOUSE_SIZE = 'MEDIUM';

-- Increase to LARGE

ALTER WAREHOUSE First_WH
SET WAREHOUSE_SIZE = 'LARGE';

-- Decrease warehouse size

ALTER WAREHOUSE First_WH
SET WAREHOUSE_SIZE = 'X-SMALL';


-- =====================================================
-- 6. HORIZONTAL SCALING - MULTI-CLUSTER WAREHOUSE
-- =====================================================

ALTER WAREHOUSE First_WH
SET
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 3;

-- Increase maximum clusters

ALTER WAREHOUSE First_WH
SET MAX_CLUSTER_COUNT = 5;


-- =====================================================
-- 7. SCALING POLICY - STANDARD
-- =====================================================

ALTER WAREHOUSE First_WH
SET SCALING_POLICY = 'STANDARD';


-- =====================================================
-- 8. SCALING POLICY - ECONOMY
-- =====================================================

ALTER WAREHOUSE First_WH
SET SCALING_POLICY = 'ECONOMY';


-- Switch back to STANDARD

ALTER WAREHOUSE First_WH
SET SCALING_POLICY = 'STANDARD';


-- =====================================================
-- 9. AUTO SUSPEND
-- =====================================================

ALTER WAREHOUSE First_WH
SET AUTO_SUSPEND = 30;


-- =====================================================
-- 10. AUTO RESUME
-- =====================================================

ALTER WAREHOUSE First_WH
SET AUTO_RESUME = TRUE;


-- =====================================================
-- 11. STATEMENT TIMEOUT
-- =====================================================

ALTER WAREHOUSE First_WH
SET STATEMENT_TIMEOUT_IN_SECONDS = 3600;


-- =====================================================
-- 12. QUEUED STATEMENT TIMEOUT
-- =====================================================

ALTER WAREHOUSE First_WH
SET STATEMENT_QUEUED_TIMEOUT_IN_SECONDS = 300;


-- =====================================================
-- 13. UPDATE COMMENT
-- =====================================================

ALTER WAREHOUSE First_WH
SET COMMENT = 'Snowflake Warehouse Practical Demo';


-- =====================================================
-- 14. SUSPEND WAREHOUSE
-- =====================================================

ALTER WAREHOUSE First_WH SUSPEND;


-- =====================================================
-- 15. RESUME WAREHOUSE
-- =====================================================

ALTER WAREHOUSE First_WH RESUME;


-- =====================================================
-- 16. CHECK FINAL CONFIGURATION
-- =====================================================

SHOW WAREHOUSES LIKE 'FIRST_WH';

DESCRIBE WAREHOUSE First_WH;


-- =====================================================
-- 17. CREATE ADAPTIVE WAREHOUSE
-- =====================================================

CREATE OR REPLACE ADAPTIVE WAREHOUSE ADAPTIVE_WH
WITH
    MAX_QUERY_PERFORMANCE_LEVEL = XLARGE
    QUERY_THROUGHPUT_MULTIPLIER = 4;


-- =====================================================
-- 18. USE ADAPTIVE WAREHOUSE
-- =====================================================

USE WAREHOUSE ADAPTIVE_WH;


-- =====================================================
-- 19. CHECK ADAPTIVE WAREHOUSE
-- =====================================================

SHOW WAREHOUSES LIKE 'ADAPTIVE_WH';

DESCRIBE WAREHOUSE ADAPTIVE_WH;


-- =====================================================
-- 20. ALTER ADAPTIVE WAREHOUSE PARAMETERS
-- =====================================================

ALTER WAREHOUSE ADAPTIVE_WH SET
    MAX_QUERY_PERFORMANCE_LEVEL = XLARGE
    QUERY_THROUGHPUT_MULTIPLIER = 2;


-- =====================================================
-- 21. ENABLE / DISABLE ADAPTIVE WAREHOUSE
-- =====================================================

ALTER WAREHOUSE ADAPTIVE_WH DISABLE;

ALTER WAREHOUSE ADAPTIVE_WH ENABLE;


-- =====================================================
-- 22. SUSPEND ADAPTIVE WAREHOUSE
-- =====================================================

ALTER WAREHOUSE ADAPTIVE_WH SUSPEND;


-- =====================================================
-- 23. RESUME ADAPTIVE WAREHOUSE
-- =====================================================

ALTER WAREHOUSE ADAPTIVE_WH RESUME;


-- =====================================================
-- 24. FINAL WAREHOUSE LIST
-- =====================================================

SHOW WAREHOUSES;
