-- term to aid year

SELECT DISTINCT term_id TermID,
       rbrapbc_aidy_code AidYear
FROM export.term
LEFT JOIN banner.rbrapbc ON rbrapbc_aidy_code = financial_aid_year_id
WHERE nullif(rbrapbc_aidy_code,'') IS NOT NULL
ORDER BY rbrapbc_aidy_code, term_id;
