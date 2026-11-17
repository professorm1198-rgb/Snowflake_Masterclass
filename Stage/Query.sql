-- =====================================================
-- CREATE DATABASE AND SCHEMA
-- =====================================================

CREATE OR REPLACE DATABASE ECOMMERCE_DB;

CREATE OR REPLACE SCHEMA ECOMMERCE_DB.PRODUCT_SCHEMA;


-- Step 1: Create a named internal stage

CREATE OR REPLACE STAGE ECOMMERCE_STAGE;

SHOW STAGES;


-- Step 2: Upload your CSV file in Snowsight
-- Data > Databases > ECOMMERCE_DB > PRODUCT_SCHEMA
-- > Stages > ECOMMERCE_STAGE > Files


-- Step 3: Check the files in the stage

LIST @ECOMMERCE_STAGE;


-- Step 4: Query a file directly from the stage

SELECT $1, $2, $3, $4, $5
FROM @ECOMMERCE_STAGE/products.csv;


-- Step 5: Create a transient table

CREATE OR REPLACE TRANSIENT TABLE PRODUCTS (
    PRODUCT_ID INT,
    PRODUCT_NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10,2),
    STOCK_QUANTITY INT
);


-- Step 6: Create a separate CSV file format


CREATE OR REPLACE FILE FORMAT CSV_FORMAT
    TYPE = CSV
    FIELD_DELIMITER = ','
    SKIP_HEADER = 1;

DESC FILE FORMAT CSV_FORMAT;


-- Step 7: Load data from stage into transient table

COPY INTO PRODUCTS
FROM @ECOMMERCE_STAGE/products.csv
FILE_FORMAT = (FORMAT_NAME = CSV_FORMAT);


-- Step 8: Verify the loaded data

SELECT * FROM PRODUCTS
limit 10;
