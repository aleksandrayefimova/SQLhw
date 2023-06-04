-- Найти департаменты в которых есть работники, зарабатывающие больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) 
-- (использовать метод max)

SELECT department_id, MAX(CASE WHEN salary > 10000 THEN 1 ELSE 0 END) AS has_high_earners
FROM employees
GROUP BY department_id;


-- Найти департаменты в которых все работники зарабатывают больше 10 000. В результате 
-- выборки формируются два поля (department_id и поле со значениями 1 или 0) 
-- (использовать метод min)
 SELECT department_id, MIN(CASE WHEN salary > 10000 THEN 1 ELSE 0 END) AS all_earnings_above_10k
FROM employees
GROUP BY department_id;

-- Отсортировать сотрудников по фамилии в алфавитном порядке
SELECT *
FROM employees
ORDER BY last_name ASC;

-- Отсортировать сотрудников по зарплате - от самой большой зарплаты до самой маленькой
SELECT *
FROM employees
ORDER BY salary DESC;

-- 5*. Вывести сотрудников, работающих в департаментах с id 60, 90 и 110,
-- отсортированными в алфавитном порядке по фамилии (оператор in).
select *
from employees
where department_id in (60, 90, 110)
order by last_name asc;
-- Вывести сотрудников с jobid STCLERK, отсортированными по зарплате - от самой 
-- большой зарплаты до самой маленькой.
select *
from employees
where job_id = 'ST_CLERK'
order by salary desc;
-- Вывести сотрудников, чьи имена начинаются на букву D и отсортировать их в 
-- алфавитном порядке по фамилии
select *
from employees
where first_name like "D%"
order by last_name;

-- На основе БД airports
-- Выведите данные о билетах разной ценовой категории. Среди билетов экономкласса
-- (Economy) добавьте в выборку билеты с ценой от 10 000 до 11 000 включительно. 
-- Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000
-- включительно. Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000.
-- В решении необходимо использовать оператор CASE.
-- В выборке должны присутствовать три атрибута — id, service_class, price.
use airports;
SELECT id, service_class, price
FROM tickets
WHERE
  (service_class = 'Economy' AND price BETWEEN 10000 AND 11000)
  OR (service_class = 'PremiumEconomy' AND price BETWEEN 20000 AND 30000)
  OR (service_class = 'Business' AND price > 100000);

-- Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года,
-- то отнесите его к классу 'Old'. Если самолет произведен между 2000 и 2010 годами
-- включительно, то отнесите его к классу 'Mid'. Более новые самолеты отнесите к классу 
-- 'New'. Исключите из выборки дальнемагистральные самолеты с максимальной дальностью
-- полета больше 10000 км. Отсортируйте выборку по классу возраста в порядке возрастания.
-- В выборке должны присутствовать два атрибута — side_number, age.
SELECT side_number,
       CASE
           WHEN production_year < 2000 THEN 'Old'
           WHEN production_year >= 2000 AND production_year <= 2010 THEN 'Mid'
           ELSE 'New'
       END AS age
FROM airliners
WHERE range_ <= 10000
ORDER BY age ASC;

-- Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и
-- JQF04Q8I9G. Скидка на билет экономкласса (Economy) составила 15%, на билет бизнес-класса
-- (Business) — 10%, а на билет комфорт-класса (PremiumEconomy) — 20%. Определите цену 
-- билета в каждом сегменте с учетом скидки.
-- В выборке должны присутствовать три атрибута — id, tripid, newprice.

SELECT id, trip_id,
    CASE service_class
        WHEN 'Economy' THEN price * 0.85
        WHEN 'Business' THEN price * 0.9
        WHEN 'PremiumEconomy' THEN price * 0.8
    END AS newprice
FROM tickets
WHERE trip_id IN ('LL4S1G8PQW', '0SE4S0HRRU', 'JQF04Q8I9G');




