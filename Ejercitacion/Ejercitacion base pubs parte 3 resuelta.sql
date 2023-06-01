-- 31 Seleccionar todos los libros junto a todos los datos 
-- de la editorial la cual lo publicó. 
select 		t.*,p.*
from		publishers p
inner join	titles t
on			t.pub_id = p.pub_id;

-- 32 Mostrar el nombre del libro y el nombre de la editorial 
-- la cual lo publicó sólo de las editoriales que tengan 
-- residencia en USA. Mostrar un apodo para cada columna. 
select 		t.title as titulo,
			p.pub_name editorial
from		publishers p
inner join	titles t
on			t.pub_id = p.pub_id
where		p.country like '%usa%';


-- 33 Listar los autores que residan en el mismo estado que 
-- las tiendas. 
select		a.*
from		authors a
inner join	stores s
on			a.state = s.state;


-- 34 Mostrar el nombre y apellido del autor y el nombre de los 
-- libros publicados por el mismo. 
-- Mostrar un apodo para cada columna. Ordenar por la primera 
-- columna de la consulta. 
select		concat(a.au_fname,' ',a.au_lname) as autor,
			t.title libro
from		authors a
inner join	titleauthor ta on (a.au_id = ta.au_id)
inner join	titles t on (t.title_id = ta.title_id)
order by	1;

-- 35 Mostrar los libros junto a su autor y su editorial. 
-- Se debe mostrar los datos en una unica columna de la 
-- siguiente manera con los siguientes textos literales: 
-- 'El libro XXXXXXXXXXXXX fue escrito por XXXXXXXXXXXXX y 
-- publicado por la editorial XXXXXXXXXXXXX' 
select		concat('El libro ',t.title,' fue escrito por ',au_fname,' ',au_lname, ' y 
publicado por la editorial ',p.pub_name) as supercolumna
from		authors a
inner join	titleauthor ta on (a.au_id = ta.au_id)
inner join	titles t on (t.title_id = ta.title_id)
inner join	publishers p on (t.pub_id = p.pub_id);


-- 36. Mostrar el nombre de las editoriales que no hayan publicado ningún libro. 
-- tabla ppal: publishers / tabla secundaria: titles
select		p.pub_name editorial
			-- ,t.*
from		publishers p left join titles t 
on			t.pub_id = p.pub_id
where		t.title_id is null;

-- 37. Mostrar el nombre de los libros que nunca fueron vendidos.
-- tabla ppal: titles / tabla secundaria: sales
select		t.title libro
			,s.*
from		sales s right join titles t 
on			t.title_id = s.title_id
where		s.title_id is null;

-- 38. Mostrar el nombre y apellido de los empleados y la 
-- descripción del trabajo que realiza. Basar la relación 
-- en el nivel de trabajo. 
select		concat(e.fname,' ',e.lname) as empleado
			, j.job_desc descripcion
from		jobs j
inner join	employee e on (j.job_id = e.job_id)
-- where		e.job_lvl between j.min_lvl and j.max_lvl;
where		e.job_lvl between 100 and 150;

-- 39. Mostrar el producto cartesiano entre los libros de negocio (business) y las tiendas ubicadas en California (CA). 
-- Mostrar el nombre de la tienda y el nombre del libro. Ordenar por 
-- nombre de tienda. 
select		t.title libro,
			t.type categoria,
            s.stor_name tienda,
            s.state estado
from		titles t
cross join	stores s
where		t.type like '%busi%' and s.state = 'ca';




