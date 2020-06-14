--Bryant Vail
--Chapter 8

-- #4
SELECT Customer#, LastName, State
FROM Customers
WHERE 
  State = 'GA'
  OR 
  State = 'NJ'
ORDER BY LastName;

SELECT Customer#, LastName, State
FROM Customers
WHERE 
  State IN('GA', 'NJ')
ORDER BY LastName ASC;

-- #5
SELECT Order#, OrderDate
FROM Orders 
WHERE OrderDate <= '01-apr-09';

SELECT Order#, OrderDate
FROM Orders 
WHERE OrderDate < '02-apr-09';

-- #6
SELECT LName, FName
FROM Author
WHERE LName LIKE '%IN%'
ORDER BY LName, FName;

-- #7
SELECT LastName, Referred
FROM Customers 
WHERE Referred IS NOT NULL;

-- #9
SELECT ISBN, Title
FROM Books
WHERE Title LIKE '_A_N%'
ORDER BY Title desc;

-- #10
-- 10a
SELECT Title, PubDate
FROM Books
WHERE
  Category = 'COMPUTER'
  AND 
  PubDate BETWEEN '01-JAN-2005' AND '31-DEC-2005';

-- 10b
SELECT Title, PubDate 
FROM Books 
WHERE 
  Category = 'COMPUTER'
  AND 
  (
    PubDate > '01-jan-05'
    AND 
    PubDate < '31-dec-05'
  );

-- 10c
SELECT Title, PubDate
FROM Books 
WHERE 
  Category = 'COMPUTER'
  AND 
  PubDate LIKE '__-___-05';

-- Advanced Challenge

-- #1
SELECT Title, retail-cost as "Profit"
FROM Books
WHERE retail-cost >= 10
ORDER BY "Profit" desc;

-- #2
SELECT Title, Category
FROM Books
WHERE 
  Category IN('COMPUTER', 'FAMILY LIFE')
  AND
  PubId IN('1', '3') -- PubId IN(1, 3) also works
  AND 
  Retail >= 45;



