USE lessons;

CREATE TABLE IF NOT EXISTS
User(
	email VARCHAR(45),
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    address VARCHAR(45),
    age INT, 
    PRIMARY KEY (email)
);

DROP TABLE IF EXISTS User;

-- Falla debido a que al final ingresa un texto en vez de un entero
INSERT INTO User Values ('bob@example.com', 'Bob', 'Codd', '123 Fantasy lane, Fantasy City', 'de');

-- Si permite ingresarlo
INSERT INTO User Values ('tom@web.com', 'Tom', 'Fake', '456 Fantasy lane, Fantasy City', 39);

-- Ingreso de otras tuplas
INSERT INTO User Values ('ismael@dominiodif.com', 'Ismael', 'Pineda', 'Edo Mex', 25);
INSERT INTO User Values ('usuariodesconocido@dominiodif.com', 'OtroUsuario', 'Santos', 'LugarBonito',39);

SELECT * FROM User;
SELECT email, first_name FROM user;
SELECT first_name, last_name FROM user;

-- No visualiza la tabla debido a que aún no se crea
SELECT email, gender FROM user;

SELECT * 
FROM user 
WHERE age = 39;

-- Ordenando filas en la selección
SELECT email, age 
FROM user 
ORDER BY age DESC;

-- Se agrega una nueva columna
ALTER TABLE User ADD COLUMN gender TEXT;

-- Permite ver si la columna fue creada
DESCRIBE user;
SELECT * FROM user;

-- Permite realizar actualizaciones
SET SQL_SAFE_UPDATES = 0;

-- Actualización de tabla en columna genero
UPDATE User SET gender = "Femenino" WHERE age = 39;

SELECT  * FROM user;
