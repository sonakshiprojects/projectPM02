CREATE DATABASE credit_risk_db;
USE credit_risk_db;

-- Loan Application Funnel Analysis (Drop-off Rates)
SELECT 
    funnel_stage_reached,
    COUNT(*) AS applications,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM master_credit_risk_clean), 2) AS pct_of_total
FROM master_credit_risk_clean
GROUP BY funnel_stage_reached
ORDER BY applications DESC;

-- Credit Risk Profile by FICO Band
SELECT 
    CASE 
        WHEN credit_score_fico < 580 THEN 'Poor (<580)'
        WHEN credit_score_fico BETWEEN 580 AND 669 THEN 'Fair (580-669)'
        WHEN credit_score_fico BETWEEN 670 AND 739 THEN 'Good (670-739)'
        ELSE 'Excellent (740+)'
    END AS fico_segment,
    COUNT(*) AS total_borrowers,
    SUM(default_flag) AS total_defaults,
    ROUND(100.0 * AVG(default_flag), 2) AS default_rate_pct
FROM master_credit_risk_clean
GROUP BY fico_segment
ORDER BY MIN(credit_score_fico);

--  Bounced Payments (NSF) vs Default Correlation
SELECT 
    nsf_count,
    COUNT(*) AS total_loans,
    SUM(default_flag) AS total_defaults,
    ROUND(100.0 * AVG(default_flag), 2) AS default_rate_pct
FROM master_credit_risk_clean
GROUP BY nsf_count
ORDER BY nsf_count;

-- Cumulative Financial Risk Exposure
SELECT 
    loan_id,
    loan_purpose,
    disbursement_date,
    loan_amount,
    SUM(loan_amount) OVER(
        PARTITION BY loan_purpose 
        ORDER BY disbursement_date
    ) AS cumulative_risk_exposure_usd
FROM master_credit_risk_clean
WHERE disbursement_date IS NOT NULL
LIMIT 100;

-- Funnel Conversion Drop-Off Analysis
WITH StageCounts AS (
    SELECT 
        funnel_stage_reached,
        COUNT(*) AS total_applications
    FROM master_credit_risk_clean
    GROUP BY funnel_stage_reached
)
SELECT 
    funnel_stage_reached,
    total_applications,
    ROUND(100.0 * total_applications / (
        SELECT SUM(total_applications) FROM StageCounts
    ), 2) AS percentage_of_total_funnel
FROM StageCounts
ORDER BY total_applications DESC;

-- High-Risk Borrower Flags
SELECT 
    customer_id,
    loan_id,
    credit_score_fico,
    dti_ratio,
    annual_income
FROM master_credit_risk_clean
WHERE default_flag = 1 
  AND dti_ratio > (
      SELECT AVG(dti_ratio) 
      FROM master_credit_risk_clean
  )
ORDER BY dti_ratio DESC;
	