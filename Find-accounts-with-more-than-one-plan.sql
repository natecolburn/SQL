SELECT 
    a.AccountId,
    a.AccountName,
    COUNT(p.PlanId) AS PlanCount
FROM nyins.Accounts a
JOIN nyins.Plans p ON a.AccountId = p.AccountId
GROUP BY a.AccountId, a.AccountName
HAVING COUNT(p.PlanId) > 1
ORDER BY PlanCount DESC;
