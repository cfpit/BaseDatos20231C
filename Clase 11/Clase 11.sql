-- consultas relacionadas(joins)
create database relaciones;

use relaciones;

create table sucursales(suc_id int, suc_nombre varchar(20));
create table empleados(emp_id int, emp_nombre varchar(20), suc_id int);

insert into sucursales values(1,'Centro'),(2,'Congreso'),(3,'Abasto'),(4,'Palermo');
insert into empleados values(1,'Juan',1),(2,'Luis',2),(3,'Maria',2),(4,'Ana',null);

select * from sucursales;
select * from empleados;


/*
inner join 	--> coincidencias
outer join 	--> no coincidencias
			--> left join 
			--> right join
            --> full join
*/

-- inner join
-- listar el nombre de los empleados y las sucursales dnd trabajan
select		emp_nombre, suc_nombre
from		sucursales 
inner join	empleados
on			sucursales.suc_id = empleados.suc_id;	

-- variante usando alias de tabla
select		e.emp_nombre, s.suc_nombre
from		sucursales s
inner join	empleados as e
on			s.suc_id = e.suc_id;

-- variante No ANSI	
select		e.emp_nombre, s.suc_nombre
from		sucursales s, empleados as e
where		s.suc_id = e.suc_id;

-- producto cartesiano
-- variante No ANSI	
select		e.emp_nombre, s.suc_nombre
from		sucursales s, empleados as e;

-- variante ANSI
select		emp_nombre, suc_nombre
from		sucursales 
cross join	empleados;

-- outer join
-- listar las sucursales dnd no trabaja ningun empleado
-- tabla ppal: sucursales
select	s.suc_nombre
		-- ,e.*
-- from	empleados e right join sucursales s
from	sucursales s left join  empleados e 
on		e.suc_id = s.suc_id
where	e.emp_id is null;

-- listar los empleados que no trabajan en ninguna sucursal
-- tabla ppal: empleados
select	e.emp_nombre
		-- ,s.*
-- from	empleados e left join sucursales s
from	sucursales s right join  empleados e 
on		e.suc_id = s.suc_id
where	e.suc_id is null;






