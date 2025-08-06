-- nsc list

WITH cte_max_term AS(
    SELECT sgbstdn_pidm Pidm,
           MAX(sgbstdn_term_code_eff) SGBSTDNTermCode
    FROM banner.sgbstdn
    GROUP BY sgbstdn_pidm
)
SELECT a.student_id StudentID,
       a.sis_system_id Pidm,
       a.term_id TermCode
FROM export.student_term_level a
LEFT JOIN cte_max_term b ON a.sis_system_id = b.Pidm
      AND b.SGBSTDNTermCode <= a.term_id
WHERE a.term_id IN('202240','202320','202330')
ORDER BY a.student_id, a.term_id;
