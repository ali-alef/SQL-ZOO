/*
Eighth section of sqlzoo, Using NULL
*/

--1
SELECT name FROM teacher WHERE dept IS NULL

--2
SELECT t.name, d.name FROM teacher AS t JOIN dept AS d
ON d.id = t.dept

--3
SELECT t.name, d.name FROM teacher AS t LEFT JOIN dept AS d
ON d.id = t.dept

--4
SELECT t.name, d.name FROM teacher AS t RIGHT JOIN dept AS d
ON d.id = t.dept

--5
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile FROM teacher

--6
SELECT t.name, COALESCE(d.name, 'None') AS dept FROM teacher AS t LEFT JOIN dept AS d ON d.id = t.dept

--7
SELECT COUNT(name), COUNT(mobile) FROM teacher

--8
SELECT dept.name, COUNT(teacher.id) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name

--9
SELECT name, (CASE WHEN dept = 1 THEN 'Sci' WHEN dept = 2 THEN 'Sci' ELSE 'Art' END) FROM teacher

--10
SELECT name, (CASE WHEN dept = 1 THEN 'Sci' WHEN dept = 2 THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END) FROM teacher
