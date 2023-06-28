SELECT emp.firstName, emp.lastName, emp.title,
mng.firstName AS ManagerFirstName,
mng.lastName AS ManagerLastName
FROM employee emp
INNER JOIN employee mng
ON emp.managerID = mng.employeeID

GO 

SELECT firstName, lastName, title, salesAmount
FROM employee
LEFT JOIN sales
ON employee.employeeId = sales.employeeId
WHERE title = 'Sales Person'
AND salesAmount IS NULL