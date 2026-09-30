-- period budget - removed distinct per Marcie 9/30/26
SELECT rbrapbc_pidm Pidm
       , rbrapbc_pbcp_code Component
       , CAST(CAST(rbrapbc_amt AS NUMERIC) AS INTEGER) PeriodAmount
       ,rbrapbc_aidy_code AidYear
FROM banner.rbrapbc
WHERE rbrapbc_pbtp_code = 'CAMP'; --**Replace with your budget type code
