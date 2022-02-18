-- Ejercicios consultas sql
USE MASTER;
SHOW TABLES;

DESCRIBE cities;
DESCRIBE countries;

SELECT * 
FROM cities;

SELECT * 
FROM countries;

-- 1
SELECT * 
FROM cities 
	JOIN countries 
		ON cities.name = countries.country_name;

SELECT name AS city, code, country_name AS country, region, city_proper_pop
FROM cities AS city, countries AS country
	WHERE city.country_code = country.code 
		ORDER BY code DESC;

-- 2.Utiliza un LEFT JOIN para cruzar la tablas countries y languages.
-- Selecciona el país (con alias 'country'), el nombre local del país 
-- (local_name), el nombre del idioma y, finalmente, el porcentaje del 
-- idioma hablado en cada país

SELECT * 
FROM languages;

SELECT * 
FROM countries;

DESCRIBE languages;

SELECT country_name as country, local_name, name as language, percent 
FROM countries as country
	LEFT JOIN languages
		ON country.code  = languages.code order by country desc;

-- 3. Utiliza nuevamente un LEFT JOIN (o RIGHT JOIN si quiere 
-- alocarte un poco 🤓) para cruzar las tablas countries y economies.
-- Selecciona el nombre del país, región y GDP per cápita 
-- (de economies). Finalmente, filtra las filas para obtener 
-- solo los resultados del año 2010.

SELECT * 
FROM economies;

DESCRIBE economies;

SELECT * 
FROM countries;

SELECT country_name, region, gdp_percapita 
FROM countries AS country
	LEFT JOIN economies
		ON country.code = economies.code 
			WHERE economies.year = 2010;

SELECT * FROM countries;

-- 4. Veamos si aprendiste la diferencia entre LEFT JOIN y RIGHT JOIN. 
-- Convierte el siguiente ejemplo para utilizar RIGHT JOINs pero obteniendo el mismo resultado.

SELECT cities.name AS city, urbanarea_pop, countries.country_name AS country,
       indep_year, languages.name AS language, percent
FROM cities
  LEFT JOIN countries
    ON cities.country_code = countries.code
  LEFT JOIN languages
    ON countries.code = languages.code
ORDER BY city, language;
-- ---------------------------------------------------------------------------
SELECT cities.name AS city, urbanarea_pop, countries.country_name AS country,
       indep_year, languages.name AS language, percent
FROM languages
 RIGHT JOIN countries
    ON countries.code = languages.code
  RIGHT JOIN cities
    ON cities.country_code = countries.code  
ORDER BY city, language;

