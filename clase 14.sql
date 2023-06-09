-- subconsultas = subselect = subquery = consultas anidadas

-- escalar
select max(price) from titles;

-- lista
select pubdate as 'fecha de publicacion' from titles;

-- tabla
select * from titles;

-- subconsultas que devuelven escalares
-- listar nombre y apellido del empleado de mayor antiguedad
select	concat(fname,' ',lname) empleado 
from	employee
where	hire_date = (select min(hire_date) from employee);

-- listar nombre, apellido y telefono del autor 
-- que escribio el ultimo libro publicado
select		concat(a.au_fname,' ',a.au_lname) autor,
			a.phone telefono,
            t.pubdate
from		authors a
inner join	titleauthor ta on a.au_id = ta.au_id
inner join	titles t on ta.title_id = t.title_id
where		t.pubdate = (select max(pubdate) from titles);

-- subconsultas que devuelven lista de valores
-- WHERE (L)
-- 46.	Listar los empleados de aquellas editoriales que residan en USA. 
-- usar tb relaciones para su resolución. 
-- por join
select		e.*
from		employee e
inner join	publishers p on p.pub_id = e.pub_id
where		p.country = 'usa';-- 35 empleados

-- por subquery
select		*
from		employee
where		pub_id in 	(
							select 	pub_id 
							from 	publishers 
							where 	country = 'usa'
						);	

-- 48.	Listar todos los comprobantes de ventas emitidos para la venta del libro 
-- "Sushi, Anyone?". Utilizar tb relaciones. 
-- por join
select		s.ord_num 'nro de factura',
			t.title libro
from		titles t
inner join	sales s on s.title_id = t.title_id
where		t.title  like '%sushi%';

-- por subconsulta
select		ord_num 'nro de factura'
from		sales 
where		title_id in (select title_id from titles where title like '%sushi%');

-- Sentencia CASE
-- 40.	Listar el nombre de los libros junto a su categoría de precio. La categoría de 
-- precio se calcula de la siguiente manera: Si el precio está entre 0 y 10 la categoría 
-- es Económica. Si la categoría está entre 10 Y 20, Normal y si su valor es mayor a 20 
-- la categoría es Caro. Colocar un apodo a las dos columnas. 
select	title libro,
		round(ifnull(price,0),2) precio,
        (case
			when price < 10 then 'Economica'
            when price between 10 and 20 then 'Normal'
            when price > 20 then 'Cara'
            else 'Sin categorizar'
        end) as categoria
from	titles
where	title <> '';























