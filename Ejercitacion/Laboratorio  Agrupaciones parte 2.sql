-- 1. Crear la tabla 'autos' dentro de la base de datos 'intro' con el siguiente detalle:
                            -- codigo                   INTEGER y PK
                            -- marca                    VARCHAR(255)
                            -- modelo                  VARCHAR(255)
                            -- color                        VARCHAR(255)
                            -- anio                         INTEGER
                            -- precio                     DOUBLE 
                            
create database concesionaria;

use concesionaria;

create table autos
(
	codigo   int primary key auto_increment,
	marca    VARCHAR(255),
	modelo   VARCHAR(255),
	color    VARCHAR(255),
	año     INTEGER,
	precio   DOUBLE
);                            
         
-- 2. Cargar la tabla con 15 autos.
insert into autos values
(null,'Ford','Focus','Azul',2010,180000),
(null,'Renault','Sandero','Blanco',2012,160000),
(null,'Chevrolet','Meriva','Gris',2010,170000),
(null,'Chevrolet','Corsa','Rojo',2004,90000),
(null,'Ford','Ka','Beige',2010,120000),
(null,'Renault','Duster','Blanco',2016,280000),
(null,'Ford','Galaxy','Gris',2001,85000),
(null,'Peugeot','307','Blanco',2007,100000),
(null,'Ford','Fiesta','Azul',1999,70000),
(null,'Fiat','Uno','Blanco',1998,65000),
(null,'Ford','Mondeo','Azul',2000,90000),
(null,'Fiat','Palio','Verde',2012,150000),
(null,'Ford','Falcon','Rojo',1980,50000);

-- 3) Luego, obtener:
-- a) El precio mayor
-- b) El precio menor
-- c) El precio menor dentro del periodo del 2000 y el 2008
-- d) El promedio de los precios de los autos
-- e) El promedio de los precios de los autos para el año 2006
-- f) La cantidad de registros de la tabla
-- g) La cantidad de registros de la tabla con un costo de entre 100 y 200 mil pesos
-- h) La cantidad de autos agrupada por cada año
-- i) Sumarle al punto anterior el costo promedio de los autos en cada año
-- j) La suma y el promedio de los precios de los autos por marca