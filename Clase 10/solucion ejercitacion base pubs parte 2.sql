-- Agrupaciones
-- listar la cantidad de titulos por categoria. Informar
-- el precio mas economico, el mas caro y el promedio de 
-- cada categoria. Listar solo las categorias que no sean de 
-- cocina y cuya cantidad de titulos sea superior a 2.
select		type categoria
			,count(title_id) 'cantidad de titulos'
			,min(price) 'libro mas economico'
			,max(price) 'libro mas caro'
			,avg(price) promedio
from		titles
where		type not like '%cook%' 
group by	type
having 		count(title_id) > 2
order by	2 desc;


/*
	Cuando mezclamos en la columnas de un SELECT campo(s)
    con funciones de agrupacion, entonces DEBEMOS agrupar
    por el/los campo/s.
    
    La clausula where filtra registros condicionando campos.
    
    La clasula having filtra registros de una agrupacion
    condicionando funciones agrupadas 

*/


-- Solucion Ejercitacion Base Pubs Parte 2
-- 21  Contar la cantidad de autores que su estado de residencia sea California (CA). 
-- Poner un apodo al nombre de columna. 
select 	count(au_id) autor 
from 	authors
where	state = 'ca';-- 15

-- 22 Mostrar la fecha de inicio de facturación y el último número de 
-- comprobante emitido. Poner un apodo a cada columna. 
select	min(ord_date) 'fecha de inicio de facturación',
		max(ord_num) 'último comprobante'
from	sales;

-- 23 Contar la cantidad de países que residen alguna editorial. 
select count(distinct country) 'cantidad de paises' from publishers;

-- 24 Listar las categorías de libros y el valor promedio para cada tipo de libro. 
select 		type Categoria, 
			truncate(avg(price),2) Promedio
from 		titles
group by 	type;

-- 25. ldem ejercicio 24 pero no incluir dentro de la lista los libros que no 
-- tienen decidida una categoría. 
select type from titles;

select 		type Categoria, 
			truncate(avg(price),2) Promedio
from 		titles
where		type <> ''
group by 	type;

-- 26.  Listar los locales que hayan vendido más de 100 libros. 
select		stor_id as libreria,
			sum(qty) 'ventas x libreria'
from		sales
group by	stor_id
having		sum(qty) > 100;

-- 27. Listar la cantidad de ejemplares vendidos de cada libro en cada tienda. 
-- Poner apodos a las columnas. 
select		stor_id as libreria,
			title_id as titulo,
			sum(qty) ventas
from		sales
group by	stor_id, title_id
order by 	1;

-- 28.	Listar el valor promedio de los libros agrupados por tipo 
-- de libro cuyo promedio esté entre 12 y 14. Poner alias a los 
-- encabezados. Ordenar la consulta por promedio. 
select		type categoria,
			avg(price) promedio
from		titles
group by	type
having		avg(price) between 12 and 14
-- order by	avg(price) desc;
order by	2 desc;

-- 29. 	  Listar las categorías de libros junto con el precio del libro más 
-- caro, el más barato y la cantidad de libros existentes para esa categoría. 
-- Mostrar solo aquellas categorías de libros cuyo precio de los libros 
-- económicos sea inferior a $10 Y cuya cantidad de libros pertenecientes sean 
-- mayor a 2. 
select		type categoria
			,count(title_id) 'cantidad de titulos'
			,min(price) 'libro mas economico'
			,max(price) 'libro mas caro'
			,avg(price) promedio
from		titles 
group by	type
having 		count(title_id) > 2 and min(price) < 10
order by	2 desc;

-- 30.	 Contar la cantidad de empleados que trabajen en la compañía.
select count(emp_id) 'cantidad de empleados' from employee;















