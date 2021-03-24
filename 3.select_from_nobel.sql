-- 1

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

-- 2

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3

SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein';

-- 4

SELECT winner
  FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000;

-- 5

SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Literature' AND yr LIKE '198_';

-- 6

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama');

-- 7

SELECT winner FROM nobel
 WHERE winner LIKE 'John%';

-- 8

SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984;

-- 9

SELECT yr, subject, winner
  FROM nobel
 WHERE subject != 'Chemistry' AND subject != 'Medicine' AND yr = 1980;

-- 10

SELECT yr, subject, winner
  FROM nobel
 WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;

-- 11

SELECT *
  FROM nobel
 WHERE winner IN ('Peter Grünberg');

--  12

SELECT *
  FROM nobel
 WHERE winner IN ('Eugene O''Neill');

-- 13

SELECT winner, yr, subject
  FROM nobel
 WHERE winner LIKE 'Sir%' ORDER BY yr DESC;

-- 14

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Chemistry','Physics'), subject, winner;