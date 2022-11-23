/* MVP */

/* Q1 */

SELECT *
FROM employees
WHERE department = 'Human Resources'


/* Q2 */

SELECT
    first_name,
    last_name,
    country
FROM employees
WHERE department = 'Legal'


/* Q3 */

SELECT
    COUNT(*)
FROM employees 
WHERE country = 'Portugal'


/* Q4 */

SELECT
    COUNT(*)
FROM employees 
WHERE country IN ('Portugal', 'Spain')


/* Q5 */

SELECT
    COUNT(*)
FROM pay_details 
WHERE local_account_no IS NULL



/* Q6 */

SELECT
    COUNT(*)
FROM pay_details
WHERE (local_account_no IS NULL) AND (iban IS NULL)


/* Q7 */

SELECT
    first_name,
    last_name 
FROM employees 
ORDER BY last_name ASC NULLS LAST



/* Q8 */

SELECT 
    first_name,
    last_name,
    country
FROM employees 
ORDER BY country, last_name ASC NULLS LAST



/* Q9 */

SELECT *
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC
LIMIT 10;



/* Q10 */

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE country = 'Hungary'
ORDER BY salary ASC;


/* Q11 */

SELECT
    COUNT(*)
FROM employees
WHERE first_name LIKE 'F%';


/* Q12 */

SELECT *
FROM employees 
WHERE email LIKE '%yahoo%';



/* Q13 */

SELECT
    COUNT(*)
FROM employees 
WHERE country NOT IN ('France', 'Germany');



/* Q14 */

SELECT
    MAX(salary)
FROM employees
WHERE department = 'Engineering' AND fte_hours >= 1


/* Q15 */

SELECT
    first_name,
    last_name,
    fte_hours,
    salary,
    fte_hours * salary AS "effective_yearly_salary"
FROM employees;



/* Q16 */


SELECT
    first_name,
    last_name,
    department,
    CONCAT(first_name, ' ', last_name, ' - ', department) AS badge_label
FROM employees
WHERE first_name IS NOT NULL
AND last_name IS NOT NULL
AND department IS NOT NULL


/* Q17 */

SELECT
    first_name,
    last_name,
    department,
    start_date,
    CONCAT(first_name, ' ', last_name, ' - ', department, ' (joined ', 
    (TO_CHAR(start_date, 'YYYY')), ')') AS badge_label
FROM employees
WHERE first_name IS NOT NULL
AND last_name IS NOT NULL
AND department IS NOT NULL
AND start_date IS NOT NULL





/* Q18 */

SELECT
    first_name,
    last_name,
    salary,
    CASE
    WHEN salary < 40000 THEN 'low'
    WHEN salary >= 40000 THEN 'high'
    END
    AS "salary_class"
FROM employees
WHERE salary IS NOT NULL;
    
    
