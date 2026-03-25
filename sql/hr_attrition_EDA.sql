CREATE DATABASE hr_attrition;
USE hr_attrition;
SET GLOBAL local_infile = 1;
USE hr_attrition;

SET SQL_SAFE_UPDATES = 0;

-- Show table

SELECT * 
FROM hr_attrition_clean;

-- Attrition Rate

SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS attrition_rate
FROM hr_attrition_clean;

-- update 20-30 age bracket to 18-30

UPDATE hr_attrition_clean
SET Age_Group = '18-30'
WHERE Age_Group = '20-30';

-- total employee count each age group

SELECT Age_group,COUNT(*) AS count
FROM hr_attrition_clean
GROUP BY Age_group
ORDER BY Age_group;

-- overall attrition rate

SELECT COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(100 * SUM(Attrition_Flag)/COUNT(*),2) AS attrition_rate_pct
FROM hr_attrition_clean;

-- attrition rate by department

SELECT Department, COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(100 * SUM(Attrition_Flag)/COUNT(*),2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Department
ORDER BY Department;

-- Attrition by Age Group

SELECT Age_group, COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(100 * SUM(Attrition_Flag)/COUNT(*),2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Age_group
ORDER BY Age_group;

-- Attrition by Over time

SELECT Overtime,COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(100 * SUM(Attrition_Flag)/COUNT(*),2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Overtime
ORDER BY Overtime;

-- Attrition by salary slab

SELECT
    Salary_Slab,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(100.0 * SUM(Attrition_Flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Salary_Slab
ORDER BY attrition_rate_pct DESC;

-- Attrition by tenure group

SELECT
    Tenure_Group,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(100.0 * SUM(Attrition_Flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Tenure_Group
ORDER BY attrition_rate_pct DESC;

-- Attrition by job role

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(100.0 * SUM(Attrition_Flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- Over time and department

SELECT Overtime,Department,COUNT(*) AS total_employees,
SUM(Attrition_flag) AS employees_left,
ROUND(100 * SUM(Attrition_flag)/COUNT(*),2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY OverTime, Department
ORDER BY Department,attrition_rate_pct DESC;

-- age group over time

SELECT
    Age_Group,
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(100.0 * SUM(Attrition_Flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Age_Group, OverTime
ORDER BY attrition_rate_pct DESC;

--  Salary Slab × Tenure Group

SELECT
    Tenure_Group,
    Salary_Slab,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(100.0 * SUM(Attrition_Flag) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_attrition_clean
GROUP BY Tenure_Group, Salary_Slab
ORDER BY attrition_rate_pct DESC;


-- End Of Exploratory Data Analysis --
