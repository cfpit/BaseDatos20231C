-- ordenamiento de valores
use pubs;

-- listar libro, precio y fecha de publicacion de los
-- libros de cocina, ordenados por precio en forma 
-- descendente
select	type from titles;-- trad_cook y mod_cook

select		title libro,
			price precio,
			pubdate as 'Fecha de publicacion'
from		titles
where		type like '%cook%'
-- order by	price desc;
order by	2 desc;

-- listar los libros ordenados por precio en forma descendente.
-- En caso de empate en el precio, q desempate por titulo en forma
-- alfabetica
describe titles;

select		*
from		titles
-- order by	price desc, title asc;
order by	5 desc, 2 asc;


-- listar el apellido y el nombre de los empleados, ordenados
-- en forma alfabetica
select		*
from		employee
-- order by	lname, fname
order by	lname asc, fname asc;

-- listar las diferentes categorias de libros
select	type categoria from titles;-- se repiten las categorias

-- clausula DISTINCT
select	distinct (type) categoria from titles;-- NO se repiten las categorias

-- listar los titulos que no tengan definido el precio
-- operador IS NULL
select	* from titles where price is null;

-- listar los titulos que tengan definido el precio
-- operador IS NOT NULL
select	* from titles where price is not null;

select 	title libro,
		type categoria,
        -- isnull(price, 0) as precio,-- valido en SQL Server
        -- isnull(notes, 'sin comentarios') as notas
        ifnull(notes, 'sin comentarios') as notas,
        ifnull(price, 0) as precio
from	titles;

-- operador rlike
-- listar los empleados cuyo nombre empiece con m
-- con LIKE
select	* from employee where fname like 'm%';

-- con RLIKE
select	* from employee where fname rlike '^m';
-- ^: acento frances o acento circlunflejo

-- listar los empleados cuyo nombre empiece con m o a
select	* from employee where fname rlike '^[m,a]';

-- listar los empleados cuyo nombre NO empiece con m 
select	* from employee where fname rlike '^[^m]';
select	* from employee where fname not rlike '^m';

-- listar los empleados cuyo apellido termine con z
select	* from employee where lname rlike 'z$';

-- listar los empleados cuyo nombre empiece con m
-- y termine con a
select	* from employee where fname rlike '^m.*a$';
-- .* del rlike es equivalente al % del like

-- listar los empleados cuyo nombre empiece con m,
-- el 2do caracter sea cualquiera, el 3er caracter
-- sea r y termine de cualquier forma
select	* from employee where fname rlike '^m.r.*$';
-- . del rlike es equivalente al _ del like

-- funciones de fecha
-- listar los empleados que ingresaron en 1990
select * from employee where year(hire_date) = 1990;

-- listar los empleados que ingresaron en el 
-- 2do semestre de 1990
select 	* 
from 	employee 
where 	year(hire_date) = 1990 
and 	month(hire_date) between 7 and 12;

-- listar los empleados que ingresaron en el 
-- 1990 o 1992 o 1994
select 	* 
from 	employee 
where 	year(hire_date) in (1990,1992,1994); 




















