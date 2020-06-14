

--REM SELECT using number value without quotes 
SELECT *
FROM customers
WHERE Customer# = 1010;

--SELECT isbn as a number even though its defined as a varchar
SELECT *
FROM Books
WHERE isbn = 1915762492;

--Dates: DD-MON-YY
--  functions in chapter 10 go into more ways to work with dates
SELECT * 
FROM books 
WHERE pubdate = '21-jan-05';--MONTH is not case sensitive

--Comparison Operator
SELECT title, retail 
FROM books,
WHERE retail > 55;

--Comparison with string data
SELECT title
FROM books 
WHERE title > 'HO';

--Compare book's profit to 20%
SELECT title, (retail-cost) as Profit 
FROM Books 
WHERE (retail-cost) < (cost *.2);

--Compare state '<='
SELECT FirstName, LastName, State
FROM Customers 
WHERE State <= 'GA';

--Compare <> 
SELECT FirstName, LastName, State
FROM Customers 
WHERE State <> 'GA'
Order By State, FirstName, LastName;

--Compare Dates
SELECT order#, orderDate
FROM Orders
WHERE OrderDate < '01-apr-09';

--Between Operator (inclusive)
SELECT Title, PubId, PubDate
FROM Books
WHERE PubDate Between '01-jan-05' And '31-dec-05';

--IN Operator
SELECT Title, PubId, PubDate 
FROM Books 
WHERE PubId IN(1,2,5);

--IN cont'd
SELECT FirstName, LastName, State, customer#
FROM customers 
WHERE State IN('CA', 'TX');

--IN with 'NOT'
SELECT FirstName, LastName, State, customer#
FROM customers 
WHERE State NOT IN('CA', 'TX');

--LIKE Operator
SELECT LastName
FROM customers 
WHERE LastName LIKE 'P%';

--LIKE with SingleCharacter wildcard
SELECT Customer#, LastName, FirstName
FROM customers 
WHERE Customer# LIKE '10_9';

--LIKE with both wildcards
SELECT title, isbn
FROM books
WHERE isbn LIKE '_4%0';

--Escape Character
SELECT *
FROM testing
WHERE tValue LIKE '\%__A%T' ESCAPE '\';

--Logical Operator Order
SELECT *
FROM Books 
WHERE 
  Category = 'FAMILY LIFE'
  OR
  PubId = 4
  AND 
  cost > 15;

--With Parens
  SELECT *
FROM Books 
WHERE 
    (
      Category = 'FAMILY LIFE'
      OR
      PubId = 4
    )
  AND 
  cost > 15;

--IS NULL Operator
SELECT Order#, ShipDate
FROM orders 
WHERE ShipDate IS NULL;

--IS NOT NULL Operator
SELECT Order#, ShipDate
FROM Orders 
WHERE ShipDate IS NOT NULL;

--Order By
SELECT *
FROM Testing 
Order By tvalue;

----  ORDER BY Priority  ----
-- 7	 ccAccT	Value starts with a   blank character
-- 1	%ccAccT	Value starts with     special character
-- 4	1ccAccT	Value starts with a   number
-- 5	BccAccT	Value starts with an  uppercase B
-- 6	CccAccT	Value starts with an  uppercase C
-- 3	bccAccT	Value starts with a   lowercase b
-- 2	(null)	      Value is        NULL

--NULLs FIRST, ASC default puts NULLs last
SELECT LastName, FirstName, State, Referred
FROM Customers 
WHERE State = 'CA'
ORDER BY Referred NULLS FIRST;

--ORDER BY multiple
SELECT LastName, FirstName, State, City
FROM Customers 
ORDER BY State desc, City;
