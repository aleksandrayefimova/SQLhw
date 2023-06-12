create database learn2;
use learn2;
select * from students;
CREATE TABLE students(id int primary key auto_increment, name varchar(128) not null, age int);
create table teachers(id int primary key auto_increment, name varchar(128) not null, age int);
create table competencies(id int primary key auto_increment, title varchar(128) not null);
create table teachers2competencies(id int primary key auto_increment, teacher_id int, competencies_id int);
create table courses(id int primary key auto_increment, teacher_id int, title varchar(128) not null, headman_id int); 
create table students2courses(id int primary key auto_increment, student_id int, course_id int);
insert into students(name, age) values('Анатолий',29),('Олег',25),('Семен',27),('Олеся',28),('Ольга',31),('Иван',22);
INSERT INTO `teachers` VALUES (1,'Петр ',39),(2,'Максим ',35),(3,'Антон ',37),(4,'Всеволод ',38),(5,'Егор ',41),(6,'Светлана ',32); 
INSERT INTO `competencies` VALUES (1,'Математика'),(2,'Информатика'),(3,'Программирование'),(4,'Графика'); 
INSERT INTO `teachers2competencies` VALUES (1,1,1),(2,2,1),(3,2,3),(4,3,2),(5,4,1),(6,5,3); 
INSERT INTO `courses` (teacher_id, title, headman_id)
VALUES
  (1, 'Алгебра логики', 2),
  (2, 'Математическая статистика', 3),
  (4, 'Высшая математика', 5),
  (5, 'Javascript', 1),
  (6, 'Базовый Python', 1); 
 INSERT INTO `students2courses` (student_id, course_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 2),
  (3, 3),
  (4, 5); 
  
-- 1) Вывести имена студентов и курсы, которые они проходят
SELECT
    t1.name,
    t3.title
FROM students t1
LEFT JOIN students2courses t2
on t1.id =t2.student_id
LEFT JOIN courses t3
on t2.course_id = t3.id;

-- 2) Вывести имена всех преподавателей с их компетенциями
SELECT
    t1.name,
    t3.title
FROM teachers t1
LEFT JOIN teachers2competencies t2
on t1.id= t2.teacher_id
LEFT JOIN competencies t3
on t2.competencies_id = t3.id;

-- 3) Найти преподавателя, у которого нет компетенций
SELECT
    t1.name
FROM teachers t1
LEFT JOIN teachers2competencies t2
on t1.id= t2.teacher_id
WHERE t2.competencies_id IS NULL;

-- 4) Найти имена студентов, которые не проходят ни один курс
SELECT
    t1.name
FROM students t1
LEFT JOIN students2courses t2
on t1.id =t2.student_id
WHERE t2.course_id is NULL;

-- 5) Найти курсы, которые не посещает ни один студент
SELECT
    *
FROM courses t1
LEFT JOIN students2courses t2
on t1.id = t2.course_id
WHERE t2.student_id is NULL;


-- 6) Найти компетенции, которых нет ни у одного преподавателя
SELECT
    *
FROM competencies t1
LEFT JOIN teachers2competencies t2
on t1.id = t2.competencies_id
WHERE t2.teacher_id is NULL;

-- 7) Вывести название курса и имя старосты
SELECT
    t1.title,
    t2.name
FROM courses t1
inner JOIN students t2
on t1.headman_id = t2.id;

-- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
SELECT
    t1.name student,
    t4.name headman
FROM students t1
LEFT JOIN students2courses t2
on t1.id = t2.student_id
LEFT JOIN courses t3
on t2.course_id = t3.id
LEFT JOIN students t4
on t3.headman_id = t4.id
 
  
