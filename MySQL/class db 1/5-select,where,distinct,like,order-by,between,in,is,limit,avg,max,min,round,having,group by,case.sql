SHOW DATABASES;
USE moviesdb;
SELECT * FROM moviesdb.movies;
SELECT * FROM movies;
SELECT * FROM movies WHERE industry="bollywood";
SELECT COUNT(*) FROM movies WHERE industry="bollywood"; 
SELECT DISTINCT industry FROM movies;
SELECT * FROM movies WHERE title LIKE "%THOR%";
SELECT * FROM movies WHERE studio=""; 
SELECT * FROM movies WHERE imdb_rating>=9;
SELECT * FROM movies WHERE imdb_rating BETWEEN 6 AND 8;
SELECT * FROM movies WHERE release_year=2022 or release_year=2019 or release_year=2018;   --  OR
SELECT * FROM movies WHERE release_year IN (2020,2022,2019,2018);
SELECT * FROM movies WHERE imdb_rating is NULL;
SELECT * FROM movies WHERE imdb_rating is  NOT NULL;
SELECT * FROM movies WHERE industry="bollywood" ORDER BY movie_id DESC LIMIT 5 OFFSET 1;  -- OFFSET IS USABLE TO SKIP PARTICULAR NUMBER OF ROW IN RESULT
SELECT MAX(imdb_rating) FROM movies WHERE industry="bollywood";
SELECT MIN(imdb_rating) FROM movies WHERE industry="bollywood";
SELECT AVG(imdb_rating) FROM movies WHERE title LIKE "%THOR%";
SELECT ROUND(AVG(imdb_rating),2) FROM movies WHERE title LIKE "%THOR%";  -- TO ROUND THE AVG UPTO 2 DECIMAL POINTS
SELECT MIN(imdb_rating) as low_rating  FROM movies WHERE industry="bollywood";
SELECT industry,COUNT(*) FROM movies GROUP BY industry;
SELECT studio,COUNT(*) AS cnt,ROUND(AVG(imdb_rating),1) AS rating FROM movies WHERE studio!="" GROUP BY studio ORDER BY cnt DESC;
SELECT movie_id AS cnt,title,release_year,industry FROM movies  HAVING release_year=2022; 
-- SELECT + AS --> FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY

SELECT release_year,count(*) AS cnt FROM movies WHERE imdb_rating>2 GROUP BY release_year ORDER BY cnt;  -- here we havent selected imdbrating,but we are able to use it in where clause
SELECT release_year,COUNT(*) AS movies_count FROM movies GROUP BY release_year HAVING movies_count>2 ORDER BY movies_count;

SELECT *,year(curdate())-birth_year as age FROM actors;

SELECT *,revenue-budget AS profit FROM financials;
SELECT *,IF(unit="Billions",budget*1000,budget)AS budget_mln  FROM financials; -- IF(CONDITION,TRUE,FALSE)
SELECT *,IF(currency="USD",budget*77,budget)AS budget_inr  FROM financials;

SELECT *,
CASE
	WHEN unit="Billions" THEN revenue*1000
	WHEN unit="Thousands" THEN revenue/1000
	ELSE revenue
END
AS profit FROM financials;