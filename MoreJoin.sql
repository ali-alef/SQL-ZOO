/*
Seventh section of sqlzoo, more JOIN
*/

--1
SELECT id, title
FROM movie
WHERE yr=1962

--2
SELECT yr FROM movie
WHERE title = 'Citizen Kane'

--3
SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%'

--4
SELECT id FROM actor WHERE name = 'Glenn Close'

--5
SELECT id FROM movie WHERE title = 'Casablanca'

--6
SELECT a.name FROM actor AS a JOIN casting AS c
ON c.actorid = a.id
WHERE c.movieid = 27

--7
SELECT a.name FROM actor AS a JOIN casting AS c
ON c.actorid = a.id
WHERE c.movieid = 35

--8
SELECT m.title FROM  movie AS m JOIN casting AS c
ON c.movieid = m.id
JOIN actor AS a
ON a.id = c.actorid
WHERE
a.name = 'Harrison Ford'

--9
SELECT m.title FROM  movie AS m JOIN casting AS c
ON c.movieid = m.id
JOIN actor AS a
ON a.id = c.actorid
WHERE c.ord != 1
AND
a.name = 'Harrison Ford'

--10
SELECT m.title, a.name FROM movie AS m JOIN casting AS c
ON c.movieid = m.id
JOIN actor AS a
ON a.id = c.actorid
WHERE c.ord = 1 AND m.yr = 1962

--11
SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

--12
SELECT m.title, a.name
FROM movie AS m JOIN casting AS c
ON m.id = c.movieid
JOIN actor AS a
ON a.id = c.actorid
WHERE m.id IN (SELECT c.movieid FROM casting AS c JOIN actor AS a ON a.id = c.actorid WHERE a.name = 'Julie Andrews')
AND c.ord = 1

--13
SELECT a.name FROM
actor AS a JOIN casting AS c ON
a.id = c.actorid
WHERE c.ord = 1
GROUP BY a.name
HAVING COUNT(c.actorid) >= 15
ORDER BY a.name

--14
SELECT m.title, COUNT(c.movieid) AS number
FROM movie AS m JOIN casting AS c
ON m.id = c.movieid WHERE m.yr = 1978
GROUP BY m.title
ORDER BY number DESC, m.title

--15
SELECT a.name FROM movie AS m JOIN casting AS c
ON m.id = c.movieid
JOIN actor AS a
ON a.id = c.actorid WHERE m.id IN (SELECT m.id FROM movie AS m JOIN casting AS c ON m.id = c.movieid JOIN actor AS a ON a.id = c.actorid WHERE a.name = 'Art Garfunkel') 
AND a.name NOT LIKE 'Art Garfunkel'
