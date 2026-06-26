SHOW databases;

USE jobmarket2030;

-- Display all records from the table.

SELECT * FROM ai_impact_on_jobs_2030;

-- Show only Employee_ID, Job_Title, and Industry.

SELECT Employee_ID, Job_Title, Industry
FROM ai_impact_on_jobs_2030;


-- Find all employees working in the Healthcare industry.

SELECT * 
FROM ai_impact_on_jobs_2030
WHERE Industry = 'Healthcare';

-- Display distinct industries.

SELECT DISTINCT Industry 
FROM ai_impact_on_jobs_2030;

-- Find employees from India.

SELECT *
FROM ai_impact_on_jobs_2030
WHERE Country = 'India';

-- Show employees having a Master's degree.

SELECT * 
FROM ai_impact_on_jobs_2030
WHERE Education_Level = 'Master';


-- Find employees with more than 10 years of experience.

SELECT *
FROM ai_impact_on_jobs_2030
WHERE Years_Experience >= 10;

-- Display employees whose salary is greater than 100,000 USD.

SELECT *
FROM ai_impact_on_jobs_2030
WHERE Salary > 100000 ;


-- Find jobs where AI Replacement Risk is above 80.
SELECT *
FROM ai_impact_on_jobs_2030
WHERE AI_Replacement_Risk >= .8;

-- Display top 10 highest-paid employees.
SELECT * 
FROM ai_impact_on_jobs_2030
ORDER BY Salary DESC
LIMIT 10;

-- Show employees working more than 45 hours per week.

SELECT *
FROM ai_impact_on_jobs_2030
WHERE Work_Hours_Per_Week > 45;

-- Find employees whose hiring trend is Growing.

SELECT *
FROM ai_impact_on_jobs_2030
WHERE Hiring_Trend_2026 = 'Growing';

-- Display all unique education levels.

SELECT DISTINCT Education_Level
FROM ai_impact_on_jobs_2030;

-- Find employees requiring upskilling.
SELECT * 
FROM ai_impact_on_jobs_2030
WHERE Upskilling_Needed = 'Yes';

-- Count total employees.

SELECT 
		COUNT(*) AS TotalEmp
FROM ai_impact_on_jobs_2030;

-- Count employees in each industry.

SELECT Industry,
	COUNT(*) AS Total_Emp
    FROM ai_impact_on_jobs_2030
    GROUP BY Industry;

-- Find average salary by industry.
SELECT Industry,
	Avg(Salary) as AvgSalary
    FROM ai_impact_on_jobs_2030
    GROUP BY Industry;
    

-- Find maximum salary in each industry.
SELECT Industry,
	MAX(Salary) as MaxSalary
    FROM ai_impact_on_jobs_2030
    GROUP BY Industry;
    
-- Find minimum salary in each industry.

SELECT Industry,
	MIN(Salary) as MinSalary
    FROM ai_impact_on_jobs_2030
    GROUP BY Industry;
    
    -- Display industries with average salary greater than 90,000 USD.
    
SELECT Industry,
	AVG(Salary) as AvgSalary
	FROM ai_impact_on_jobs_2030
GROUP BY Industry
HAVING AvgSalary > 90000;

-- Count employees by country.

SELECT Country,
	COUNT(*) AS TotalEmployee
    FROM ai_impact_on_jobs_2030
GROUP BY Country;

-- Find average AI Replacement Risk by industry.

SELECT Industry,
	AVG(AI_Replacement_Risk)
    FROM ai_impact_on_jobs_2030
GROUP BY Industry;

-- Find average Job Satisfaction by country.
SELECT Country,
	Avg(Job_Satisfaction) as AvgSat
    FROM ai_impact_on_jobs_2030
GROUP by Country;
    
-- Display top 5 industries with highest average salaries.

SELECT Industry,
	avg(Salary) as AvgSalary
    FROM ai_impact_on_jobs_2030
GROUP BY Industry;

-- Find total employees requiring upskilling.

SELECT  COUNT(*) as UnSkillReq
FROM ai_impact_on_jobs_2030
WHERE UpSkilling_Needed = 'Yes';


-- Count employees based on hiring trend.
SELECT Hiring_Trend_2026,
		COUNT(*) as HiringTrend
	FROM ai_impact_on_jobs_2030
Group By Hiring_Trend_2026;

-- Find average Automation Level by education level.
SELECT Education_Level,
		Avg(Automation_Level) as AvgAutomation
        FROM ai_impact_on_jobs_2030
	GROUP BY Education_Level;
    
    
-- Display industries having more than 100 employees.
SELECT Industry,
	COUNT(*) AS Total_Emp
	FROM ai_impact_on_jobs_2030
    GROUP BY Industry 
    HAVING Count(*) > 100;
    
-- Find average Future Demand Score for each job title.
SELECT Job_Title,
	Avg(Future_Demand_Score) as AvgFDemand
    FROM ai_impact_on_jobs_2030
    GROUP BY Job_Title;
    
-- Find employees earning above the overall average salary.

SELECT * 
FROM ai_impact_on_jobs_2030
WHERE Salary >

(
SELECT Avg(Salary) as AvgSalary
FROM ai_impact_on_jobs_2030);
    
-- Find the highest-paid employee in each industry.


-- Split table

CREATE TABLE Employee_Details AS
SELECT 
	Employee_ID,
    Job_Title,
    Industry,
    Country,
    Education_Level,
    Years_Experience
FROM ai_impact_on_jobs_2030;

CREATE TABLE Job_Analytics AS 
 SELECT 
	Employee_ID,
    Salary,
    Work_Hours_Per_Week,
    AI_Replacement_Risk,
    Automation_Level,
    Future_Demand_Score,
    Hiring_Trend_2026,
    Upskilling_Needed,
    Job_Satisfaction
FROM ai_impact_on_jobs_2030;

-- Add Primary Keys
ALTER TABLE Employee_Details
MODIFY Employee_ID varchar(20) Not null;

ALTER TABLE Employee_Details
ADD primary key (Employee_ID);

ALTER TABLE Job_Analytics 
MODIFY Employee_ID varchar(20) Not null;

ALTER table Job_Analytics
ADD Primary Key (Employee_ID);

-- Add Foreign Key 

ALTER TABLE Job_Analytics
ADD constraint fk_employee
FOREIGN KEY (Employee_ID)
references employee_Details(Employee_ID);

Select*from Employee_Details;
SELECT * FROM Job_Analytics;

-- Display Employee_ID, Job_Title, and Average_Salary_USD by joining Employee_Details and Job_Analytics.
SELECT e.Employee_ID, 
	e.Job_Title, 
	j.salary
FROM Employee_Details e
JOIN Job_Analytics j
ON e.Employee_ID = j.Employee_ID;




    
    

















