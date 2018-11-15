DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `drive`.`addconductor`(
        IN _id INT,
	IN _name VARCHAR(30),
	IN _celular VARCHAR(10),
	IN _email VARCHAR(25),
	IN _cedula VARCHAR(10),
	IN _placa CHAR(7),
	IN _password VARCHAR(8)
    )
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
    BEGIN
	IF _id = 0 THEN
		INSERT INTO usuario (Nombres_Apellidos, Celular, email, PASSWORD)
		VALUES (_name, _celular, _email, _contraseña);
		SET _id = LAST_INSERT_ID();
	ELSE
		UPDATE Conductor
		SET
			Nombres_Apellidos = _name,
			Celular = _celular,
			email = _email,
			cedula = _cedula,
			placa = _placa,
			PASSWORD = _password
			WHERE id = _id;
	END IF;
	
	SELECT _id AS id;

    END$$

DELIMITER ;