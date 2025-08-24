-- Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,          -- Unique ID for each department
    DeptName VARCHAR(30),            -- Department name
    Location VARCHAR(20)             -- Department location
);

-- Insert Departments
INSERT INTO Department (DeptID, DeptName, Location) VALUES
(1, 'HR', 'Lahore'),
(2, 'IT', 'Islamabad'),
(3, 'Sales', 'Karachi'),
(4, 'Finance', 'Faisalabad');

-- Alter Employee Table to Add DeptID (Foreign Key)
ALTER TABLE Employee
ADD DeptID INT,
ADD FOREIGN KEY (DeptID) REFERENCES Department(DeptID);

-- Update Employee DeptID
UPDATE Employee SET DeptID = 1 WHERE EmpID IN (2,4,8);   -- HR
UPDATE Employee SET DeptID = 2 WHERE EmpID IN (3,7);      -- IT
UPDATE Employee SET DeptID = 3 WHERE EmpID IN (5,6);      -- Sales
UPDATE Employee SET DeptID = 4 WHERE EmpID IN (1,9);      -- Finance

-- 1️⃣ INNER JOIN: Show employees with their department names
SELECT E.EmpID, E.FirstName, E.LastName, E.JobTitle, E.Salary, D.DeptName
FROM Employee E
INNER JOIN Department D ON E.DeptID = D.DeptID;

-- 2️⃣ LEFT JOIN: Show all employees and their departments (even if no dept assigned)
SELECT E.EmpID, E.FirstName, E.LastName, E.JobTitle, E.Salary, D.DeptName
FROM Employee E
LEFT JOIN Department D ON E.DeptID = D.DeptID;

-- 3️⃣ RIGHT JOIN: Show all departments and their employees
SELECT E.EmpID, E.FirstName, E.LastName, E.JobTitle, D.DeptName
FROM Employee E
RIGHT JOIN Department D ON E.DeptID = D.DeptID;

-- 4️⃣ Count employees in each department
SELECT D.DeptName, COUNT(E.EmpID) AS EmployeeCount
FROM Department D
LEFT JOIN Employee E ON E.DeptID = D.DeptID
GROUP BY D.DeptName;
