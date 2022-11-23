--Q1.

SELECT
    grade,
    salary
FROM employees
WHERE grade IS NULL AND salary IS NULL;

--Q2.
SELECT 
    department,
    CONCAT(first_name, ' ', last_name)
FROM employees
ORDER BY department, last_name


--Q3.
SELECT *
FROM employees 
WHERE last_name LIKE 'A%'
ORDER BY salary DESC NULLS LAST
LIMIT 10;


--Q4.
SELECT
    count(*),
    department
FROM employees 
WHERE start_date BETWEEN '2003-01-01' AND '2003-12-31'
GROUP BY department


--Q5.
SELECT 
    department,
    fte_hours,
    count(*)
FROM employees 
GROUP BY department, fte_hours
ORDER BY department, fte_hours;


--Q6.
SELECT
    pension_enrol,
    count(*)
FROM employees
GROUP BY pension_enrol;


--Q7.
SELECT
    *
FROM employees 
WHERE department = 'Accounting' AND pension_enrol = FALSE
ORDER BY salary DESC NULLS LAST
LIMIT 1;


--Q8.
SELECT
    country,
    count(*),
    avg(salary) AS avg_salary
FROM employees
GROUP BY country
HAVING count(country) > 30
ORDER BY avg_salary DESC


--Q9.
SELECT
    first_name,
    last_name,
    fte_hours,
    salary,
    fte_hours * salary AS effective_yearly_salary
FROM employees 
WHERE (SELECT 
        fte_hours * salary) > 30000
        
        
--Q10.
SELECT *
FROM teams as t
INNER JOIN employees as e 
ON t.id = e.team_id
WHERE (name = 'Data Team 1') OR (name = 'Data Team 2')


--Q11.
SELECT
    first_name,
    last_name
FROM employees AS e
LEFT JOIN pay_details AS p 
ON e.pay_detail_id = p.id
WHERE local_tax_code IS NULL


--Q12.
SELECT
    (48 * 35 * CAST(charge_cost AS INT) - salary) * fte_hours AS expected_profit
FROM employees AS e
FULL JOIN teams AS t
ON e.team_id = t.id


--Q13.
                            
SELECT first_name, last_name, salary
FROM    employees
WHERE   (country = 'Japan') AND
        (fte_hours = (  SELECT fte_hours
                        FROM employees
                        GROUP BY fte_hours
                        ORDER BY count(*) ASC 
                        LIMIT 1))
ORDER BY salary
LIMIT 1;


--Q14.
SELECT
    department,
    count(*)
FROM employees
WHERE  first_name IS NULL
GROUP BY department
HAVING count(*) >= 2


--Q15.
SELECT
    first_name,
    count(*)
FROM employees
WHERE first_name IS NOT NULL
GROUP BY first_name
HAVING count(*) > 1
ORDER BY count(*) DESC, first_name


--Q16.
WITH dep_total AS (
    SELECT  department, count(*) AS dept_total_employees
    FROM    employees
    GROUP BY department)
SELECT  e.department,
        count(*) AS dept_grade1_count,
        dg.dept_total_employees,
        (count(*) / CAST(dg.dept_total_employees AS REAL)) AS proportion
FROM employees AS e
    LEFT JOIN dep_total AS dg
        ON e.department = dg.department
WHERE grade = 1
GROUP BY e.department, dg.dept_total_employees



--EXTENSION 

--Q1.





