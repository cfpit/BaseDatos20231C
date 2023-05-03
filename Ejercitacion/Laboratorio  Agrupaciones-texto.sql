
-- Laboratorio Agrupaciones
-- Un negocio registra en una tabla llamada "clientes" algunos datos de las personas que compran para luego enviarle publicidad de sus productos.

-- Creación de la base de datos:

Create database Agrupacionesclientes;

Use Agrupacionesclientes;

-- Creación de la tabla:

Create table clientes(
nombre varchar(30),
edad tinyint unsigned,
sexo char(1),
domicilio varchar(30),
ciudad varchar(20),
teléfono varchar(11),
montocompra decimal (6,2) unsigned
 );

-- Ingreso de registros:

Insert  into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Susana Molina', 28,'f','Colon 123','Cordoba',null,45.50); 
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',0);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Teresa Garcia',33,'f','Gral. Paz 123','Alta Gracia','03547123456',0);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',25);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','03547121212',53.50);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Roxana Lopez',20,'f','Triunvirato 345','Alta Gracia',null,0);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into clientes (nombre,edad, sexo,domicilio,ciudad,telefono,montocompra)
values ('Juan Torres',43,'m','Sarmiento 876','Cordoba','4988778',15.30);

-- Consultamos todos los registros:
select * from clientes;

-- 1- Informar la cantidad de clientes por ciudad

-- 2- Cantidad de clientes por ciudad, que no sean de Villa Dolores

-- 3- Cual es la cantidad de clientes con teléfono no nulo, de cada ciudad, ordenados por ciudad en forma alfabética:

-- 4- Informar el total de las compras agrupadas por sexo:

-- 5- Obtener el máximo y mínimo valor de compra agrupados por sexo:

-- 6- Informar el promedio del valor de compra (redondeado a 2 decimales) agrupados por ciudad (No incluir a la ciudad de La Falda) cuyo promedio sea superior a 20 $. Ordenar por promedio en forma descendente:

-- 7- Informar la cantidad de clientes que no residan en la ciudad de Córdoba, ordenados por cantidad de clientes, de mayor a menor:
