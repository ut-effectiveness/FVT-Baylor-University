-- period budget
SELECT DISTINCT rbrapbc_pidm Pidm
       , rbrapbc_pbcp_code Component
       , CAST(CAST(rbrapbc_amt AS NUMERIC) AS INTEGER) PeriodAmount
       ,rbrapbc_aidy_code AidYear
FROM banner.rbrapbc
WHERE rbrapbc_pbtp_code = 'CAMP'; --**Replace with your budget type code
