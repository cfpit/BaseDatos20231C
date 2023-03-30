-- selecciono la base x defecto
use pubs;

-- veo las tablas de la base seleccionada
show tables;

-- veo la estructura de la tabla titles
describe titles;

-- listar todos los campos de la tabla publishers
select * from publishers;-- * significa todos los campos

-- listar titulo, precio y fecha de publicacion de todos los libros
select title, price, pubdate from titles;

-- columnas agregadas y uso de alias de columna
select 	'esto es un comentario',
		title as libro, 
		price as precio, 
        price * 1.21 as 'precio con IVA',
        pubdate as 'Fecha de publicacion',
        now() as 'Fecha de consulta'
from 	titles;

/*
	Operadores aritmeticos: + - * /
    Operadores relacionales: >  <  >=   <=   =  !=  <>
    Operadores logicos: and  or   not
    Operador de rango: between
    Operador de lista: in
    Operador de similitud: like
    Operador de nulidad: is null / is not null
*/

select 2 * 3 ;
select 2 * 3 as calculo from dual;

-- Clausula de filtro de registros: WHERE
-- listar los libros cuyo precio esten entre 10 y 20 U$s blue.
select 	* 
from 	titles
-- where	price >= 10 and price <= 20;
-- where	price between 10 and 20;-- incluye extremos
where	price not between 10 and 20;-- NO incluye extremos



-- listar los libros cuyo precio sea 7 o 10 o 20 U$s.
select 	* 
from 	titles
-- where	price = 7 or price = 10 or price = 20; 
-- where	price in (7, 10, 20); 
where	price not in (7, 10, 20); -- negacion

-- listar los empleados cuyo nombre empiece con m
select	*
from	employee
-- where	fname like 'm%';
where	fname not like 'm%';-- negacion

-- listar los empleados cuyo apellido termine con a
select	*
from	employee
where	lname like '%a';

-- listar los empleados cuyo apellido empiece con h y termine con z
select	*
from	employee
where	lname like 'h%z';

-- listar los empleados cuyo nombre empiece con m, la 2da letra sea 
-- cualquiera, la 3ra letra sea r y termine de cualquier manera.
-- Maria, Moria, Mirtha, Martin, Muriel, Mirko, Marcelo, Martha, Marcos
select	*
from	employee
where	fname like 'm_r%';









