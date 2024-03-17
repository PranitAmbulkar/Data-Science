CREATE TABLE agent_comission(
agent_code int PRIMARY KEY,
F_name VARCHAR(20),
L_name VARCHAR(20),
city VARCHAR(20),
comission INT,
mobile_no VARCHAR(225)
);
SELECT * FROM agent_comission;
DESCRIBE agent_comission;
DROP TABLE agent_comission;

CREATE TABLE customer_details(
customer_id INT PRIMARY KEY,
c_name VARCHAR(20),
c_city VARCHAR(20),
agent_code INT,
order_date DATE
);
SELECT * FROM customer_details;

INSERT INTO agent_comission VALUES(1,"Manthan","Koli","Delhi",12000,9898454545);
INSERT INTO agent_comission VALUES(2,"Virat","Dixit","Jaipur",12150,9696123240);
INSERT INTO agent_comission VALUES(3,"Akshay","Deshmukh","Mumbai",1500,8787987810);
INSERT INTO agent_comission VALUES(4,"Sanket","Kumar","Chandigarh",120,8787988980);
INSERT INTO agent_comission VALUES(5,"Gaurav","Desai","Chennai",13020,9698989560);
INSERT INTO agent_comission VALUES(6,"Sai","Jain","Shimla",65650,7875747971);
INSERT INTO agent_comission VALUES(7, "Saurabh", "Kumar", "Kanpur", 35460, 6568696263);
INSERT INTO agent_comission VALUES(8, "Sonal", "Shaha", "Banglore", 65640, 8587898684);
INSERT INTO agent_comission VALUES(9, "Diya", "Kaur", "Delhi", 98980,8485868182);
INSERT INTO agent_comission VALUES(10, "Aryan", "Wagh", "Kolkata", 65972, 9698959192);

-- FOR INSERTING THE DATA INTO THE CUSTOMER DETAILS TABLE 
INSERT INTO customer_details VALUES(101,"Nick Rimando","New York",2, "2009-01-13");
INSERT INTO customer_details VALUES(102,"Brad Davis","New York",1, "2010-03-05");
INSERT INTO customer_details VALUES(103,"Graham Zhusi","California",5, "2010-07-20");
INSERT INTO customer_details VALUES(104,"Julian Green","London",8, "2010-04-10");
INSERT INTO customer_details VALUES(105,"Fabian Johnson","Paris",9, "2010-08-28");
INSERT INTO customer_details VALUES(106,"Geoff Cameron","Berlin",5, "2010-05-15");
INSERT INTO customer_details VALUES(107, "Sai", "chennai", 7, '2010-02-07');
INSERT INTO customer_details VALUES(108, "Jozy Altidor", "Moscow", 6, '2011-08-01');
INSERT INTO customer_details VALUES(109, "Brad Guzan", "London",3, '2009-06-19');
INSERT INTO customer_details VALUES(110, "deepu kumar","Delhi",8, '2010-08-12');
INSERT INTO customer_details VALUES(111, "dev singh", "Punjab", 5, '2010-11-11');
INSERT INTO customer_details VALUES(112, "vani kapoor", "Delhi", 3, '2010-06-17');
INSERT INTO customer_details VALUES(113, "suraj", "Goa", 7, '2011-02-10');
--  Display the output where the city is Delhi from the Agent Commission table.
SELECT * FROM agent_comission 
WHERE city="Delhi";

-- 5. Display output where the commission of the agent is greater than 15000.
SELECT * FROM agent_comission 
WHERE comission>15000;

-- 6. Give the output columns where the city is Mumbai.
SELECT * FROM agent_comission 
WHERE city="Mumbai";
USE CASESTUDY;
-- 7. Display the output by a specified agent code 4.
SELECT * FROM agent_comission 
WHERE agent_code=4;

-- 8. Show the output by ordering the First name in the agent commission table.
SELECT * FROM agent_comission
ORDER BY f_name;

SELECT * FROM agent_comission 
ORDER BY F_name DESC;

-- 9. Display the limited number of rows in output using LIMIT.
SELECT * FROM agent_comission 
ORDER BY F_name DESC LIMIT 5;

-- 10. Count and show the number of cities in the agent commission table.
SELECT COUNT(DISTINCT city) AS `COUNT OF CITIES `FROM agent_comission;

-- Show the agent details of who is getting a minimum commission.
SELECT MIN(comission) FROM agent_comission;

SELECT * FROM agent_comission 
WHERE comission=(SELECT MIN(comission) FROM agent_comission);


-- Display the total amount of commission by using SUM.
SELECT SUM(comission) FROM agent_comission;

-- Show the average commission of agents.
SELECT AVG(comission) FROM agent_comission;

-- Group the rows by city and count the agent code in the agent commission table.
SELECT city,COUNT(agent_code) FROM agent_comission 
GROUP BY city;


