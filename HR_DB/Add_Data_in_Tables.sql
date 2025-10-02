-- ===========================================
-- STEP 4: Reload lookup/reference tables
-- ===========================================
INSERT INTO Departments (DepartmentName)
SELECT DISTINCT Department FROM [HR_Analytics.csv];

INSERT INTO JobRoles (JobRoleName, JobLevel)
SELECT DISTINCT JobRole, JobLevel FROM [HR_Analytics.csv];

INSERT INTO Education (EducationLevel, EducationField)
SELECT DISTINCT Education, EducationField FROM [HR_Analytics.csv];

-- ===========================================
-- STEP 5: Reload Employees
-- ===========================================
INSERT INTO Employees (EmployeeNumber, DepartmentID, JobRoleID, EducationID)
SELECT 
    h.EmployeeNumber,
    d.DepartmentID,
    j.JobRoleID,
    e.EducationID
FROM [HR_Analytics.csv] h
JOIN Departments d ON h.Department = d.DepartmentName
JOIN JobRoles j ON h.JobRole = j.JobRoleName AND h.JobLevel = j.JobLevel
JOIN Education e ON h.Education = e.EducationLevel AND h.EducationField = e.EducationField;

-- ===========================================
-- STEP 6: Reload child tables
-- ===========================================
-- Demographics
INSERT INTO Demographics (EmployeeNumber, Age, Gender, MaritalStatus, Over18)
SELECT EmployeeNumber, Age, Gender, MaritalStatus, Over18
FROM [HR_Analytics.csv];

-- Compensation
INSERT INTO Compensation (EmployeeNumber, HourlyRate, DailyRate, MonthlyRate, MonthlyIncome, PercentSalaryHike, StockOptionLevel)
SELECT EmployeeNumber, HourlyRate, DailyRate, MonthlyRate, MonthlyIncome, PercentSalaryHike, StockOptionLevel
FROM [HR_Analytics.csv];

-- Satisfaction
INSERT INTO Satisfaction (EmployeeNumber, EnvironmentSatisfaction, JobSatisfaction, RelationshipSatisfaction, WorkLifeBalance)
SELECT EmployeeNumber, EnvironmentSatisfaction, JobSatisfaction, RelationshipSatisfaction, WorkLifeBalance
FROM [HR_Analytics.csv];

-- Performance
INSERT INTO Performance (EmployeeNumber, PerformanceRating, TrainingTimesLastYear, OverTime)
SELECT EmployeeNumber, PerformanceRating, TrainingTimesLastYear, OverTime
FROM [HR_Analytics.csv];

-- Career Progression
INSERT INTO CareerProgression (EmployeeNumber, TotalWorkingYears, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager, NumCompaniesWorked)
SELECT EmployeeNumber, TotalWorkingYears, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager, NumCompaniesWorked
FROM [HR_Analytics.csv];

-- Attrition
INSERT INTO Attrition (EmployeeNumber, Attrition, BusinessTravel, DistanceFromHome)
SELECT EmployeeNumber, Attrition, BusinessTravel, DistanceFromHome
FROM [HR_Analytics.csv];
