-- 1) найдите имя и фамилию пользователей, у которых нет заказов
SELECT
*
FROM customers
WHERE id not in (SELECT distinct  customer_id from orders o );


-- 2) найдите название товаров, которые ни разу не заказывали


select
	*
from
	products p
where 	id not in (	select		product_id	from	orders o );

-- 3) найдите название товаров, которые ни разу не заказывали онлайн

select 
*
 from  products p 
 where id not in (select 
product_id 
from orders o 
where order_type = 'online' );


-- 4) найдите имя и фамилию покупателя, который сделал самый дорогой заказ
select 
*
from  customers c 
where id =(select 
	t1.customer_id 
from orders t1
inner join products t2
on t1.product_id  = t2.id 
order by t1.product_count *t2.price    desc 
limit 1
)


