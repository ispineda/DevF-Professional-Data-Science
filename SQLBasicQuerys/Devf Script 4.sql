USE master;

-- Tablas usadas
SELECT * FROM netflix_titles;
SELECT * FROM netflix_activity;
SELECT * FROM netflix_users;

DESCRIBE netflix_titles;
DESCRIBE netflix_activity;
DESCRIBE netflix_users;

-- Ejercicio INNER JOIN
SELECT * 
FROM netflix_titles AS titles
INNER JOIN netflix_activity AS activitys
	ON titles.show_id = activitys.show;

-- Ejercicio LEFT OUTER JOIN
SELECT titles.show_id, titles.title, activitys.user_id
FROM netflix_titles AS titles
INNER JOIN netflix_activity AS activitys
	ON activitys.show = titles.show_id
LEFT JOIN netflix_users AS users
	ON users.user_id = activitys.user_id
ORDER BY show_id;

-- Otra forma de verlo - Vistas
CREATE OR REPLACE VIEW netflix_inner_join 
AS SELECT * 
FROM netflix_titles AS titles
INNER JOIN netflix_activity AS activitys
	ON titles.show_id = activitys.show;

-- LEFT OUTER JOIN desde vista creada
SELECT netflix_inner_join.show_id, netflix_inner_join.title, netflix_users.user_id
FROM netflix_inner_join
LEFT JOIN netflix_users
	ON netflix_inner_join.user_id = netflix_users.user_id;



-- Comprobación de ejercicios JOINS
-- 1.
SELECT netflix_titles.show_id, netflix_titles.title, netflix_activity.user_id
FROM netflix_titles
INNER JOIN netflix_activity ON netflix_titles.show_id=netflix_activity.show
ORDER BY show_id;

-- 2.
SELECT netflix_titles.show_id, netflix_titles.title, netflix_activity.user_id, netflix_users.nombre
FROM netflix_titles
INNER JOIN netflix_activity ON netflix_titles.show_id = netflix_activity.show
RIGHT JOIN netflix_users USING(user_id)
ORDER BY show_id;

-- 3.
SELECT netflix_activity.show, netflix_activity.user_id, netflix_titles.show_id, netflix_titles.title
FROM netflix_titles
CROSS JOIN netflix_activity ON netflix_activity.show=netflix_titles.show_id
ORDER BY netflix_activity.show;

-- Ejercicios - Subconsultas
/* 
1. Las subconsultas son una práctica muy eficiente al momento de realizar consultas complejas sobre un 
subconjunto de datos. La siguiente subconsulta se ejecuta sobre la sentencia WHERE. Obtiene los show ID 
desde netflix_activity que correspondan únicamente a los primeros 4 ID (s1,s2,s3,s4). 
Sobre ese subconjunto rescatamos los títulos en la consulta principal.
*/
SELECT * FROM netflix_titles;
SELECT * FROM netflix_activity;

-- IN
SELECT netflix_titles.show_id, netflix_titles.title
FROM netflix_titles
WHERE netflix_titles.show_id 
	IN (SELECT netflix_activity.show 
		FROM netflix_activity 
        WHERE netflix_activity.show 
			IN ("s1", "s2", "s3","s4"));

-- NOT IN
SELECT netflix_titles.show_id, netflix_titles.title
FROM netflix_titles
WHERE netflix_titles.show_id 
	NOT IN (SELECT netflix_activity.show 
			FROM netflix_activity 
            WHERE netflix_activity.show 
				IN ("s1", "s2", "s3","s4"));

-- SUBCONSULTA titulos con más de tres vistas
SELECT count_show_titles.counts, netflix_titles.title
FROM netflix_titles
JOIN ( 	SELECT netflix_activity.show, COUNT(*) AS counts 
		FROM netflix_activity 
        GROUP BY netflix_activity.show ) AS count_show_titles
	ON count_show_titles.show = netflix_titles.show_id
WHERE count_show_titles.counts >= 3;