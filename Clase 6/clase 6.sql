-- Ejercitación Base Pubs

-- Consultas Simples
-- 20.Listar todas las facturas que su condición de pago es a 30 días 
-- que hayan facturado durante el año 1992 y 1993 ó los que su condición 
-- de pago es a 60 días que han facturado durante el segundo semestre del 
-- año 1994. Ordenar la consulta por código de libro.
select 		*
from 		sales
where		payterms = 'Net 30' and year(ord_date) in (1992,1993)
or			payterms = 'Net 60' and year(ord_date) = 1994 and month(ord_date) >= 7
order by	title_id;

--   19. Mostrar todos los empleados cuyo nombre empiece con la letra P ó A. 
-- La segunda letra no sea A y la última letra esté entre la H y la Z. 
select	*
from	employee
where	fname rlike '^[p,a][^a].*[h-z]$';

-- 12.	Listar el número, apellido, nombre y teléfono de los autores que NO       
-- tengan contrato y que su estado de residencia sea California (CA). 
describe authors;

select 	au_id as numero_autor,
		concat(au_fname,' ',au_lname) autor,
        phone telefono,
        contract as contrato,
        state as provincia
from 	authors
where	state = 'ca' and contract = 0;

-- 6.	Mostrar el código, nombre completo y fecha de ingreso de los 
-- empleados que trabajan para la editorial 877. Tener en cuenta que 
-- el nombre completo es el resultado de la concatenación del nombre y 
-- apellido. Las columnas deben estar apodadas según las siguientes 
-- leyendas: "Número de Empleado", "Nombre de Empleado" y "Fecha de Inicio". 
select	emp_id as 'Número de Empleado',
		concat(fname,' ',lname) as 'Nombre de Empleado',
        hire_date as 'Fecha de Inicio',
        pub_id as 'Numero de editorial'
from	employee
where	pub_id = 877;

-- 14.Listar los libros vendidos cuya condición de pago es sobre facturación y 
-- cuya cantidad de venta esté entre 13 y 40. No utilizar el operador BETWEEN. 
select	*
from	sales
where	payterms = 'on invoice' and qty >= 13 and qty <= 40;






















