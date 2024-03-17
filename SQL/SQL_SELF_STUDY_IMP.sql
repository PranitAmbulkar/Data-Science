CREATE DATABASE corporate;
USE corporate;

-- Now we will create the multiple tables into the corporate database 
-- Here we have set the primary key as the emp_id.
CREATE TABLE employee(
emp_id INT,
first_name VARCHAR(15),
last_name VARCHAR(15),
birth_day DATE,
sex VARCHAR(1), -- either M or F
salary INT ,
super_id INT,
branch_id INT,
PRIMARY KEY(emp_id)
);

-- Now we will create the second table which is branch table 

USE corporate;

CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(10),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

-- WE WILL MODIFY THE EMPLOYEE TABLE BY USING THE DML COMMAND ALTER 
ALTER TABLE employee
ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

DESCRIBE employee;
-- WE CAN SEE THAT THE emp_id IS SET AS PRI 
-- AND branch_id IS SET AS MUL means FOREIGN KEY.

-- WE WILL MAKE THE SUPER_ID AS THE FOREIGN KEY WHICH IS REFERENCING THE EMP_ID 
ALTER TABLE employee 
ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

-- Next table is the client table 
CREATE TABLE client(
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL 
);

-- The next table is Works_with table 
CREATE TABLE works_with(
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY(emp_id,client_id),
FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- The final table which we have is a branch_supplier table 

CREATE TABLE branch_supplier(
branch_id INT,
supplier_name VARCHAR(225),
supplier_type VARCHAR(225),
PRIMARY KEY(branch_id,supplier_name),
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- Now we will insert the data into the tables 
SELECT * FROM branch;
SELECT * FROM employee;

INSERT INTO employee VALUES (101, 'Jan' , 'Levinson' , '1961-05-11','F',110000,NULL,NULL);
INSERT INTO employee VALUES (102, 'Michael' , 'Scott' , '1964-03-15','M',75000,NULL,NULL);
INSERT INTO employee VALUES (103, 'Angela' , 'Martin' , '1971-06-25','F',63000,NULL,NULL);
INSERT INTO employee VALUES (104, 'Kelly' , 'Kapoor' , '1980-02-05','F',55000,NULL,NULL);
INSERT INTO employee VALUES (105, 'Stanley' , 'Hudson' , '1958-02-19','M',69000,NULL,NULL);
INSERT INTO employee VALUES (106, 'Josh' , 'Porter' , '1969-09-05','M',78000,NULL,NULL);
INSERT INTO employee VALUES (107, 'Andy' , 'Bernard' , '1973-07-22','M',65000,NULL,NULL);
INSERT INTO employee VALUES (108, 'Jim' , 'Halpert' , '1978-10-01','M',71000,NULL,NULL);


INSERT INTO branch VALUES(2,'Scranton',102,'1992-04-06');
INSERT INTO branch VALUES(3,'Stamford',106,'1998-02-13');
SELECT * FROM branch;
SELECT * FROM employee;
UPDATE employee 
SET branch_id=3
WHERE emp_id=108;
SELECT * FROM works_with;

USE corporate;
-- INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

-- Now we will fill the values into the Client table 
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);

SELECT * FROM client;

INSERT INTO client VALUES(402, ' FedEx', 3);
INSERT INTO client VALUES(403, 'Jon Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

SELECT * FROM branch_supplier;
-- We will insert the data into the Branch Supplier Table 
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill' , 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball' , 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper' , 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms and Labels' , 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball' , 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill' , 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels' , 'Custom Forms');


-- Let's perform the Queries for the above data 

-- TO SELECT ALL EMPLOYEES 
SELECT * FROM employee;

-- TO SELECT ALL CLIENTS 
SELECT * FROM client;

-- find all the employees ordered by the sex 
SELECT * FROM employee 
ORDER BY sex;

SELECT * FROM employee 
ORDER BY sex DESC;

-- FIND ALL THE EMPLOYEES SORT BY  THE SEX FIRST  AND THEN FIRST NAME
SELECT * FROM employee 
ORDER BY sex,first_name;

-- FIND THE TOP5 EMPLOYEES ORDER BY SEX AND THEN NAME 
SELECT * FROM employee 
ORDER BY sex,first_name LIMIT 5;

-- FIND THE FORENAMES AND THE SURNAMES OF THE EMPLOYESS 
SELECT first_name AS Forename, last_name AS Lastname FROM employee;

-- FIND OUT ALL THE DIFFERENT GENDERS 
SELECT DISTINCT sex AS gender FROM employee;

-- FIND OUT THE DIFFERENT BRANCH IDS AND SUPERVISOR IDS 
SELECT DISTINCT branch_id FROM employee;

SELECT DISTINCT super_id FROM employee;

-- FIND OUT ALL THE MALE  EMPLOYEES ORDER BY SEX, NAME 
SELECT * FROM employee WHERE sex='M'
ORDER BY sex,first_name ;

-- FIND THE NUMBER OF EMPLOYEES 
SELECT COUNT(*) AS No_of_employees FROM employee;

--  FIND THE COUNT OF THE FEMALE EMPLOYEES 
SELECT COUNT(*) AS COUNT_OF_FEMALE_EMPLOYEES FROM employee
WHERE sex='F';
SELECT * FROM employee;
-- Find the number of male employees born after 1968.
SELECT COUNT(*) FROM employee 
WHERE sex='M' AND birth_day >= '1969-01-01';

-- Find the average of all employees salaries 
SELECT AVG(salary) AS `Average Salary` FROM employee;

-- Find the avg salary for the male employees 
SELECT AVG(salary) AS `Average Salary` FROM employee
WHERE sex='M';

-- Find the sum of salary from employee tables 
SELECT SUM(salary) FROM employee;

-- Find out how many male and female employees are there in the database.
SELECT COUNT(sex) AS COUNT, sex
FROM employee 
GROUP BY sex;

-- Find out the how many employees are there in each branch 
SELECT COUNT(emp_id) AS COUNT, branch_id
FROM employee 
GROUP BY branch_id;

-- Find out total sales of each salesman 
SELECT SUM(total_sales) AS TOTAL_SALES, emp_id  
FROM works_with
GROUP BY emp_id;

select * from works_with;
-- Find out the total sales for each client 
SELECT SUM(total_sales) AS Revenue, client_id 
FROM works_with 
GROUP BY client_id;

-- JOINS 
-- INNER JOIN, LEFT JOIN, RIGHT JOIN,OUTER JOIN

-- Find all branches and their managers.
SELECT b.branch_id, b.branch_name, e.emp_id, e.first_name AS `Manager Name` FROM employee AS e
JOIN 
branch AS b 
ON e.emp_id = b.mgr_id;

-- Find the employees with branches and their branch ids 
SELECT e.emp_id, e.first_name, e.branch_id , b.branch_name FROM employee AS e
JOIN
branch as b 
ON e.branch_id = b.branch_id;

-- 
SELECT e.emp_id, e.first_name, e.branch_id , b.branch_name FROM employee AS e
JOIN
branch as b 
ON e.emp_id = b.mgr_id;

-- Select all the columns from the employee table and the branch id from 
-- the branch table 
SELECT e.*, b.branch_name FROM 
employee AS e 
JOIN 
branch AS b 
ON e.branch_id = b.branch_id;

-- Find Emp id , first name, branch id and branch name 
SELECT e.emp_id, e.first_name, e.branch_id , b.branch_name
FROM employee AS e 
INNER JOIN 
branch AS b 
ON e.branch_id = b.branch_id;

-- Left JOIN
SELECT b.branch_name, b.branch_id, e.first_name AS manager_name, e.emp_id AS manager_id
FROM branch AS b 
LEFT JOIN 
employee AS e
ON e.emp_id = b.mgr_id;

-- RIGHT join 
SELECT b.branch_name, b.branch_id, e.first_name AS manager_name, e.emp_id AS manager_id
FROM branch AS b 
RIGHT JOIN 
employee AS e
ON e.emp_id = b.mgr_id;

-- Window Functions 
-- Using aggregations for windowing
-- Rank , Dense_rank, row_number , Lead and Lag 
USE windows;
SELECT * FROM employee;

-- we will use OVER clause in the window function 

SELECT dept_name,MAX(salary) FROM employee
GROUP BY dept_name;

-- We want all the details about the people who have the 
-- maximum salary 
SELECT e.*, MAX(salary) OVER(PARTITION BY dept_name)
AS max_salary
FROM employee AS e; 

-- ROW NUMBER 
SELECT e.*,
ROW_NUMBER() OVER() AS RN
FROM employee AS e;

-- ROW NUMBERS FOR SEPARATE DEPARTMENT 
SELECT e.*,
ROW_NUMBER() OVER(PARTITION BY dept_name) AS RN
FROM employee AS e;

-- both 
SELECT e.*,
ROW_NUMBER() OVER(PARTITION BY dept_name) AS RN,
ROW_NUMBER() OVER() AS RNT
FROM employee AS e;

-- Fetch the first two employees from the each departemnt 
SELECT e.*, 
ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id) AS RN
FROM employee AS e;
-- SUBQUERY
SELECT * FROM (SELECT e.*, 
ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id) AS RN
FROM employee AS e) AS x 
WHERE x.RN<3;

