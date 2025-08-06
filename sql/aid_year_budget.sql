-- aid_year_budget

SELECT DISTINCT rbrapbc_pidm Pidm
       , rbrapbc_pbcp_code Component
       , CAST(CAST(rbrapbc_amt AS NUMERIC) AS INTEGER) AidAmount
       , rbrapbc_aidy_code AidYear
FROM banner.rbrapbc
WHERE rbrapbc_pbtp_code = 'CAMP' --**Replace with your budget type code
     --Books and Supplies for Aid Year Budget. These are the only components that matter for older years. We switched to Period Based Budgets in AIDY 2021.
     AND rbrapbc_pbcp_code IN ('B+S','FEES','R+B'); --**Replace with your books and supplies, fees, room and board component codes
     
