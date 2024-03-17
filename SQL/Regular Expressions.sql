-- Regular Expression (RegEX)

SELECT * FROM agent_comission
WHERE city REGEXP "Delhi";
-- 
SELECT * FROM agent_comission
WHERE city REGEXP "h";

-- 
SELECT * FROM agent_comission
WHERE city REGEXP "ai";

-- for ending of the string 
SELECT * FROM agent_comission
WHERE city REGEXP "r$";

-- for beginnig of the string
SELECT * FROM agent_comission
WHERE city REGEXP "^D";

-- | symbol for pattern matching 
SELECT * FROM agent_comission 
WHERE city REGEXP "i|J";

SELECT * FROM agent_comission 
WHERE city REGEXP "Ja|hi";










