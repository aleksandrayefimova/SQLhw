-- 1 уровень сложности: На основе БД https://github.com/NelliEfr/hr_data/blob/master/script.sql, с которой вы работале на предыдущем занатии сдлеать:

-- Вывести зарплату сотрудника с именем ‘Lex’ и фамилией ‘De Haan'.
select
salary
from employees
where first_name = "Lex" and last_name = "De Haan";
-- Вывести всех сотрудников с jobid ‘FIACCOUNT’ и зарабатывающих меньше 8000.
select
	* 
from employees
where job_id = "FI_ACCOUNT" and salary<8000;
-- Вывести сотрудников, у которых в фамилии в середине слова встречаются 
-- сочетания ‘kk’ или ‘ll’.
select
	*
from employees 
where last_name like "%kk%" or "%ll%";
-- Вывести сотрудников с commission_pct NULL.
select
	*
    from employees
    where commission_pct is NULL;
-- Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110.
select
	*
from employees
where department_id not in(80,110);
-- Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
select
	*
from employees
where salary between 5000 and 7000;
