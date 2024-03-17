CREATE DATABASE test;
-- This is the command to create the database 

USE test;      
-- This command is used to use the desired database from all the schema
-- USE is the SQL command while followed by the database name   

CREATE TABLE student(
studentid INT,
height float,
name VARCHAR(225)
); 

SELECT * FROM dummy;

DROP TABLE dummy;      
-- THIS COMMAND IS USED FOR DROPPING THE TABLE SIMILARLY WE CAN DROP THE DATABASE ALSO


CREATE TABLE dummy(
dummyname VARCHAR(225)
);	

USE test;	

DROP DATABASE test;

-- WE WILL CREATE THE NEW SCHEMA AND THE NEW TABLE 

CREATE DATABASE classroom;
USE classroom;

CREATE TABLE Students(
studentID INT,
fname VARCHAR(225),
lname VARCHAR(225),
gender VARCHAR(225),
height VARCHAR(225)
);

SELECT * FROM Students;

-- NOW WE WILL INSERT THE DATA INTO THE TABLE 

INSERT INTO Students VALUES(1,'RAVI','DAHIYA','M',5.6);
INSERT INTO Students VALUES(2,'KISHAN','KUMAR','M',5.7);
INSERT INTO Students VALUES(3,'CHANDRAKANT','SAHU','M',5.8);
INSERT INTO Students VALUES(4,'SOHAIL','JAIN','M',5.9);
INSERT INTO Students VALUES(5,'RUDRA','PRATAP','M',6.6);

SELECT * FROM Students;


DROP TABLE classroom.students;
-- this command is used to drop the table from the database 
-- drop means permenantly delete the database table.

-- Now we are creating the new table 

CREATE TABLE classroom.student_info(
student_id INT PRIMARY KEY,
name VARCHAR(225) NOT NULL,
major VARCHAR(225) UNIQUE
);
-- REMEMBER HERE THE UNIQUE IS THE CONSTRAINT HERE.
SELECT * FROM student_info;

-- UPDATE Query 

INSERT INTO student_info
VALUES(1,'Ashish Devnar','English');

INSERT INTO student_info
-- VALUES(2,'Rachin Ravindra','Maths');
-- VALUES(3,'Kane Williamson','Geography');
VALUES(4,'Josh Hazelwood','Science');

-- UPDATE QUERY 
UPDATE student_info
SET major='Social Science' WHERE name='Kane Williamson';

-- UPDATE QUERY WITH OR CLAUSE 
USE classroom;
SELECT * FROM student_info;

-- this will change either the majors are maths or the science if any one of the 
-- condition will be true it will make the changes.
UPDATE student_info
SET major='SocialScience'
WHERE major='Maths' OR major='Science';

select * from student_info;















-- DELETE COMMAND 
-- WE CAN DELETE THE DATA FROM THE TABLE USING THE WHERE CLAUSE 
DELETE FROM student_info 
WHERE name='Ashish Devnar';							

-- ALIAS (we can use the alias nameif the table name is so lengthy)
SELECT S.major, S.name FROM student_info AS S;
						
-- ORDER BY 

SELECT major,name FROM student_info
ORDER BY name ASC;

SELECT name,major FROM student_info
ORDER BY name DESC;

-- LIMIT clause is used for limiting the records according to the specified number.
SELECT name,major FROM student_info
ORDER BY name DESC LIMIT 3;

-- operators in sql 
SELECT * FROM student_info AS s;

SELECT s.name , s.major FROM student_info AS s
WHERE major="Geography";

-- NOT EQUAL TO 
SELECT s.name , s.major FROM student_info AS s
WHERE major<>"Geography";

CREATE TABLE students(
student_id INT ,
name VARCHAR(55),
major VARCHAR(55)
);
USE classroom;
SELECT * FROM students;


-- It will go ahead display where the both conditions have been true 
SELECT * FROM students
WHERE student_id >= 2 AND name<>'Jack';
