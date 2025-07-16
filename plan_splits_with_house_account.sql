/*SQL script that ensures every plan in the PlanSplits table has a "HOUSE" account 
(EmployeeId 16), and is correct by calculating the remaining percentage needed to total 100%. Adds 100% HOUSE 
for plans with no splits and fills the gap for others.*/


With RemoveHouse AS (
 SELECT 
	ps.PlanId
    ,p.PlanName
    ,e.EmployeeId
    ,e.FirstName
    ,e.LastName
    ,ps.SplitPercentage
    ,ps.EffectiveDate
FROM nyins.PlanSplits ps
JOIN nyins.Employees e ON ps.EmployeeId = e.EmployeeId
JOIN nyins.Plans p ON ps.PlanId = p.PlanId
Where e.EmployeeId <> '16'

),

 SumSplits AS (
Select 
	PlanId
	,SUM(CAST(SplitPercentage AS Float)) AS TotalPlanId
	from nyins.PlanSplits 
Group By PlanId

),

HouseInsert AS (
	SELECT 
		p.PlanId
		,p.PlanName
		,CAST(16 AS INT) AS EmployeeId
		,'House' AS FirstName
		,'Account' AS LastName
		,CAST(ROUND(100.0 - ISNULL(SUM(CAST(rh.SplitPercentage AS FLOAT)), 0), 2) AS FLOAT) AS SplitPercentage
		,CAST(GETDATE() AS DATE) AS EffectiveDate
	FROM nyins.Plans p
	LEFT JOIN RemoveHouse rh ON p.PlanId = rh.PlanId
	GROUP BY p.PlanId, p.PlanName
),

PlanSPlitsUpdate AS (
SELECT 
	rh.PlanId,
	rh.PlanName,
	rh.EmployeeId,
	rh.FirstName,
	rh.LastName,
	rh.SplitPercentage,
	rh.EffectiveDate
FROM RemoveHouse rh

UNION ALL

SELECT 
	hi.PlanId,
	hi.PlanName,
	hi.EmployeeId,
	hi.FirstName,
	hi.LastName,
	hi.SplitPercentage,
	hi.EffectiveDate
FROM HouseInsert hi
)

Select * from PlanSPlitsUpdate
ORDER BY CAST(PlanId AS INT), EmployeeId;
