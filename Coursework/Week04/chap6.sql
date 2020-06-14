-- Bryant Vail
-- Chapter 6

-- #1
CREATE SEQUENCE Customers_Customer#_seq (
  START WITH 1021
  INCREMENT BY 1
  NOCYCLE
  NOCACHE
);

-- lookup user_sequences
SELECT *
FROM user_sequences;

-- #2
INSERT INTO customers ( customer#, lastName, firstName, zip)
VALUES (
  Customers_Customer#_seq.NEXTVAL, 'Shoulders', 'Frank', 23567
);

SELECT *
FROM customers 
WHERE customer# = 1021;

DELETE SEQUENCE Customers_Customer#_seq;

DELETE FROM customers 
WHERE customer# = 1021;

-- #3
CREATE SEQUENCE My_First_Seq
  START WITH 5
  INCREMENT BY -3
  MINVALUE 0
  MAXVALUE 5
  NOCYCLE;

SELECT *
FROM user_sequences;

-- #4
SELECT My_First_Seq.NEXTVAL 
FROM DUAL;

SELECT My_First_Seq.NEXTVAL
FROM DUAL;

SELECT My_First_Seq
FROM DUAL;

--last attempt asks for a 'nextval' below the minvalue.

-- #5
ALTER SEQUENCE My_First_Seq
  MINVALUE -1000;

SELECT *
FROM  user_sequences;

-- #7
CREATE SYNONYM NUMGEN
FOR My_First_Seq;

-- #8
SELECT NUMGEN.CURRVAL
FROM DUAL;

DROP SYNONYM NUMGEN;

DROP SEQUENCE My_First_Seq;

-- #10
-- Create a B-tree index on the customer’s Lastname column. Verify that the index exists by querying the data dictionary. Remove the index from the database.
CREATE INDEX Customers_LastName_idx
ON Customers (lastName);

SELECT * --or "table_name, index_name, index_type" as from book
FROM user_indexes
WHERE TABLE_NAME = 'CUSTOMERS';

DROP INDEX Customers_LastName_idx;

-- #11
-- Many queries search by the number of days to ship (number of days between the order and shipping dates). Create an index that might improve the performance of these queries.
CREATE INDEX Orders_daysToShip_idx
ON Orders (ShipDate - OrderDate);

SELECT * --or "table_name, index_name, index_type" as from book
FROM user_indexes
WHERE table_name = 'ORDERS';

DROP INDEX Orders_daysToShip_idx;

