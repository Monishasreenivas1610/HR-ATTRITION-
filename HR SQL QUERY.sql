
SELECT * FROM ATTRITION;


---UPDATING ATTRITION YES=1 NO=0
UPDATE ATTRITION
SET Attrition = CASE 
                   WHEN Attrition = 'Yes' THEN 1
                   WHEN Attrition = 'No' THEN 0
                   ELSE Attrition
                END;

---UPDATING  OVERTIME YES=1 NO=0
UPDATE ATTRITION
SET  OVERTIME= CASE 
                   WHEN  OVERTIME = 'Yes' THEN 1
                   WHEN  OVERTIME = 'No' THEN 0
                   ELSE  OVERTIME
                END;


-- PRESENCE OF OVERTIME AND ATTRITION CORRELATION
SELECT OVERTIME, COUNT(*) AS TOTAL_EMPLOYEES
FROM ATTRITION
WHERE ATTRITION = 1
GROUP BY OVERTIME;

UPDATE ATTRITION
SET  GENDER= CASE 
                   WHEN  GENDER = 1 THEN 'FEMALE'
                   WHEN  OVERTIME = 0 THEN 'MALE'
                   ELSE  OVERTIME
                END;

-- OVERALL GENDER DISTRIBUTION IN THE DATASET
SELECT GENDER, COUNT(*) AS TOTAL_EMPLOYEES FROM ATTRITION
GROUP BY GENDER;


SELECT GENDER, COUNT(*) AS TOTAL_EMPLOYEES
FROM ATTRITION
WHERE Attrition = 1
GROUP BY GENDER;


-- RELATION BETWEEN PERFORMANCE RATING AND ATTRITION
SELECT PerformanceRating, COUNT(CASE WHEN ATTRITION = '1' THEN 1 END) AS ATTRITION_COUNT
FROM ATTRITION
GROUP BY PerformanceRating;
-- THERE IS A NEGATIVE CORRELATION BETWEEN THE PERFORMACE RATING AND ATTRITION COUNT

-- RELATION BETWEEN THE PERCENT SALARY HIKE AND ATTRITION COUNT
SELECT PercentSalaryHike, COUNT(*) AS ATTRITION_COUNT
FROM ATTRITION
WHERE ATTRITION = 1
GROUP BY  PercentSalaryHike
ORDER BY ATTRITION_COUNT DESC;
-- THERE IS A NEGATIVE CORRELATION BETWEEN THE PERCENT SALARY HIKE AND ATTRITION COUNT


-- RELATION BETWEEM YEARS IN CURRENT ROLE AND ATTRITION COUNT
SELECT YearsInCurrentRole, COUNT(CASE WHEN ATTRITION = '1' THEN 1 END) AS ATTRITION_COUNT
FROM ATTRITION
WHERE YearsInCurrentRole > (SELECT AVG(YearsInCurrentRole) FROM ATTRITION)
GROUP BY YearsInCurrentRole
ORDER BY YearsInCurrentRole;
-- EMPLOYEES WHO ARE WORKING IN THE COMPANY FROM LAST 5-10 YEARS ARE HAVING THE HIGHEST ATTRITION COUNT


-- EMPLOYEE ATTRITION BASED ON THE AGE RANGE
SELECT CASE WHEN AGE <= 29 THEN '18-29'
            WHEN AGE >= 30 AND AGE <= 39 THEN '30-39'
			WHEN AGE >= 40 AND AGE <= 49 THEN '40-49'
			WHEN AGE >= 50 AND AGE <= 59 THEN '50-59'
			ELSE '60 OR OLDER'
			END AS 'AGE RANGE', COUNT(*) AS 'NUMBER OF ATTRITION COUNT BASED ON AGE RANGE'
FROM ATTRITION
WHERE ATTRITION = 1 AND YearsAtCompany >= 2
GROUP BY CASE WHEN AGE <= 29 THEN '18-29'
            WHEN AGE >= 30 AND AGE <= 39 THEN '30-39'
			WHEN AGE >= 40 AND AGE <= 49 THEN '40-49'
			WHEN AGE >= 50 AND AGE <= 59 THEN '50-59'
			ELSE '60 OR OLDER'
			END
ORDER BY [AGE RANGE];
-- AGE GROUP OF '18-29' AND '30-39' HAVE THE MAXIMUM ATTRITION COUNTS FOR THOSE EMPLOYEES WHO HAVE BEEN WORKING IN THE COMPANY FROM LAST 1 

SELECT DISTINCT DEPARTMENT FROM ATTRITION;

-- DEPARTMENT WISE ATTRITION COUNT
SELECT DEPARTMENT, COUNT(*) AS ATTRITION_COUNT
FROM ATTRITION
WHERE Attrition = 1
GROUP BY Department
ORDER BY ATTRITION_COUNT DESC;
-- R&D AND SALES DEPARTMENT ARE HAVING THE MAX ATTRITION WITH ALMOST 95%

-- ENVIRONMENT SATISFACTION, JOB SATISFACTION AND RELATIONSHIP SATISFACTION ON ATTRITION COUNTS
SELECT EnvironmentSatisfaction, COUNT(*) AS ATTRITION_COUNTS
FROM ATTRITION
WHERE ATTRITION = 1
GROUP BY EnvironmentSatisfaction
ORDER BY ATTRITION_COUNTS DESC;
-- THERE IS NO CORRELATION BETWEEN THE ENVIRONMENT SATISFACTION AND ATTRITION COUNTS

SELECT JobSatisfaction, COUNT(*) AS ATTRITION_COUNTS
FROM ATTRITION
WHERE ATTRITION = 1
GROUP BY JobSatisfaction
ORDER BY ATTRITION_COUNTS DESC;
-- THERE IS NO CORRELATION BETWEEN THE JOB SATISFACTION AND ATTRITION COUNTS


SELECT RelationshipSatisfaction, COUNT(*) AS ATTRITION_COUNTS
FROM ATTRITION
WHERE ATTRITION = 1
GROUP BY RelationshipSatisfaction
ORDER BY ATTRITION_COUNTS DESC;
-- THERE IS NO CORRELATION BETWEEN THE RELATIONSIP SATISFACTION AND ATTRITION COUNTS


-- WORK LIFE BALANCE AND ATTRITION COUNTS
SELECT WorkLifeBalance, COUNT(*) AS ATTRITION_COUNTS
FROM ATTRITION
WHERE Attrition = 1
GROUP BY WorkLifeBalance
ORDER BY ATTRITION_COUNTS DESC;
-- THERE IS NO RELATION BETWEEN THE WORK LIFE BALANCE AND ATTRITION COUNTS

-- DISTANCE FROM HOME AND ATTRITION COUNTS
SELECT DistanceFromHome, count(*) AS attr_count
FROM ATTRITION
WHERE attrition = 1
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome desc, attr_count desc;
-- THERE IS NO RELATION BETWEEN DISTANCE FROM HOME AND ATTRITION COUNTS

----JOB INVOLVEMENT AND ATTRITION COUNTS
SELECT JobInvolvement, count(*) AS attr_count
FROM ATTRITION
WHERE attrition = 1
GROUP BY JobInvolvement
ORDER BY JobInvolvement desc, attr_count desc;
-- THERE IS NO RELATION BETWEEN JOB INVOLVEMENT AND ATTRITION COUNTS


----EDUCATION AND ATTRITION COUNTS
SELECT Education, count(*) AS attr_count
FROM ATTRITION
WHERE attrition = 1
GROUP BY Education
ORDER BY Education desc, attr_count desc;
-- THERE IS RELATION BETWEEN EDUCATION AND ATTRITION COUNTS