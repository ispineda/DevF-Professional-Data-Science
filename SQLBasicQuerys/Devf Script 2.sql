USE MASTER;

-- Primer vistazo de la tabla cargada
SELECT * FROM netflix_titles;
DESCRIBE netflix_titles;

-- Elimina tabla creada
DROP TABLE netflix_titles;

-- Muestra tablas
SHOW TABLES;

-- 1. Selecciona las columnas type, title, director y country. Devuélvelas en una misma tabla.
SELECT type, title, director, country 
FROM netflix_titles;

-- 2. En la columna 'type' parece haber dos categorías 'Movies' y 'TV Shows'. ¿Cuántos títulos tenemos de cada tipo?
SELECT type, COUNT(type) 
FROM netflix_titles 
GROUP BY type;

-- 3. ¿Cuál es el país con la película más reciente en la base de datos (año de lanzamiento más reciente)?
SELECT country, MAX(release_year) 
FROM netflix_titles;

-- 4. ¿Cuál es el título y el director de la película más antigua en la base de datos?
SELECT country, director, MIN(release_year) 
FROM netflix_titles;

-- 5. ¿Cuales series tienen solo 1 temporada (1 Season)? Queremos conocer solo el título, cast y rating.alter
SELECT duration 
FROM netflix_titles;

SELECT title, cast, rating 
FROM netflix_titles 
WHERE duration = "1 Season";

-- 6. Ha sido un día largo y queremos ver algo que nos haga reír. ¿Acaso habrá algún título que solo esté en la categoría 'Comedies' y nada más?
SELECT title, duration, description, country 
FROM netflix_titles  
WHERE listed_in = "Comedies";

-- 6.1 Ejemplo de otros que contienen genero comedias
SELECT title, duration, description, country 
FROM netflix_titles  
WHERE listed_in REGEXP "\Comedies";

-- 7. Juguemos a ser un sistema de recomendación: 
-- A nuestro usuario le encantan las películas, pero solo las más recientes. 
-- Así que debes obtener el título, duración, descripción y año de lanzamiento, 
-- pero solo de las primeras 30 películas más recientes (debes ordenar de mayor 
-- a menor tus resultados).

SELECT title, duration, description, release_year 
FROM netflix_titles 
ORDER BY release_year DESC 
LIMIT 30;