-- Rank(), Dense_rank() , lead() and Lag().

-- Fetch the Eployees according to their salaries (Use RANK() function)

SELECT e.*,
RANK() OVER(ORDER BY salary DESC) AS RNK
FROM employee AS e;

-- DENSE RANK 
SELECT e.*,
DENSE_RANK() OVER(ORDER BY salary DESC) AS DRNK
FROM employee AS e;

-- both with combination
SELECT e.*,
RANK() OVER(ORDER BY salary DESC) AS RNK,
DENSE_RANK() OVER(ORDER BY salary DESC) AS DRNK
FROM employee AS e;

-- Rank the employees by the salary in each of the departemnts. Taken into the considerations
SELECT e.*,
RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS RNK
FROM employee AS e;

-- Fetch the top 3 employees from each department earning the maximum salary 

SELECT * FROM (SELECT e.*,
RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS RNK
FROM employee AS e) AS x
WHERE x.RNK<4; 

-- Checking the difference between the RANK(), DENSE_RANK() and ROW_NUMBER()

SELECT e.*,
RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS RNK,
DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS DRNK,
ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY salary DESC) AS RN
FROM employee AS e;

-- LEAD() AND LAG()
-- LEAD()
SELECT e.*,
LAG(salary) OVER(ORDER BY emp_id) AS previous_employee_salary
FROM employee AS e;

