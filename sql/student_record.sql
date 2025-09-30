-- stu record

SELECT DISTINCT a.student_id StudentID
              , a.sis_system_id Pidm
              , REPLACE(d.ssn, '-', '') SSN
              , c.stvmajr_cipc_code CipCode
FROM export.student_term_level a
         LEFT JOIN banner.sgbstdn b ON a.sis_system_id = b.sgbstdn_pidm
         LEFT JOIN banner.stvmajr c ON c.stvmajr_code = b.sgbstdn_majr_code_1
         LEFT JOIN export.student d ON a.sis_system_id = d.sis_system_id
WHERE stvmajr_cipc_code != '999999'
  AND a.is_primary_level
GROUP BY a.student_id, a.sis_system_id, c.stvmajr_cipc_code, d.ssn
ORDER BY a.student_id, c.stvmajr_cipc_code;