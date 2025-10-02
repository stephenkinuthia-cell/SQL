
-- Department table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);

-- JobRole table
CREATE TABLE JobRoles (
    JobRoleID INT PRIMARY KEY IDENTITY(1,1),
    JobRoleName VARCHAR(100) NOT NULL,
    JobLevel INT
);

-- Education Table
CREATE TABLE Education (
    EducationID INT PRIMARY KEY IDENTITY(1,1),
    EducationLevel INT, -- 1 = Below College, 2 = College, 3 = Bachelor, etc.
    EducationField VARCHAR(100)
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeNumber INT PRIMARY KEY,
    DepartmentID INT,
    JobRoleID INT,
    EducationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (JobRoleID) REFERENCES JobRoles(JobRoleID),
    FOREIGN KEY (EducationID) REFERENCES Education(EducationID)
);

-- Demographic table
CREATE TABLE Demographics (
    EmployeeNumber INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(20),
    MaritalStatus VARCHAR(20),
    Over18 CHAR(2),
    FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);

-- Compensation Table
CREATE TABLE Compensation (
    EmployeeNumber INT PRIMARY KEY,
    HourlyRate INT,
    DailyRate INT,
    MonthlyRate INT,
    MonthlyIncome INT,
    PercentSalaryHike INT,
    StockOptionLevel INT,
    FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);

-- Satisfaction Table
CREATE TABLE Satisfaction (
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    JobSatisfaction INT,
    RelationshipSatisfaction INT,
    WorkLifeBalance INT,
    FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);

-- Performance Table
CREATE TABLE Performance (
    EmployeeNumber INT PRIMARY KEY,
    PerformanceRating INT,
    TrainingTimesLastYear INT,
    OverTime VARCHAR(10),
    FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);

-- Career Progression Table
CREATE TABLE CareerProgression (
    EmployeeNumber INT PRIMARY KEY,
    TotalWorkingYears INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    NumCompaniesWorked INT,
    FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);

-- Attrition Table
CREATE TABLE Attrition (
    EmployeeNumber INT PRIMARY KEY,
    Attrition VARCHAR(10),  -- 'Yes' or 'No'
    BusinessTravel VARCHAR(50),
    DistanceFromHome INT,
    FOREIGN KEY (EmployeeNumber) REFERENCES Employees(EmployeeNumber)
);
























