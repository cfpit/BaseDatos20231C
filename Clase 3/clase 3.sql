-- selecciono la base x defecto
use negocio;

-- veo las tablas de la base seleccionada
show tables;

-- veo la estructura de la tabla clientes
describe clientes;

-- queries (consultas)
-- listar todos los campos de la tabla clientes
select * from clientes;-- * es todos los campos

-- listar nombre, apellido y telefono de los clientes
select  nombre, apellido, telefono from clientes;

-- listar articulo, precio y marca de todos los productos
select articulo, precio, marca from productos;

-- columnas agregadas a la consulta(NO a la tabla)
select 	'esto es un comentario' as notas,
		articulo, 
		precio,
        precio * 1.21 as 'Precio con IVA',-- alias de columna
        marca,
        now() as Fecha
from 	productos;

-- filtro de registros
/*
operadores aritmeticos: + - * /
operadores relacionales: <   >   <=   >=   =   != o <>
operadores logicos: and		or		not
operador de rango: between
operador de lista: in
*/

-- listar los productos cuyo precio sea mayor a 250 U$s
select * from productos where precio > 250;

-- listar los productos cuyo precio este entre 250 y 500 U$s
select * from productos where precio >= 250 and precio <= 500;
select * from productos where precio between 250 and 500;

-- negacion
select * from productos where precio not between 250 and 500;


-- listar los productos cuyo precio este entre 100 y 200 o 
-- entre 300 y 400 U$s
select 	* 
from 	productos 
where 	precio >= 100 and precio <= 200
or 		precio >= 300 and precio <= 400;

-- listar los productos cuyo precio sea 100 o 200 o 900 U$s
select 	* 
from 	productos 
where 	precio = 100 or precio = 200 or precio = 900;

-- alternativa
select 	* 
from 	productos 
where 	precio in (100, 200, 900);

-- negacion
select 	* 
from 	productos 
where 	precio not in (100, 200, 900);




