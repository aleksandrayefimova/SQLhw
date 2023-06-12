 -- 1 уровень сложности: используя схему HR решите ряд задач
use hr;
-- Найти количество сотрудников в каждом департаменте. Вывести departmentid и employeescnt
SELECT
    department_id,
    count(employee_id) as employeescnt
FROM employees
GROUP BY department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести departmentname и employeescnt
SELECT 
	t1.department_name,
	count(t2.employee_id) as employeescnt
from departments t1
LEFT JOIN employees t2
on t1.department_id= t2.department_id
GROUP BY department_name;


-- Найти количество сотрудников у каждого менеджера. Вывести managerid и employeescnt

SELECT DISTINCT
	t2.manager_id,
    (SELECT
    count(*)
	FROM employees t2
    WHERE t2.manager_id = t1.employee_id ) as employeescnt
FROM employees t1
INNER JOIN employees t2
on t1.employee_id = t2.manager_id;


-- Найти количество сотрудников у каждого менеджера. Вывести firstname,  lastname и employees_cnt
SELECT DISTINCT
	t1.first_name as manager_first_name,
    t1.last_name as manager_last_name,
    (SELECT
    count(*)
	FROM employees t2
    WHERE t2.manager_id = t1.employee_id ) as employeescnt
FROM employees t1
INNER JOIN employees t2
on t1.employee_id = t2.manager_id;


-- --  Найти максимальную зарплату в каждом департаменте. Вывести departmentid и maxsalary
SELECT
    department_id,
    max(salary)
FROM employees
GROUP BY department_id;


-- Найти сотрудников, у которых наибольшая зарплата в их  департаменте
SELECT
    t1.last_name
FROM employees t1
INNER JOIN (SELECT
    department_id,
    max(salary) as max_s
FROM employees
GROUP BY department_id) t2
on t1.employee_id = t2.employee_id
and t1.salary = t2.max_s;





