-- Bryant Vail
-- Chapter 5

-- Hands-On 1
INSERT INTO orders (order#, customer#, orderdate)
  VALUES(1021, 1009, '20-jul-09');

-- Hands-On 6
UPDATE Books
  SET Cost = '&Cost'
  WHERE isbn = '&isbn';

-- Hands-On 9
ALTER TABLE OrderItems
  DROP CONSTRAINT orderitems_order#_fk;

ALTER TABLE orderItems 
  ADD CONSTRAINT OrderItems_Order#_fk FOREIGN KEY (order#)
    REFERENCES Orders (order#) ON DELETE CASCADE;

DELETE FROM Orders 
  WHERE order# = 1005;

-- Hands-On 10
ROLLBACK;

-- ADVANCED CHALLENGE
CREATE TABLE category(
  catCode CHAR(3),
  CatDesc VARCHAR2(25)
);

INSERT INTO category (catcode, catdesc)
  VALUES(
    'BUS', 'BUSINESS',
    'CHN', 'CHILDREN',
    'COK', 'COOKING',
    'COM', 'COMPUTER', 
    'FAL', 'FAMILY LIFE', 
    'FIT', 'FITNESS', 
    'SEH', 'SELF HELP', 
    'LIT', 'LITERATURE'
  );

ALTER TABLE books 
  ADD (CatCode CHAR(3) NOT NULL);

UPDATE books 
  SET catCode = '&catCode'
  WHERE category = '&category';

-- COMPUTER
-- COOKING
-- CHILDREN
-- LITERATURE
-- BUSINESS
-- FITNESS
-- FAMILY LIFE
-- SELF HELP

ALTER TABLE Books
  ADD CONSTRAINT books_catCode_fk FOREIGN KEY (catCode )
  REFERENCES Category (catCode);

ALTER TABLE BOOKS
  DROP COLUMN CATEGORY