-- Convert mobile no into Integer from agent commission table using CAST function.
SELECT f_name,CAST(mobile_no AS UNSIGNED INT)
FROM agent_comission; 

-- Display the Output where the order date
-- is greater than 2010-01-01 from the customer details table.
SELECT * FROM customer_details 
WHERE order_date > "2010-01-01";

-- Concat the First name and Last name of the agent commission table.
SELECT a.*, CONCAT(f_name," ",l_name) AS `FULL NAME`FROM agent_comission a ;

-- Create a histogram of the commission column by 
-- creating a bin and ordering the output by agent code.
SELECT agent_code,floor(comission/100)*100 AS bin, COUNT(*) FROM
agent_comission GROUP BY agent_code ORDER BY 1;

USE casestudy;
-- 19. Replace the city Chandigarh with Haryana in the agent commission table.
SELECT * FROM agent_comission;
UPDATE agent_comission 
SET city="Haryana" WHERE city="Chandigarh";

-- 20. Create the sample table Orders with columns OrderID, OrderNumber, and PersonID.
-- 21. Assign Primary Key and Foreign key.
CREATE TABLE persons(
person_id INT NOT NULL,
person_name VARCHAR(20),
person_address VARCHAR(25),
PRIMARY KEY(person_id));

DESCRIBE persons;

CREATE TABLE orders(
order_id INT NOT NULL,
order_number INT NOT NULL,
person_id INT,
PRIMARY KEY(order_id),
FOREIGN KEY(person_id) REFERENCES persons(person_id));
DESCRIBE orders;

-- 22. Perform left join operation on Agent commission and Customer details table.
SELECT * FROM agent_comission;
SELECT * FROM customer_details;

SELECT c.customer_id,c.c_name,a.agent_code,a.F_name
FROM agent_comission AS a 
LEFT JOIN 
customer_details AS c
ON c.agent_code=a.agent_code;

-- 23. Perform Right join and Inner join operations on Agent commission and Customer details table.
SELECT c.*,a.*
FROM customer_details AS c
RIGHT JOIN 
agent_comission AS a
ON c.agent_code=a.agent_code;

-- 24. Perform Union clause on  Agent commission and Customer details table.

SELECT agent_code FROM agent_comission
UNION
SELECT customer_id FROM customer_details;

SELECT agent_code,CONCAT(F_name," ",L_name) AS `FULL NAME`,city FROM agent_comission
UNION ALL
SELECT customer_id,c_name,c_city FROM customer_details;

--  Use the CASE function to show the details of agents with a 
-- commission greater than 12000 and agent code 1 from the 
-- agent commission table.

SELECT agent_code,comission,
(CASE 
    WHEN comission>12000
	THEN "The Comission is greater than 12000"
    WHEN agent_code=1
    THEN "The agent code is 1"
    ELSE 
      "The comission is lesser than 12000"
      END) AS DESCRIPTION
FROM agent_comission;

select * from agent_comission;

-- 26. Display the output of the commission which has the count 1.

SELECT agent_code,COUNT(comission)
FROM agent_comission
GROUP BY agent_code
HAVING COUNT(comission)=1;

-- 27. Perform the window function using OVER, 
-- PARTITION BY and ROW_NUMBER on the agent commission table.

-- 28. Generate a unique rank for each row in a table based on the specified value.
-- e.	Find out Matching String 
-- f.	Find out the match of the beginning of the string.
-- g.	Match zero or one instance of the strings preceding.
 -- h.	Matches any of the patterns.
SELECT * FROM agent_comission
WHERE city REGEXP"Delhi";

-- MATCHING EXPRESSION 

-- 29. Create a temporary table sales sum with columns product_namr, 
-- total_sales, 
-- avg_unit_price and   total_units_sold and insert values into it.



-- TEMPORARY TABLE
CREATE  TEMPORARY TABLE salessum(
product_name VARCHAR(15) NOT NULL,
total_sales DECIMAL(12,2) NOT NULL,
avg_unit_price DECIMAL(7,2) NOT NULL,
total_units INT NOT NULL DEFAULT 0);

INSERT INTO salessum VALUES("Cucumber",100.23,90,2);
SELECT * FROM salessum;

-- -- 30. Show the details of the agent commission whose 
-- city is Delhi using VIEW.
SELECT * FROM agent_comission
WHERE city="Delhi";

CREATE VIEW delhi_comission AS 
SELECT * FROM agent_comission
WHERE city="Delhi";

SELECT * FROM delhi_comission;

-- 31. Create an index from the agent commission table 
-- using the city and First name.

-- INDEX IS USED FOR THE SHUFFLE KIND OF THING.

CREATE INDEX city_centre 
ON
agent_comission(city,F_name);

SELECT * FROM agent_comission;

SHOW INDEX FROM agent_comission;

-- TO COUNT THE TABLES IN THE SCHEMA 
SELECT count(*) AS TOTALNUMBEROFTABLES FROM 
INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'casestudy';

