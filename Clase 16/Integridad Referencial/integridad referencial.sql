	SET FOREIGN_KEY_CHECKS=0; 
    
    DROP TABLE IF EXISTS personas;
    DROP TABLE IF EXISTS ciudades;

    SET FOREIGN_KEY_CHECKS=1;



    CREATE DATABASE prueba_restricciones;

    USE prueba_restricciones; 

    CREATE TABLE IF NOT EXISTS ciudades 
    (
        ciudad_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
        ciudad_nom VARCHAR(50),
        INDEX (ciudad_nom)
    )ENGINE=INNODB;


    CREATE TABLE IF NOT EXISTS personas 
    (
        persona_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
        persona_nom VARCHAR(70),
        ciudad_id INT,
        FOREIGN KEY fk_ciudad(ciudad_id) REFERENCES ciudades(ciudad_id)
        ON DELETE  CASCADE -- cambiar para hacer pruebas ... CASCADE, SET NULL, NO ACTION 
        
    )ENGINE=INNODB;


    INSERT INTO ciudades (ciudad_nom)
        VALUES 
            ('Galilea'),
            ('Betsaida'),
            ('Patmos'),
            ('Jerusalén')

    ;

	INSERT INTO personas (persona_nom, ciudad_id)
        VALUES 
        ('Pedro',1),
        ('Santiago',2),
        ('Juan',3),
        ('Andrés',1)
    ;


    SELECT * FROM personas ORDER BY persona_id;
    SELECT * FROM ciudades ORDER BY ciudad_id;

    DELETE FROM ciudades WHERE ciudad_id=1;

    DELETE FROM personas WHERE ciudad_id=4;

    -- Consultas después de la acción de borrado
    SELECT * FROM personas ORDER BY persona_id;
    SELECT * FROM ciudades ORDER BY ciudad_id;