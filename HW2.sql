USE learn;
-- Создать таблицу students с полями:
-- name (не null)
-- lastname (не null)
-- avg_mark (от 0 до 5)
-- gender varchar(128) (или “M” или “F”)
CREATE TABLE students(
		name VARCHAR (128) NOT NULL,
        lastname VARCHAR (128) NOT NULL,
        avg_mark NUMERIC(2,1) CHECK (avg_mark BETWEEN 0 AND 5),
        gender VARCHAR (128) CHECK (gender IN ('M','F' )));

SELECT * FROM students;

-- Добавить 5 записей студентов
-- Олег Петров 4.3 M
-- Семен Степанов 3.1 M 
-- Ольга Семенова 4.7 F 
-- Игорь Романов 3.1 M 
-- Ирина Иванова 2.2 F
 INSERT INTO students (name,lastname, avg_mark, gender) 
		VALUES
        ('Олег','Петров', 4.3 , 'M'),
		('Семен','Степанов', 3.1 , 'M'),
        ('Ольга','Семенова', 4.7 , 'F'),
		('Игорь','Романов', 3.1 , 'M'),
        ('Ирина','Иванова', 2.2 , 'F');
 ALTER TABLE students 
 ADD COLUMN id INTEGER PRIMARY KEY AUTO_INCREMENT;
 
 ALTER TABLE students
 MODIFY COLUMN gender CHAR(1);
-- 3. Добавить поле id integer primary key auto_increment
-- Поменять тип у gender на char(1)
-- Переименовать поле name на firstname
ALTER TABLE students
CHANGE name firstname VARCHAR (128);

-- - найти учеников, у которых оценка больше 4
SELECT 
	*
FROM students
WHERE avg_mark >4;
-- - найти учеников, у которых не входит в диапазон от 3 до 4
SELECT 
	*
FROM students
WHERE avg_mark NOT BETWEEN 3 AND 4;
-- - найти учеников, у которых имя начинается на И
SELECT 
	*
FROM students
WHERE firstname LIKE 'И%';
-- - найти учеников, у которых оценка 2.2 или 3.1 или 4.7   
SELECT
*
FROM students
WHERE avg_mark IN( 2.2, 3.1, 4.7 );

-- Создать представление, которое содержит всех мужчин
CREATE VIEW  v_men as	
	SELECT 
		*
	FROM students
	WHERE gender ='M';

SELECT * FROM v_men;
-- Создать представление, которое содержит всех женщин
CREATE VIEW v_woman as
	SELECT 
		*
	FROM students
	WHERE gender ='F';

-- Увеличить всем учащимся оценку в 10 раз

ALTER TABLE students
DROP CHECK students_chk_1; -- удалить check

ALTER TABLE students
MODIFY COLUMN avg_mark NUMERIC(4,2);  

UPDATE students
SET avg_mark = avg_mark  * 10;


-- Поменяйте у Олега Петрова фамилию на Сидоров
UPDATE students
SET lastname ='Сидоров'
WHERE firstname = 'Олег' AND lastname= 'Петров';


-- Для всех учеников, у которых оценка не больше 31 увеличить на 10
UPDATE students
SET avg_mark = avg_mark  + 10
WHERE avg_mark<=31;

-- Найти набор уникальных оценок
SELECT DISTINCT
	avg_mark
FROM students;