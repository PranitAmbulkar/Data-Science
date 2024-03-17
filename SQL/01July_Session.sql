SELECT * FROM windows.employee;

USE windows;
SELECT e.*, 
ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY emp_id)AS RN
FROM employee e;

-- RANK THE EMPLOYEE BY SALARY 
SELECT e.*, 
RANK() OVER(ORDER BY salary DESC) AS RNK
FROM employee e;


-- DENSE RANK 
SELECT e.*, 
RANK() OVER(ORDER BY salary DESC) AS RNK,
DENSE_RANK() OVER(ORDER BY salary DESC) AS DNS_RNK
FROM employee e;

-- RANK THE EMPLOYEES BY SALARY BY DEPARTMENTS 
SELECT e.*,
RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY) AS RN,
DENSE_RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY) AS DNS_RN
FROM employee e;

-- FETCH THE TOP 3 EMPLOYEES IN EACH DEPT EARNINNG THE MAXIMUM SALARY 
SELECT * FROM (SELECT e.*,
RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY) AS RN
FROM employee e) AS x
WHERE x.RN<3;

-- checking the difference between rank, dense rank and row number 
SELECT e.*,
RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY) AS RN,
DENSE_RANK() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY) AS DNS_RN,
ROW_NUMBER() OVER(PARTITION BY DEPT_NAME ORDER BY SALARY) AS RON
FROM employee e;

-- LEAD AND LAG
SELECT e.*, 
LAG(salary) OVER(ORDER BY emp_id) AS prev_emp_salary,
LEAD(salary) OVER(ORDER BY emp_id) AS next_emp_salary
FROM employee e;

-- LAG
SELECT e.*,
LAG(DEPT_NAME) OVER(ORDER BY emp_ID) AS prev_dept
FROM employee e;

-- FILL THE NULL VALUES WITH 0 WHERE THERE ARE NO RECORDS 
SELECT e.*,
LAG(salary,1,0) OVER(PARTITION BY DEPT_NAME) AS prev_salary
FROM employee e;


-- FETCH A QUERY TO DISPLAY IF THE SALARY OF THE EMPLOYEE IS HIGHER,LOWER OR EQUAL TO PREVIOUS EMPLOYEE 
SELECT e.*,
LAG(salary,1,0) OVER(PARTITION BY DEPT_NAME ORDER BY emp_ID) AS prev_emp_salary,
CASE 
WHEN e.salary>LAG(salary)
OVER(PARTITION BY DEPT_NAME ORDER BY emp_ID) THEN
"Higher than previous employee salary"
WHEN e.salary<LAG(salary)
OVER(PARTITION BY DEPT_NAME ORDER BY emp_ID) THEN
"Lower than previous employee salary"
WHEN e.salary=LAG(salary)
OVER(PARTITION BY DEPT_NAME ORDER BY emp_ID) THEN
"Same as previous employee salary"
END AS sal_range
FROM employee e;
