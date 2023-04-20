-- funciones de agrupacion
use pubs;

-- informar el precio del titulo mas caro
select max(price) 'titulo mas caro' from titles;-- 22.95 U$s

-- informar la fecha en la que ingreso el primer empleado
select min(hire_date) 'fecha ingreso 1er empleado' from employee;-- 1988-10-09

-- informar el precio promedio de todos los libros
select avg(price) promedio from titles;-- 14.76

-- idem anterior pero redondeado a 2 decimales
select round(avg(price),2) promedio from titles;
select truncate(avg(price),2) promedio from titles;

-- informar la suma de los precios de todos los titulos
select sum(price) as total from titles;-- 236. 26 U$s

-- contar la cantidad de empleados
select count(emp_id) as 'cantidad de empleados' from employee;-- 43 

-- reuno todas las funciones de agrupacion en una sola query
select	max(price) 'libro mas caro',
		min(price) 'libro mas barato',
        count(title_id) 'cantidad de libros',
        sum(price) total,
        avg(price) promedio
from	titles;
        








