-- term code effect cip code
WITH cte_max_term AS(
    SELECT sgbstdn_pidm Pidm,
           sgbstdn_majr_code_1 MajorCode,
           MIN(sgbstdn_term_code_eff) SGBSTDNTermCode
    FROM banner.sgbstdn
    GROUP BY sgbstdn_pidm, sgbstdn_majr_code_1
)
SELECT sgbstdn_pidm,
       sgbstdn_term_code_eff,
       sgbstdn_acyr_code,
       sgbstdn_majr_code_1,
       stvmajr_cipc_code
FROM banner.sgbstdn
LEFT JOIN banner.stvmajr ON sgbstdn_majr_code_1 = stvmajr_code
LEFT JOIN cte_max_term ON sgbstdn_pidm = cte_max_term.Pidm
WHERE sgbstdn_term_code_eff = cte_max_term.SGBSTDNTermCode
  AND sgbstdn_majr_code_1 IS NOT NULL
  AND stvmajr_cipc_code IS NOT NULL
ORDER BY sgbstdn_pidm, stvmajr_cipc_code;
