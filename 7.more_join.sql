-- 1

SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2

SELECT yr
 FROM movie
 WHERE title='Citizen Kane';

-- 3

SELECT id, title, yr
 FROM movie
 WHERE title LIKE 'Star Trek%'
ORDER BY yr;

--4

SELECT id
 FROM actor
 WHERE name = 'Glenn Close';

 -- 5

 SELECT id
 FROM movie
 WHERE title = 'Casablanca';

--6

SELECT actor.name
 FROM casting
JOIN actor ON actor.id= casting.actorid
JOIN movie ON movie.id = casting.movieid
 WHERE title = 'Casablanca';

 --7

SELECT actor.name
 FROM casting
JOIN actor ON actor.id= casting.actorid
JOIN movie ON movie.id = casting.movieid
 WHERE title = 'Alien';

 --8

 SELECT movie.title
 FROM casting
JOIN actor ON actor.id= casting.actorid
JOIN movie ON movie.id = casting.movieid
 WHERE actor.name = 'Harrison Ford';

 --9

 SELECT movie.title
 FROM casting
JOIN actor ON actor.id= casting.actorid
JOIN movie ON movie.id = casting.movieid
 WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;

 --10

 SELECT movie.title, name
 FROM casting
JOIN actor ON actor.id= casting.actorid
JOIN movie ON movie.id = casting.movieid
 WHERE yr = 1962 AND casting.ord = 1;

 --11

 SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

--12

SELECT movie.title, name
 FROM movie
JOIN casting ON (movie.id = casting.movieid AND casting.ord = 1)
JOIN actor ON actor.id= casting.actorid
WHERE movie.id IN(SELECT movieid FROM casting
                WHERE actorid IN (
                SELECT id FROM actor
                WHERE name='Julie Andrews'));

--13

SELECT actor.name
 FROM casting
JOIN movie ON (movie.id = casting.movieid)
JOIN actor ON actor.id= casting.actorid
WHERE ord = 1
GROUP BY actor.name
HAVING COUNT(movie.title) >= 15
ORDER BY actor.name;

--14

SELECT movie.title, COUNT(name)
 FROM casting
JOIN movie ON (movie.id = casting.movieid)
JOIN actor ON actor.id= casting.actorid
WHERE yr = 1978
GROUP BY movie.title
ORDER BY COUNT(name) desc, title;

--15

SELECT actor.name
 FROM casting
JOIN movie ON (movie.id = casting.movieid)
JOIN actor ON actor.id= casting.actorid
WHERE movie.id IN (SELECT movie.id 
                 FROM actor
                 JOIN casting ON actor.id= casting.actorid
                 JOIN movie ON (movie.id = casting.movieid)
                 WHERE actor.name = 'Art Garfunkel') and actor.name != 'Art Garfunkel';