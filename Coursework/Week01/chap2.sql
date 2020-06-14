-- REM Bryant Vail
-- REM Chapter 2

-- REM 1
-- SELECT * 
-- FROM Books;

-- -- REM 2
-- SELECT title
-- FROM Books;

-- -- REM 3
-- SELECT title, pubDate as "Publication Date"
-- FROM Books;

-- REM 4
SELECT customer#, city, Customers.state
FROM Customers;

-- REM 5
SELECT Name, Contact as "Contact Person", phone
FROM publisher;

-- REM 6
SELECT Distinct Category
FROM Books;

-- REM 7
SELECT Distinct /*or unique*/ Customer#
FROM Orders;

-- REM 8
SELECT Category, Title
FROM Books;

-- REM Advanced Challenges

-- REM 1
SELECT LastName || ', ' || FirstName as "Name", Address, City || ', ' || State as "Location", Zip
FROM Customers;

-- REM 2
SELECT Title, ((Retail-Cost)/cost)* 100 as "Profit %"
FROM Books;


















