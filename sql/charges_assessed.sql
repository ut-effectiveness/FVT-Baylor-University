-- charges_assessed

SELECT tbraccd_pidm Pidm
       , tbbdetc_type_ind TypeInd
       , tbbdetc_dcat_code CatCode
       , tbraccd_detail_code DetailCode
       , CAST(CAST(tbraccd_amount AS NUMERIC) AS INTEGER) Amount
       , tbraccd_term_code TermId
FROM banner.tbraccd
LEFT JOIN banner.tbbdetc
     ON tbbdetc_detail_code = tbraccd.tbraccd_detail_code;
