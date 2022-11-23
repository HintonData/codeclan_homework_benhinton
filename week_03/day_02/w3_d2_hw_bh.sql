--1.
--a)

SELECT
    first_name,
    last_name,
    t."name"
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id


--b)
SELECT
    first_name,
    last_name,
    t."name"
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
WHERE pension_enrol = TRUE


--c)
SELECT
    first_name,
    last_name,
    t."name"
FROM employees AS e
INNER JOIN teams AS t
ON e.team_id = t.id
WHERE CAST(charge_cost AS INTEGER) > 80;


--2.
--a)
SELECT
    e.*,
    p.local_account_no ,
    p.local_sort_code 
FROM employees AS e
FULL JOIN pay_details AS p 
ON e.pay_detail_id = p.id;


--b)
SELECT *
FROM employees AS e
FULL JOIN pay_details AS p 
ON e.pay_detail_id = p.id
INNER JOIN teams as t 
ON e.team_id = t.id;



--3. a)
SELECT 
    e.team_id, e.id, t.name
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id;


--b)
SELECT 
    count(e.id), t.name
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name;


--c)
SELECT 
    count(e.id), t.name
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
ORDER BY count(e.id);


--4
--a)
SELECT 
    count(e.id), t.name, t.id
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
ORDER BY count(e.id);

--b)
SELECT
    count(e.id), t.name, t.id, 
    CAST(t.charge_cost AS INT) * count(e.id) AS 
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
ORDER BY count(e.id);

--c)
SELECT
    count(e.id), t.name, t.id, 
    CAST(t.charge_cost AS INT) * count(e.id) AS 
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
ORDER BY count(e.id)
WHERE (SELECT CAST(t.charge_cost AS INT) * count(e.id) AS ) > 5000)
FROM employees AS e
JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.id
HAVING )


SELECT
 t.id AS team_id,
 t."name" AS team_name,
 count(e.id) AS members,
 count(e.id) * CAST(t.charge_cost AS int) AS total_day_charge
FROM employees AS e
 INNER JOIN teams AS t
 ON e.team_id = t.id
GROUP BY t.id, team_name
HAVING (count(e.id) * CAST(t.charge_cost AS int)) > 5000
ORDER BY total_day_charge ASC;

