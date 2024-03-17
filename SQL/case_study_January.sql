-- First we will create the database "newdb"
CREATE DATABASE newdb;
-- We will create the first table agent comission table.
CREATE TABLE agent_comission(
agent_code INT,
F_name VARCHAR(50),
L_name VARCHAR(50),
city VARCHAR(20),
comission INT,
mobile_no VARCHAR(10)
);

-- We will create the second table customer_details 
CREATE TABLE customer_details(
customer_id INT,
c_name VARCHAR(50),
c_city VARCHAR(50),
agent_code INT,
order_date DATE
);
-- Insering the data into the agent_comission table
INSERT INTO agent_comission VALUES (1, 'Manthan','Koli','Delhi',12000,9898454545);
INSERT INTO agent_comission VALUES (2, 'Virat','Dixit','Jaipur',12150,9696123240);
INSERT INTO agent_comission VALUES (3, 'Akshay','Deshmukh','Mumbai',1500,8787987810);
INSERT INTO agent_comission VALUES (4, 'Sanket','Kumar','Chandigarh',120,8789878980);
INSERT INTO agent_comission VALUES (5, 'Gaurav','Desai','Chennai',13020,9698969560);
INSERT INTO agent_comission VALUES (6, 'Sai','Jain','Shimla',65650,7875747971);

-- Inserting the data into the customer_details table 
INSERT INTO customer_details VALUES(101, 'Nick Rimando','New York',2,'2009-01-13');
INSERT INTO customer_details VALUES(102,'Brad Davis','New York',1,'2010-03-05');
INSERT INTO customer_details VALUES(103,'Graham Zusi','California',5,'2010-07-20');
INSERT INTO customer_details VALUES(104,'Julian Green','London',8,'2010-04-10');
INSERT INTO customer_details VALUES(105,'Fabian Johnson','Paris',9,'2010-08-28');
INSERT INTO customer_details VALUES(106,'Geoff Cameron','Berlin',5,'2010-05-15');

SELECT * FROM customer_details;
SELECT * FROM agent_comission;

-- 4. Display the output where the city is Delhi from the Agent Commission table.
SELECT * FROM agent_comission
WHERE city = "Delhi";

-- 5. Display output where the commission of the agent is greater than 15000.
SELECT * FROM agent_comission 
WHERE comission > 15000;

-- 6. Give the output columns where the city is Mumbai.
SELECT * FROM agent_comission
WHERE city = "Mumbai";

-- 7. Display the output by a specified agent code 4.
SELECT * FROM agent_comission
WHERE agent_code = 4;

-- 8. Show the output by ordering the First name in the agent commission table.
SELECT * FROM agent_comission 
ORDER BY F_name ASC;

-- 9. Display the limited number of rows in output using LIMIT.
SELECT * FROM agent_comission 
LIMIT 3;

-- 10. Count and show the number of cities in the agent commission table.
SELECT COUNT(city) AS `city count` FROM agent_comission;

-- 11. Show the agent details of who is getting a minimum commission.
SELECT * FROM agent_comission 
ORDER BY comission ASC 
LIMIT 1;

-- 12. Display the total amount of commission by using SUM.
SELECT SUM(comission) AS `Total Comission` 
FROM agent_comission;

-- 13. Show the average commission of agents.
SELECT AVG(comission) AS `Average Comission` 
FROM agent_comission;

-- 14. Group the rows by city and count the agent code in the agent commission table.
SELECT COUNT(agent_code) AS agent_count, city 
FROM agent_comission
GROUP BY city;

-- 15. Convert mobile no into Integer from agent commission table using CAST function.
SELECT CAST(mobile_no AS UNSIGNED INT) FROM agent_comission;

-- 16. Display the Output where the order date is greater than 2010-01-01 from the customer details table.
SELECT * FROM customer_details 
WHERE order_date > '2010-01-01';

-- 17. Concat the First name and Last name of the agent commission table.
SELECT CONCAT(F_name," ",L_name) AS `Full Name`FROM agent_comission;

-- 18. Create a histogram of the commission column by creating a bin and ordering the output by agent code.

-- 19. Replace the city Chandigarh with Haryana in the agent commission table.
UPDATE agent_comission 
SET city = 'Haryana' 
WHERE city = 'Chnadigarh';
SELECT * FROM agent_comission;

-- 20. Create the sample table Orders with columns OrderID, OrderNumber, and PersonID.
CREATE TABLE orders (
OrderID INT,
OrderNo INT,
Person_ID INT
);

-- 21. Assign Primary Key and Foreign key.
ALTER TABLE orders
ADD PRIMARY KEY(OrderID);

-- 22. Perform left join operation on Agent commission and Customer details table.
SELECT a.* FROM agent_comission as a
LEFT JOIN 
customer_details as c
ON a.agent_code = c.agent_code;

-- 23. Perform Right join and Inner join operations on Agent commission and Customer details table.
-- RIGHT JOIN 
SELECT a.* FROM agent_comission AS a
RIGHT JOIN 
customer_details AS c 
ON a.agent_code = c.agent_code;

-- INNER JOIN 
SELECT a.* FROM agent_comission AS a
INNER JOIN 
customer_details AS c 
ON a.agent_code = c.agent_code;

-- 24. Perform Union clause on  Agent commission and Customer details table.
SELECT agent_code, CONCAT(F_name," ",L_name) AS `Full Name`,city FROM agent_comission 
UNION  
SELECT agent_code, c_name, c_city FROM customer_details;

-- Rules for the union operators 
-- The number of columns must be same.
-- The datatypes of the column must be same.
-- union will remove the duplicate rows
-- union all will retain(includes) the duplicate rows.
SELECT agent_code , city FROM agent_comission
UNION
SELECT customer_id , c_city FROM customer_details;

-- 25. Use the CASE function to show the details of agents with a commission greater than 12000 
-- and agent code 1 from the agent commission table.alter

SELECT agent_code, comission,
CASE
WHEN comission > 12000 THEN 
"Comission is greater than 12000"
WHEN agent_code = 1 THEN 
"Agent Code is 1"
ELSE 
"Comission is less than 12000"
END AS Description 
FROM agent_comission;

-- 26. Display the output of the commission which has the count 1.
SELECT COUNT(comission) AS count, comission
FROM agent_comission 
GROUP BY agent_code 
HAVING count = 1;

-- 27. Perform the window function using OVER, PARTITION BY and ROW_NUMBER on the agent commission table.
SELECT a.*,
ROW_NUMBER() OVER(PARTITION BY agent_code) AS `row number`
FROM agent_comission AS a;

-- 28. Generate a unique rank for each row in a table based on the specified value.
SELECT a.*,
RANK() OVER(ORDER BY agent_code) AS rnk
FROM agent_comission AS a;

-- Temporary tables in SQL 
CREATE TEMPORARY TABLE salessum(
prodeuct_name VARCHAR(50),
total_sales DECIMAL(12,2) NOT NULL,
avg_unit_price DECIMAL(7,2) NOT NULL,
total_unit_sold INT NOT NULL DEFAULT 0
);

INSERT INTO salessum VALUES("cucumber",100.25, 90,2);

SELECT * FROM salessum;

-- view in SQL 
CREATE view DELHI_COMISSION AS 
SELECT * FROM agent_comission 
WHERE city="Delhi";

SELECT * FROM DELHI_COMISSION;

-- Index 
CREATE INDEX city_centre 
ON  
agent_comission(city, F_name);

SHOW INDEX FROM agent_comission;

-- command to view the count of the tables in schema 
SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA="newdb";







