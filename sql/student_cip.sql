-- term code effect cip code
WITH term_data AS (
    SELECT
        sgbstdn_pidm AS pidm,
        stvmajr_cipc_code AS cip_code,
        MIN(sgbstdn_term_code_eff) AS first_term_code
    FROM banner.sgbstdn
             LEFT JOIN banner.stvmajr
                       ON sgbstdn_majr_code_1 = stvmajr_code
    WHERE sgbstdn_majr_code_1 IS NOT NULL
      AND stvmajr_cipc_code IS NOT NULL
      AND stvmajr_cipc_code != '999999'
    GROUP BY sgbstdn_pidm, stvmajr_cipc_code
),
     cip_counts AS (
         SELECT
             pidm,
             COUNT(*) AS cip_count
         FROM term_data
         GROUP BY pidm
     ),
     ranked_terms AS (
         SELECT
             td.pidm,
             td.cip_code,
             td.first_term_code,
             ROW_NUMBER() OVER (PARTITION BY td.pidm ORDER BY td.first_term_code) AS cip_sequence,
             LEAD(td.first_term_code) OVER (PARTITION BY td.pidm ORDER BY td.first_term_code) AS derived_last_term_code
         FROM term_data td
     )
SELECT
    rt.pidm,
    rt.cip_code,
    rt.first_term_code,
    rt.derived_last_term_code,
    cc.cip_count,
    rt.cip_sequence
FROM ranked_terms rt
         LEFT JOIN cip_counts cc
                   ON rt.pidm = cc.pidm
ORDER BY rt.pidm, rt.cip_sequence;