 create database TMP;
 
 
 CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(20),
    lastname VARCHAR(20),
    gender char(1) check(gender in ('f', 'm')),
    age integer
);
use TMP;

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    customerid integer,
    productid integer,
    ordertype varchar(128),
    product_count integer
);


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title varchar(128),
    price numeric(8, 2)
);


INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 2, 'online', 5);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 1, 'direct', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 4, 'direct', 6);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 3, 'direct', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 4);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 7, 'online', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 9, 'online', 7);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (6, 5, 'direct', 4);


INSERT INTO customers (name, lastname, age, gender) VALUES ('Гайк', 'Инанц', 29, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Максим', 'Грибов', 32, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Антон', 'Куликов', 27, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Юрий', 'Митрофанов', 30, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Нелли', 'Ефремян', 25, 'f');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Ольга', 'Степанова', 35, 'f');


INSERT INTO products (title, price) VALUES ('молоко', 70);
INSERT INTO products (title, price) VALUES ('колбаса', 230);
INSERT INTO products (title, price) VALUES ('хлопья', 150);
INSERT INTO products (title, price) VALUES ('хлеб', 30);
INSERT INTO products (title, price) VALUES ('масло', 120);
INSERT INTO products (title, price) VALUES ('чипсики', 60);
INSERT INTO products (title, price) VALUES ('шоколад', 70);
INSERT INTO products (title, price) VALUES ('кетчуп', 150);
INSERT INTO products (title, price) VALUES ('яблоко', 70);


-- 1) вывести название продукта, который чаще всего встречается в заказах

select 
	title
from products 
where id =(
	select 
		productid 
	from  orders 
	group by productid 
	order by 	count(productid)  desc 
	limit 1);


-- 2) вывести название продукта, который покупают чаще всего (нужно посчитать общее количество купленных единиц)

select 
	title
from products 
where id =(
	select 
		product_id 	
	from orders 
	group by product_id 
	order  by sum(product_count)  desc 
	limit 1);

-- 3) вывести общую выручку магазина. Сумма всех купленных единиц товара.
select 
	sum(total_sum_of_product) as whole_sum
from(
	select 
		t1.title,
		t2.product_count *t1.price as total_sum_of_product
	from  products t1
	inner join orders t2
	on t1.id =t2.productid 
	group  by t2.productid ,total_sum_of_product) table_;
	

-- 4) определить сумму выручки за онлайн продажи (online) и за продажи в магазине (direct)
select 
	ordertype,
	sum(total_amount) money_total
from(
	select 
		t1.ordertype ,
		t1.product_count *t2.price  as total_amount 
	from  orders t1
	inner join products t2
	on t1.productid =t2.id ) orders_wholesum
	group by ordertype;




