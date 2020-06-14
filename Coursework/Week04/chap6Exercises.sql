-- chap6Exercises.sql

-- SEQUENCES
-- CREATE SEQUENCE SequenceName
-- [INCREMENT BY value]
-- [START WITH value]
-- [{MAXVALUE value} | NOMAXVALUE]
-- [{MINVALUE value} | NOMINVALUE]
-- [{CYCLE | NOCYCLE}]
-- [{ORDER | NOORDER}]
-- [{CACHE value | NOCACHE}]

--simple SEQUENCE
CREATE SEQUENCE customers_customer#_seq;

-- INCREMENT BY
--  DEFAULT: 1

-- START WITH
--  DEFAULT: 1

-- MINVALUE | NOMINVALUE (185)

-- MAXVALUE | NOMAXVALUE (185)

-- CYCLE | NOCYCLE (185)
--  DEFAULT: NOCYCLE

-- ORDER | NOORDER (p186)
--    Speaks to whether the numbers need to remain consecutive during requests that are simultaneous

-- NOCACHE | CACHE

--_______________________________________________________
-- Examples

CREATE SEQUENCE Orders_Order#_seq 
START WITH 1021
INCREMENT BY 1
NOCACHE 
NOCYCLE;

-- USER_OBJECTS
--    query which sequences exist
SELECT object_name
FROM user_objects
WHERE object_type = 'SEQUENCE';

-- USER_SEQUENCES
SELECT *
FROM user_sequences;

-- SEQUENCE VALUES

-- NEXTVAL (NEXT VALUE)
INSERT INTO orders (order#, customer#, orderdate, shipdate, shipstreet, shipcity, shipstate, shipzip)
VALUES(
  orders_order#_seq.NEXTVAL, 1010, '06-apr-09', null, '123 West Main', 'ATLANTA', 'GA', 30418
);

-- CURRVAL (CURRENT VALUE)
INSERT INTO orderitems (order#, item#, isbn, quantity, paideach)
VALUES (orders_order#_seq.CURRVAL, 1, 8117949391, 1, 8.50);

-- SEQUENCE AS A DEFAULT VALUE IN A TABLE
CREATE SEQUENCE test_defval_seq
INCREMENT BY 1
START WITH 100
NOCACHE 
NOCYCLE; 

-- Did not run properly
--    ORA-00984: column not allowed here
CREATE TABLE test_defval(
  col1 NUMBER DEFAULT test_defval_seq.NEXTVAL, 
  col2 NUMBER
);

-- ALTER SEQUENCE
-- ALTER SEQUENCE sequenceName 
--   [INCREMENT BY value]
--   [{MAXVALUE value | NOMAXVALUE}]
--   [{MINVALUE value | NOMINVALUE}]
--   [{CYCLE | NOCYCLE}]
--   [{ORDER | NOORDER}]
--   [{CACHE value | NOCACHE}]

ALTER SEQUENCE orders_order#_seq 
  INCREMENT BY 10;

-- REMOVE A SEQUENCE 
-- DROP SEQUENCE sequenceName;
DROP SEQUENCE orders_order#_seq;

-- IDENTITY PRIMARY KEY
CREATE TABLE test_ident 
(
  col1 NUMBER GENERATED AS IDENTITY, 
  col2 NUMBER
);

-- INSERT INTO with Identity defined on the table

-- default value implicitly used
INSERT INTO test_ident(col2)
  VALUES(350);

-- cannot explicitly define an 'always'
INSERT INTO test_ident (col1, col2)
  VALUES(222, 355);

-- DEFAULT value used
INSERT INTO test_ident (col1, col2)
  VALUES(DEFAULT, 360);


--
-- INDEXES
--

-- CREATE INDEX (B-TREE)
CREATE INDEX Customers_Zip_idx
  ON Customers(zip);

-- query to use the 'Execution Explain Plan'
SELECT customer#, lastname, city, state, zip 
  FROM customers 
  WHERE zip = 49006;

-- Hint Query; query telling the system to use the index
SELECT /*+INDEX(customers)*/ customer#, lastname, city, state, zip 
  FROM customers 
  WHERE zip = 49006;

-- Unique index
CREATE UNIQUE INDEX books_title_idx
ON books (title);

-- Descending
CREATE INDEX customers_zip_desc_idx
  ON Customers (zip DESC);

-- COMPOSITE/CONCATENATED INDEX
CREATE INDEX customer_name_idx
  ON Customer(lastname, firstname);

--
-- BITMAP INDEXES
--
CREATE BITMAP INDEX customers_region_idx
  ON customers(region);













