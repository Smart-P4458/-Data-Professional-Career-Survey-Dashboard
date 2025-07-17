USE [3MTT_DB]

---Creating new table as data professional survey---
CREATE TABLE Data_Professional_Survey
(
UniqueID VARCHAR(100) PRIMARY KEY, 
DateTaken DATE, 
TimeTaken TIME, 
TimeSpent TIME, 
CurrentRoleTitle VARCHAR(300),
CareerSwitched VARCHAR(50), 
CurrentAnnualSalary_in_000s Varchar(100), 
Industry VARCHAR(100),  	
ProgrammingLang VARCHAR(400),  	
SatisfactionSalary INT,	
SatisfactionWorkLifeBalance INT,  	
SatisfactionCoworkers INT,  	
SatisfactionManagement INT,  	
SatisfactionUpwardMobility INT,  	
SatisfactionLearning INT,  	
CareerEntryDifficulty VARCHAR(100),  	
JobSwitchingFactor VARCHAR(300),
Gender VARCHAR(50),
Age INT,
Country VARCHAR(100),	
EducationLevel VARCHAR(200),
Ethnicity VARCHAR(150)
);

---Inserting data into the Data_Professional_Survey---
INSERT INTO Data_Professional_Survey (
UniqueID, 
DateTaken, 
TimeTaken, 
TimeSpent, 
CurrentRoleTitle,
CareerSwitched, 
CurrentAnnualSalary_in_000s, 
Industry,  	
ProgrammingLang,  	
SatisfactionSalary,	
SatisfactionWorkLifeBalance,  	
SatisfactionCoworkers,  	
SatisfactionManagement,  	
SatisfactionUpwardMobility,  	
SatisfactionLearning,  	
CareerEntryDifficulty,  	
JobSwitchingFactor,
Gender,
Age,
Country,	
EducationLevel,
Ethnicity)
SELECT 
UniqueID, 
DateTaken, 
TimeTaken, 
TimeSpent, 
CurrentRoleTitle,
CareerSwitched, 
CurrentAnnualSalary_in_000s, 
Industry,  	
ProgrammingLang,  	
SatisfactionSalary,	
SatisfactionWorkLifeBalance,  	
SatisfactionCoworkers,  	
SatisfactionManagement,  	
SatisfactionUpwardMobility,  	
SatisfactionLearning,  	
CareerEntryDifficulty,  	
JobSwitchingFactor,
Gender,
Age,
Country,	
EducationLevel,
Ethnicity
FROM [dbo].[Professional Survey Dataset];

---Calculating the total respondents---
SELECT COUNT([UniqueID]) AS TotalRespondents
FROM Data_Professional_Survey;


---Calculating the average satisfaction---
SELECT AVG([SatisfactionManagement]) AS AvgSatisfactionManagement
FROM Data_Professional_Survey;

---Retereiving the most common Current Role Title---
SELECT TOP 1 
    CurrentRoleTitle, 
    COUNT(*) AS RoleCount
FROM 
    Data_Professional_Survey
GROUP BY 
    CurrentRoleTitle
ORDER BY 
   CurrentRoleTitle DESC;

   ---Putting the Ages in Buckets with their Values---
   SELECT 
    CASE 
        WHEN Age IS NULL THEN 'Not Specified'
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age >= 20 AND Age <= 29 THEN '20 - 29'
        WHEN Age >= 30 AND Age <= 39 THEN '30 - 39'
        WHEN Age >= 40 AND Age <= 49 THEN '40 - 49'
        WHEN Age >= 50 THEN '50 and above'
        ELSE 'Unknown'
    END AS AgeBucket,
    COUNT(*) AS TotalPeople
FROM 
    Data_Professional_Survey
GROUP BY 
    CASE 
        WHEN Age IS NULL THEN 'Not Specified'
        WHEN Age < 20 THEN 'Under 20'
        WHEN Age >= 20 AND Age <= 29 THEN '20 - 29'
        WHEN Age >= 30 AND Age <= 39 THEN '30 - 39'
        WHEN Age >= 40 AND Age <= 49 THEN '40 - 49'
        WHEN Age >= 50 THEN '50 and above'
        ELSE 'Unknown'
    END
ORDER BY 
    TotalPeople DESC;


SELECT * FROM [dbo].[Professional Survey Dataset]
SELECT * FROM [dbo].[Data_Professional_Survey]