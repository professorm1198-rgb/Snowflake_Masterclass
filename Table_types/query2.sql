-- CHECK TEMPORARY TABLE
-- Works only in the same session where the temporary table was created.
-- Open a NEW worksheet (new session) and run the same query.
-- It should fail because the temporary table is not available in that session.

 USE DATABASE HOSPITAL_DB;

 USE SCHEMA PATTIENT_SCHEMA;

SELECT * FROM HOSPITAL_DB.PATIENT_SCHEMA.PATIENT_TEMP;


-- CHECK TABLE TYPES

SHOW TABLES LIKE 'PATIENT_%';


-- CHECK STORAGE METRICS

SELECT
    TABLE_NAME,
    ACTIVE_BYTES,       -- Storage used by current table data
    TIME_TRAVEL_BYTES,  -- Storage used by historical Time Travel data
    FAILSAFE_BYTES      -- Storage used by Fail-safe data
FROM HOSPITAL_DB.INFORMATION_SCHEMA.TABLE_STORAGE_METRICS
WHERE TABLE_SCHEMA = 'PATIENT_SCHEMA'
  AND TABLE_NAME LIKE 'PATIENT_%';
