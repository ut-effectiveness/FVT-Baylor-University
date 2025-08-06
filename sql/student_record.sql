-- stu record

SELECT a.student_id StudentID
       , a.sis_system_id Pidm
       , b.sgbstdn_levl_code LevelCode
       , b.sgbstdn_majr_code_1 MajorCode
       , b.sgbstdn_degc_code_1 DegreeCode
       , b.sgbstdn_program_1 ProgramCode
       , c.stvmajr_cipc_code
       , c.stvmajr_code
FROM export.student_term_level a
LEFT JOIN banner.sgbstdn b ON a.sis_system_id = b.sgbstdn_pidm
LEFT JOIN banner.stvmajr c ON c.stvmajr_code = b.sgbstdn_majr_code_1;