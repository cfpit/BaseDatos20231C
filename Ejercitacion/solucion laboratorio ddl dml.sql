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





