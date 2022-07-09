/*
Sixth section of sqlzoo, Join
*/

--1
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'

--2
SELECT id, stadium, team1, team2 FROM game WHERE id = 1012

--3
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game JOIN goal ON game.id = goal.matchid WHERE goal.teamid = 'GER'

--4
SELECT game.team1, game.team2, player FROM game JOIN goal
ON game.id = goal.matchid WHERE player LIKE 'Mario%'

--5
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM eteam JOIN goal ON eteam.id = goal.teamid
WHERE goal.gtime <= 10

--6
SELECT game.mdate, eteam.teamname FROM game JOIN eteam ON
game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos'

--7
SELECT goal.player FROM goal JOIN game ON goal.matchid = game.id AND game.stadium = 'National Stadium, Warsaw'

--8
SELECT DISTINCT goal.player FROM goal JOIN game ON game.id = goal.matchid WHERE (game.team1 = 'GER' OR game.team2 = 'GER') AND goal.teamid != 'GER'

--9
SELECT eteam.teamname, COUNT(goal.matchid) FROM goal JOIN eteam ON eteam.id = goal.teamid
GROUP BY eteam.teamname

--10
SELECT game.stadium, COUNT(goal.matchid) FROM game JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium

--11
SELECT id, mdate, COUNT(*) FROM game JOIN goal ON game.id = goal.matchid WHERE
team1 = 'POL' OR team2 = 'POL'
GROUP BY game.id, game.mdate

--12
SELECT id, mdate, COUNT(*) FROM game JOIN goal ON
goal.matchid = game.id WHERE goal.teamid = 'GER'
GROUP BY id, mdate

--13
SELECT mdate, team1,
SUM(CASE WHEN team1 = teamid THEN 1 ELSE 0 END) AS score1,
team2,
SUM(CASE WHEN team2 = teamid THEN 1 ELSE 0 END) AS score2
FROM goal RIGHT JOIN game ON id = matchid
GROUP BY team1, team2, mdate, id
ORDER BY mdate, id, team1, team2
