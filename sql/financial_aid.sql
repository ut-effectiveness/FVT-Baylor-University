-- Financial Aid
SELECT DISTINCT rpratrm_pidm Pidm
       , rpratrm_fund_code FundCode
       , rfrbase_fsrc_code FundSource
       , rfrbase_ftyp_code FundType
       , CAST(CAST(rpratrm_paid_amt AS NUMERIC) AS INTEGER) PaidAmount
       , rpratrm_aidy_code AidYear
FROM banner.rpratrm
LEFT JOIN banner.rfrbase
     ON rfrbase.rfrbase_fund_code = rpratrm.rpratrm_fund_code
WHERE rpratrm_paid_amt ~ '^\d+(\.\d+)?$' AND rpratrm_paid_amt::NUMERIC > 0;
