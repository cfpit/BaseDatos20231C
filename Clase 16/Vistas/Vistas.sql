create database pruebaVista;

use pruebaVista;



-- Una empresa almacena la información de sus empleados en dos tablas llamadas 
-- "empleados" y "secciones".


 create table secciones(
  codigo tinyint primary key auto_increment,
  nombre varchar(20),
  sueldo decimal(5,2),
  constraint CK_secciones_sueldo check (sueldo>=0)
  
 );
 


 create table empleados(
  legajo int primary key auto_increment,
  documento char(8),
  sexo char(1),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion tinyint not null,
  cantidadhijos tinyint,
  estadocivil char(10),
  fechaingreso datetime,
  constraint FK_empleados_seccion foreign key (seccion)references secciones(codigo)on update cascade,
  constraint UQ_empleados_documento unique(documento)
  );

-- Ingresamos algunos registros:

 insert into secciones values(null,'Administracion',300);
 insert into secciones values(null,'Contaduría',400);
 insert into secciones values(null,'Sistemas',500);
 
 
 insert into empleados values(null,'22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
 insert into empleados values(null,'23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
 insert into empleados values(null,'24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
 insert into empleados values(null,'25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
 insert into empleados values(null,'26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');

drop table secciones;
drop table empleados;

select * from secciones;

select * from empleados;




-- Creamos la vista "vista_empleados", que es resultado de una combinación en la
-- cual se muestran 5 campos:


 create view vista_empleados
 as
   select concat(apellido,' ',e.nombre) as nombre,
		  sexo,
		  s.nombre seccion,
		  cantidadhijos
   from empleados  e
   join secciones  s
   on (codigo=seccion);
   
   
   

-- Vemos la información de la vista:

 select * from vista_empleados;
 

-- Realizamos una consulta a la vista como si se tratara de una tabla:

  select seccion,count(*) as cantidad
  from vista_empleados
  group by seccion;
  
  
-- Es posible obligar a todas las instrucciones de modificación de datos
 -- que se ejecutan en una vista a cumplir ciertos criterios.
 
 -- Por ejemplo, creamos la siguiente vista:

 create view vista_empleados2
 as
  select apellido, e.nombre, sexo, s.nombre  seccion
  from empleados as e
  join secciones as s
  on seccion=codigo
  where s.nombre='Administracion'
  with check option;

-- Consultamos la vista:

 select * from vista_empleados2;

-- Actualizamos el nombre de un empleado a través de la vista:

 update vista_empleados2 set nombre='Beatriz' where nombre='Ana';

-- Veamos si la modificación se realizó en la tabla:

 select * from empleados;
 
 -- si se modifico
 
 
 -- En cambio, si queremos hacer la siguiente modificacion:
 
  update vista_empleados2 set nombre='Pedro' where nombre='Marcos';
  
  -- Veamos si la modificación se realizó en la tabla:

 select * from empleados;
 
 -- no se modifico
 
 
 -- Creamos la vista "vista_empleados3" que muestre todos los campos de la
 -- tabla "empleados":

 create view vista_empleados3
 as
  select * from empleados;
  
 
-- Consultamos la vista:

 select * from vista_empleados3;

-- Agregamos un campo a la tabla "empleados":

 alter table empleados
 add column sueldo decimal(6,2);
 
 describe empleados;
 
 select * from empleados;

-- Consultamos la vista "vista_empleados4":

 select * from vista_empleados3;

-- Note que el nuevo campo agregado a "empleados" no aparece, a pesar que 
-- la vista indica que muestre todos los campos de dicha tabla; esto sucede
-- porque los campos se seleccionan al ejecutar "create view", para que 
-- aparezcan debemos alterar la vista:


 alter view vista_empleados3
 as
  select * from empleados;

-- Consultemos la vista:

 select * from vista_empleados3;
 
 -- elimino el campo sueldo de la tabla empleados
 alter table empleados 
 drop column sueldo;
 
 describe empleados;
 
 -- Ejercicio Vistas
-- 1 - Elimine las tablas y créelas nuevamente:
 drop table if exists inscriptos;
 drop table if exists socios;
 drop table if exists profesores; 
 drop table if exists cursos;

 create table socios(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  primary key (documento)
 );

 create table profesores(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  primary key (documento)
 );

 create table cursos(
  numero integer auto_increment,
  deporte varchar(20),
  dia varchar(15),
  documentoprofesor char(8),
  primary key (numero)
 );

 create table inscriptos(
  documentosocio char(8) not null,
  numero integer not null,
  matricula char(1),
  primary key (documentosocio,numero)
 );


-- 2- Ingrese algunos registros para todas las tablas:
 insert into socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into socios values('31111111','Gaston Garcia','Guemes 65');
 insert into socios values('32222222','Hector Huerta','Sucre 534');
 insert into socios values('33333333','Ines Irala','Bulnes 345');

 insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
 insert into profesores values('23333333','Carlos Caseres','Colon 245');
 insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
 insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

 insert into cursos(deporte,dia,documentoprofesor) 
  values('tenis','lunes','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('tenis','martes','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','miercoles','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','jueves','23333333');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','viernes','23333333');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('futbol','sabado','24444444');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('futbol','lunes','24444444');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('basquet','martes','24444444');

 insert into inscriptos values('30000000',1,'s');
 insert into inscriptos values('30000000',3,'n');
 insert into inscriptos values('30000000',6,null);
 insert into inscriptos values('31111111',1,'s');
 insert into inscriptos values('31111111',4,'s');
 insert into inscriptos values('32222222',8,'s');


-- 3- Elimine la vista "vista_club" si existe:
 drop view if exists vista_club; 


-- 4 - Cree una vista en la que aparezca el nombre y documento 
-- del socio, el deporte, el día y el nombre del profesor (no 
-- mostrar datos de los socios que no están inscriptos en deportes)
 create view vista_club as
  select s.nombre as socio,
         s.documento as docsocio,
         s.domicilio as domsocio,
         c.deporte as deporte,
         dia,
         p.nombre as profesor, 
         matricula
   from socios as s
   join inscriptos as i on s.documento=i.documentosocio
   join cursos as c on i.numero=c.numero
   join profesores as p on c.documentoprofesor=p.documento;


-- 5- Muestre la información contenida en la vista.
 select * from vista_club;


-- 6- Realice una consulta a la vista donde muestre la cantidad 
-- de socios inscriptos en cada deporte ordenados por cantidad.
 select deporte,count(socio) as cantidad
   from vista_club
   group by deporte
   order by cantidad desc; 


-- 7- Muestre (consultando la vista) el nombre y documento de los 
-- socios que deben matrículas.
 select socio, 
        docsocio 
   from vista_club 
   where matricula <> 's';   


-- 8- Consulte la vista y muestre los nombres de los profesores 
-- y los días en que asisten al club para dictar sus clases.
select distinct profesor,dia,deporte
from vista_club;


-- 9- Muestre todos los socios que son compañeros en tenis los 
-- lunes.
 select socio from vista_club
  where deporte='tenis' and dia='lunes';


-- 10 - Cree una nueva vista llamada 'vista_inscriptos' que 
-- muestre la cantidad de inscriptos por curso, incluyendo el 
-- nombre del deporte y el día.
-- Elimine la vista previamente si ya existe.
 drop view if exists vista_incriptos; 
  
 create view vista_inscriptos as
  select deporte,dia,
   (select count(*)
    from inscriptos as i
    where i.numero=c.numero) as cantidad
  from cursos as c;


-- 11- Consulte la vista 'vista_inscriptos':
 select * from vista_inscriptos;  



