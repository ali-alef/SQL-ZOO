/*
Fourth section of sqlzoo, SELECT in SELECT
*/

--1
SELECT name FROM world
WHERE population > (SELECT population FROM world WHERE name='Russia')

--2
SELECT name FROM world WHERE continent = 'Europe'
AND gdp / population > (SELECT gdp / population FROM world WHERE name = 'United Kingdom')

--3
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Australia' OR name = 'Argentina')

--4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom')
AND
population < (SELECT population FROM world WHERE name = 'Germany')

--5
SELECT name,
CONCAT(CAST(ROUND(population/(SELECT population FROM world WHERE name = 'Germany')*100, 0) AS INT), '%')
FROM world
WHERE continent = 'Europe'

--6
SELECT name FROM world WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL)

--7
SELECT continent, name, area FROM world x WHERE area = ALL(SELECT MAX(area) FROM world y WHERE x.continent = y.continent)
ORDER BY name

--8
SELECT continent, name FROM world x
WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)

--9
SELECT name, continent, population FROM world x WHERE  25000000 >= ALL(SELECT population FROM world y WHERE x.continent = y.continent)

--10
SELECT name, continent FROM world x WHERE population > ALL(SELECT population * 3 FROM world y WHERE x.continent = y.continent AND y.name != x.name)
