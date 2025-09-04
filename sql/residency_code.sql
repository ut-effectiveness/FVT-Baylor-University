-- gives residency code
-- This query retrieves the residency code for each student, prioritizing in-state ('I') 
-- over out-of-state ('O') and other codes.

WITH ranked_residency AS (
    SELECT student_id,
           sis_system_id AS Pidm,
           residency_in_state_code AS rescode,
           ROW_NUMBER() OVER (
               PARTITION BY student_id
               ORDER BY 
                   CASE residency_in_state_code
                       WHEN 'O' THEN 1
                       WHEN 'I' THEN 2
                       WHEN 'G' THEN 3
                       ELSE 4
                   END
           ) AS rn
    FROM export.student_term_level
    WHERE term_id IN ('202340', '202420', '202430')
)
SELECT student_id, Pidm, rescode
FROM ranked_residency
WHERE rn = 1;

