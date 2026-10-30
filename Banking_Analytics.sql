														                #Bank Loan Analytics
 -- MySQL Queries 
CREATE DATABASE banking_analytics;
USE banking_analytics;

-- KPI – Total Funded Amount
SELECT SUM(`Funded Amount`)/10000000 AS Total_Funded_Amount
FROM banking_data;

-- KPI – Total Clients
SELECT 
    COUNT(`Client id`) AS Client_Count
FROM banking_data;

-- KPI – Principal Received
SELECT 
   format(SUM(`Total Rec Prncp`)/10000000,2) AS Principal_Received
FROM banking_data;

-- KPI – Avg Loan Amount
SELECT 
    CONCAT('₹', FORMAT(AVG(`Funded Amount`) / 1000, 2), 'K') AS Avg_Loan_Amount
FROM banking_data;

-- Top 10 Branches by Loan Amount
SELECT
    `Branch Name`,
    format(SUM(`Funded Amount`) / 10000000, 2) AS Loan_Amount_Cr
FROM banking_data
GROUP BY `Branch Name`
ORDER BY Loan_Amount_Cr DESC
LIMIT 10;

-- State-wise Loan Performance
SELECT
    `State Name`,
    ROUND(SUM(`Funded Amount`) / 10000000, 2) AS Loan_Amount_Cr
FROM banking_data
GROUP BY `State Name`
ORDER BY Loan_Amount_Cr DESC
LIMIT 5;

-- Loan Status Analysis
SELECT
    `Loan Status2`,
    COUNT(DISTINCT `Account ID`) AS total_clients,
    round(SUM(`Funded Amount`)/10000000,2) AS total_funded_amount
FROM banking_data
GROUP BY `Loan Status2`
ORDER BY total_funded_amount DESC;

-- Average Loan Amount by Grade
SELECT
    `Grrade`,
    format(AVG(`Loan Amount`)/1000,2) AS avg_loan_amount
FROM banking_data
WHERE `Grrade` IS NOT NULL
AND `Grrade` <> ''
GROUP BY `Grrade`
ORDER BY `Grrade`;