-- LAG()
SELECT e.*,
LEAD(salary) OVER(ORDER BY emp_id) AS next_employee_salary
FROM employee AS e;

-- COMBINATION OF BOTH 
SELECT e.*,
LAG(salary) OVER(ORDER BY emp_id) AS previous_employee_salary,
LEAD(salary) OVER(ORDER BY emp_id) AS next_employee_salary
FROM employee AS e;

-- Fill the NULL values with zero where there are no records 
SELECT e.*,
LAG(salary,1,0) OVER(ORDER BY emp_id) AS previous_employee_salary
FROM employee AS e;

-- We can also use the partition by in this 
SELECT e.*,
LAG(salary,1,0) OVER(PARTITION BY dept_name ORDER BY salary) AS previous_employee_salary
FROM employee AS e;

-- Fetch a query to display the salary of an employee is lower, higher or 
-- equal to the previous employee.
SELECT e.*,
LAG(salary,1,0) OVER(PARTITION BY dept_name ORDER BY emp_id) AS previous_employee_salary,
CASE WHEN e.salary > LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN
"Higher than Previous Employee salary"
WHEN e.salary < LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN
"Lower than Previous Employee salary"
WHEN e.salary = LAG(salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN
"Same as Previous Employee Salary"
END AS salary_range
FROM employee AS e;





