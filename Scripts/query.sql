SELECT emp.firstName, emp.lastName, emp.title,
mng.firstName AS ManagerFirstName,
mng.lastName AS ManagerLastName
FROM employee emp
INNER JOIN employee mng
ON emp.managerID = mng.employeeID;

GO 

SELECT firstName, lastName, title, salesAmount
FROM employee
LEFT JOIN sales
ON employee.employeeId = sales.employeeId
WHERE title = 'Sales Person'
AND salesAmount IS NULL;

GO 

SELECT emp.firstName, emp.lastName, emp.employeeId, 
COUNT(*) AS NumOfCarsSold
FROM employee emp
INNER JOIN sales sls
ON emp.employeeId = sls.employeeId
GROUP BY 1,2,3
ORDER BY 4 DESC;

GO 

SELECT emp.employeeId, emp.firstName, emp.lastName,
MIN(salesAmount) AS MinSalesAmount,
MAX(salesAmount) AS MaxSalesAmount
FROM sales sls
INNER JOIN employee emp 
ON sls.employeeId = emp.employeeId
WHERE sls.soldDate >= date('now', 'start of year')
GROUP BY 1,2,3
ORDER BY 5 DESC;

GO 

WITH cte AS (
SELECT strftime('%Y', soldDate) AS soldYear, salesAmount
FROM sales
)
SELECT soldYear, FORMAT("$%.2f", sum(salesAmount)) AS annualSales
FROM cte 
GROUP BY soldYear
ORDER BY soldYear;

GO 

SELECT emp.firstName, emp.lastName, sls.soldDate, sls.salesAmount
FROM sales sls 
INNER JOIN employee emp 
ON sls.employeeId = emp.employeeId
WHERE sls.soldDate >= '2021-01-01'
AND sls.soldDate <= '2022-01-01'
ORDER BY soldDate ASC;