-- 1

SELECT matchid, player FROM goal 
  WHERE Teamid = 'GER'

-- 2

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;

-- 3

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (game.id=goal.matchid);

-- 4

SELECT team1, team2, player
  FROM game JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE 'Mario%';

-- 5

SELECT SUM(population) FROM world
WHERE name IN ('Estonia','Latvia', 'Lithuania');

-- 6

SELECT mdate, teamname
  FROM game JOIN eteam ON (team1 = eteam.id)
 WHERE coach = 'Fernando Santos';

-- 7

SELECT player
  FROM game
 JOIN goal ON (matchid = id)
 WHERE stadium = 'National Stadium, Warsaw';

-- 8

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE teamid !='GER' AND (team1='GER'OR team2='GER');

-- 9

SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;

-- 10

SELECT stadium, COUNT(player)
  FROM game JOIN goal ON id=matchid
 GROUP BY stadium;

-- 11

SELECT matchid,mdate,COUNT(mdate)
FROM game JOIN goal ON matchid = id 
 WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY mdate, matchid
ORDER BY matchid;

-- 12

SELECT matchid,mdate,COUNT(mdate)
FROM game JOIN goal ON matchid = id 
 WHERE teamid = 'GER'
GROUP BY mdate, matchid
ORDER BY matchid;

-- 13

SELECT mdate, team1, sum(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1, team2, sum(case when teamid = team2 then 1 else 0 end) score2
FROM game 
JOIN goal ON matchid = id
group by id, mdate, team1, team2
order by mdate