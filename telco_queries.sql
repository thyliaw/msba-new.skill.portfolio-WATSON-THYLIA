SELECT Churn, COUNT(*) AS cnt
FROM telco
GROUP BY Churn;

SELECT InternetService, AVG(MonthlyCharges) AS avg_charges
FROM telco
GROUP BY InternetService;

SELECT Contract, 
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*1.0/COUNT(*) AS churn_rate
FROM telco
GROUP BY Contract;

SELECT CASE 
         WHEN tenure <= 12 THEN '0-12 months'
         WHEN tenure <= 24 THEN '13-24 months'
         ELSE '25+ months'
       END AS tenure_bucket,
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*1.0/COUNT(*) AS churn_rate
FROM telco
GROUP BY tenure_bucket;