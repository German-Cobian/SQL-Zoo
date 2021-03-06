-- 1

SELECT COUNT(*) FROM stops;

-- 2

SELECT id FROM stops
WHERE name = 'Craiglockhart';

-- 3

SELECT stops.id, stops.name FROM stops
JOIN route ON route.stop = stops.id
WHERE num = '4' AND company = 'LRT';


-- 4

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- 5

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

-- 6

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name= 'London Road';

-- 7

SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.id=115 and stopb.id= 137;

-- 8

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name= 'Tollcross';

-- 9

SELECT DISTINCT name, a.company, a.num
FROM route a
JOIN route b ON (a.company = b.company AND a.num = b.num)
JOIN stops ON a.stop = stops.id
WHERE b.stop = 53;

--10

SELECT a.num Num1, a.comp AS Comp1, a.transfer AS Transfer, b.num Num2, b.comp Comp2
FROM (SELECT DISTINCT a.num num, a.company comp, stopb.name transfer
  FROM route a INNER JOIN route AS b
    ON a.company = b.company AND a.num = b.num
  INNER JOIN stops AS stopa ON a.stop = stopa.id
  INNER JOIN stops AS stopb ON b.stop = stopb.id
  WHERE stopa.name = 'Craiglockhart') a
  INNER JOIN (SELECT DISTINCT a.num num, a.company comp, stopb.name transfer 
  FROM route a INNER JOIN route b ON a.company = b.company AND a.num = b.num
  INNER JOIN stops stopa ON a.stop = stopa.id
  INNER JOIN stops stopb ON b.stop = stopb.id
  WHERE stopa.name = 'Lochend') b ON a.transfer = b.transfer
  ORDER BY Num1, Transfer, Num2