CREATE DATABASE market;
USE market;
CREATE TABLE products(
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128),
    price INTEGER,
    discount DECIMAL(2,1)
    );
    INSERT INTO
		products (title,price, discount)
	VALUES 
		('велосипед', 50000, 0.9),
		('ролики', 15000, 0.1),
		('лыжи', 2500, null),
		('самокат', 30000, 0.8),
		('сноуборд', 30000, 0.9),
		('санки', 1000, null);
	SELECT 
		*
	FROM products;
    SELECT 
		title,
        price
	FROM products;
    SELECT 
		*
	FROM products
    WHERE price = 50000;
    SELECT 
		title
    FROM products
    WHERE price = 50000;
    SELECT 
		*	
	FROM products
    WHERE price = 50000
    AND title = 'велосипед';

    