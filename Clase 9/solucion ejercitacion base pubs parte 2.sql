-- Consultas agrupadas 

-- 21. Contar la cantidad de autores que su estado de residencia sea 
-- California (CA). Poner un apodo al nombre de columna. 
select 	count(au_id) as 'cantidad de autores' 
from 	authors
where	state = 'ca';


-- 22. Mostrar la fecha de inicio de facturación y el último número de 
-- comprobante emitido. Poner un apodo a cada columna. 
select	min(ord_date) as 'Inicio de facturación',
		max(ord_num) as 'último comprobante'
from	sales;

-- 23.  Contar la cantidad de países que residen alguna editorial. 
select count(distinct country) from publishers;


-- 24. Listar las categorías de libros y el valor promedio para cada 
-- tipo de libro. 
select		type categoria,
			round(avg(price), 2) promedio
from		titles
group by	type;


-- 25. ldem ejercicio 24 pero no incluir dentro de la lista los libros 
-- que no tienen decidida una categoría. 
select		type categoria,
			round(avg(price), 2) promedio
from		titles
where		type <> ''
group by	type;


-- 26.  Listar los locales que hayan vendido más de 100 libros. 
select		st.stor_name tienda,
			sum(s.qty) as 'ventas por tienda'
from		stores st
inner join	sales s on st.stor_id = s.stor_id
group by	st.stor_name
having		sum(s.qty) > 100;

-- 27. Listar la cantidad de ejemplares vendidos de cada libro en cada 
-- tienda. Poner apodos a las columnas. 
select		stor_name tienda,
			title libro,
			sum(qty) ventas
from		stores st 
inner join	sales s on st.stor_id = s.stor_id
inner join	titles t on s.title_id = t.title_id
group by	stor_name, title;


-- 28.	  Listar el valor promedio de los libros agrupados por tipo de 
-- libro cuyo promedio de precio esté entre 12 y 14. Poner alias a los encabezados. 
-- Ordenar la consulta por promedio. 
select		type categoria,
			round(avg(price), 2) promedio
from		titles
group by	type
having		promedio between 12 and 14
order by	2 desc; 

-- 29.	  Listar las categorías de libros junto con el precio del libro 
-- más caro, el más barato y la cantidad de libros existentes para esa 
-- categoría. Mostrar solo aquellas categorías de libros cuyo precio de 
-- los libros económicos sea inferior a $10 Y cuya cantidad de libros 
-- pertenecientes sean mayor a 2. 
select		type categoria,
			max(price) 'libro mas caro',
			min(price) 'libro mas barato',
			count(title_id) cantidad
from		titles
group by	type
-- having		min(price) < 10 and count(title_id) > 2;
having		min(price) < 10 and cantidad > 2;


-- 30.	 Contar la cantidad de empleados que trabajen en la compañía
select count(emp_id) as 'cantidad de empleados' from employee;
