-- Laboratorio Integrador DDL DML
create table alumnos
(
	alumnoID int primary key auto_increment,
	nombre varchar(50),
	apellido varchar(50),
	telefono varchar(30),
	email varchar(100),
	fechaNac date,
	saldo float,
	edad smallint
);

insert into alumnos 
values(null,'Pedro','Car','1254-9658','pedrocar@hotmail.com','1971-02-01',10.56,25),
(null,'Jose','Cabrera','4584-7541','josecabrera@hotmail.com','1972-05-01',52.69,32),
(null,'Roberto','Perez','4856-1548','robertoperez@gmail.com','1973-08-01',12.32,19),
(null,'Marcelo','Pompillo','4556-4577','mpompillo@yahoo.com','1905-05-08',55.66,45),
(null,'Anibal','Alfaro','4556-4532','aalfaro@yahoo.com','1935-01-08',42.78,17),
(null,'Angeles','Rito','4326-2532','angelesrito@yahoo.com','1956-04-06',22.78,15);

select * from alumnos;

-- Comando INSERT
-- Ejercicio #1
-- • Insertar en la tabla alumnos los siguentes alumnos: 
-- Comando SELECT
-- Ejercicio #1
-- • Seleccionar todos los alumnos
select * from alumnos;
-- Ejercicio #2
-- • Seleccionar el alumno que tenga como identificador el numero 3
select * from alumnos where alumnoid = 3;
-- • Seleccionar el alumno que tenga como identificador el numero 3 y 5
select * from alumnos where alumnoid = 3 and alumnoid = 5;
-- • Seleccionar el alumno que tenga como identificador el numero 3 o 5
select * from alumnos where alumnoid = 3 or alumnoid = 5;
-- Ejercicio #3
-- • Utilización de la clausula LIKE y los %
-- • Seleccionar los alumnos que contengan “erez” en su apellido
select * from alumnos where apellido like '%erez%';
-- • Consultar todos los alumnos que tengan cuenta de gmail 
select * from alumnos where email like '%gmail%';
-- Ejercicio #4
-- • Consultar todos los alumnos cuyo numero este comprendido entre 3 y 6
select * from alumnos where alumnoid between 3 and 6;
-- • Consultar todos los alumnos cuyo numero este comprendido dentro de la
-- siguiente lista: 1, 3 , 4 , 8
select * from alumnos where alumnoid in (1, 3 , 4 , 8);
-- Comando DELETE
-- Ejercicio #1
-- • Eliminar al alumno “Jose Cabrera”
delete from alumnos where nombre = 'jose' and apellido = 'cabrera';
-- Ejerrcicio #2
-- • Eliminar los alumnos que tengan como apellido a “Perez”
delete from alumnos where apellido = 'perez';
-- Comando UPDATE
-- Ejerrcicio #1
-- • Actualizar el mail actual de Pedro Car por “pedrito@car.com” y su telefono por
-- “2020-45896”
update	alumnos 
set 	email = 'pedrito@car.com', telefono = '2020-45896'
where	nombre = 'pedro' and apellido = 'car';
-- • Incrementar los saldos en un 10 %
update	alumnos 
set 	saldo = saldo * 1.1;
-- • Decrementar los saldos en un 15 % de aquellos alumnos que sean menores de
-- edad 
update	alumnos 
set 	saldo = saldo * 0.85
where	edad < 18;





