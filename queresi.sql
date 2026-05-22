-- =========================================
-- 1. Churn Rate by Country
-- =========================================

SELECT 
    country,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY country
ORDER BY churn_rate DESC;


-- =========================================
-- 2. Churn Rate by Gender
-- =========================================

SELECT 
    gender,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY gender;


-- =========================================
-- 3. Average Balance by Churn Status
-- =========================================

SELECT 
    churn,
    ROUND(AVG(balance), 2) AS avg_balance
FROM bank_churn
GROUP BY churn;


-- =========================================
-- 4. Churn Rate by Exact Age
-- =========================================

SELECT 
    age,
    ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_churn
GROUP BY age
ORDER BY churn_rate DESC;


-- =========================================
-- 5. Customer Age Segmentation Analysis
-- =========================================

SELECT
    CASE
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,

    ROUND(AVG(churn) * 100, 2) AS churn_rate,
    COUNT(*) AS customers

FROM bank_churn

GROUP BY age_group
ORDER BY churn_rate DESC;


