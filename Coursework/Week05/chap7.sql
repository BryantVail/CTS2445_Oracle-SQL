--Bryant Vail
--Chapter 7
--due 6/14/2020

--Hands-On Assignment

-- #1
CREATE USER bvail
IDENTIFIED BY initialPassword
PASSWORD EXPIRE;

-- #2
CONNECT bvail
initialPassword 
permPassword

-- #3
GRANT CREATE SESSION, CREATE TABLE, ALTER ANY TABLE
TO bvail; 

-- #4
-- create a role named CUSTOMERREP 
-- that allows: inserting and deleting
-- IN: ORDERS and ORDERITEMS
CREATE ROLE customerRep;

GRANT insert, delete 
ON ORDERITEMS 
TO customerrep;

GRANT insert, delete 
ON ORDERS
TO customerrep;

-- #5
GRANT customerRep
TO bvail; 

-- #6
CONNECT bvail
permPassword

SELECT *
FROM  session_privs;

-- #7
REVOKE DELETE 
ON orders
FROM customerRep;

REVOKE DELETE 
ON orderitems
FROM customerRep;

-- #8
REVOKE customerRep 
FROM bvail;

-- #9
DROP ROLE customerRep;

-- #10
DROP USER bvail;

-- ADVANCED CHALLENGE

--
-- #1
--
-- account manager: 
--    > promotions based on customers’ previous purchases or for specific books
--REM Tables for AccountManager: Orders, Customers, Books, OrderItems, Promotion

--data entry clerk: 
--    > inventory updates (for example, add new books and publishers, change prices, and so on
-- REM Tables for data entry clerk: Books, Publisher, Author, BookAuthor

-- CSR
--    > adding new customers and entering orders in the database.
--REM Tables for CSRs: Customers, Orders, OrderItems, Promotion

--#2
--AccountManager:
--  ORDERS: select
--  CUSTOMERS: select, 
--  BOOKS: select,
--  ORDERITEMS: select, 
--  PROMOTION: select, insert, update

--Data Entry Clerk: 
--  BOOKS: select, update, insert
--  PUBLISHER: select, update, insert
--  AUTHOR: select, insert
--  BOOKAUTHOR: select, insert

--CSR: 
--  CUSTOMERS: select, insert, update
--  ORDERS: select, insert 
--  ORDERITEMS: select, insert 
--  PROMOTION: select

--#3
CREATE ROLE accountManager; 
--  ORDERS: select
--    > acct manager seemingly only needs to view existing orders to inform the job role for promotions
--  CUSTOMERS: select, 
--    > acct manager seemingly only needs to view existing customers base on their behavior to inform the job role for promotions
--  BOOKS: select,
--    > acct manager seemingly only needs to view existing books associated with orders to inform the job role for promotions
--  ORDERITEMS: select, 
--    > acct manager seemingly only needs to view existing book to order combinations to inform the job role for promotionsd
--  PROMOTION: select, insert
--    > account manager would need to see existing promotions, update promotions, and create new promotions to facilitate management of promotional offers.

GRANT select 
ON ORDERS 
TO accountManager;

GRANT select 
ON CUSTOMERS  
TO accountManager;

GRANT select 
ON BOOKS 
TO accountManager;

GRANT select 
ON ORDERITEMS 
TO accountManager; 

GRANT select, insert 
ON PROMOTION 
TO accountManager; 

CREATE ROLE dataEntryClerk;
--  BOOKS: select, update, insert
--    > to create, read, and update books seemed directly necessary to the job role
--  PUBLISHER: select, update, insert
--    > to create, read, and update publishers seemed directly necessary to the job role
--  AUTHOR: select, insert
--    > authors would be viewed & added, I did not see utility in dataEntry clerk's ability to update an author.
--  BOOKAUTHOR: select, insert
--    > authors associated with books would be viewed & added, I did not see utility in dataEntry clerk's ability to update a book by adding an author to an existing book.

GRANT select, update, insert 
ON BOOKS 
TO dataEntryClerk; 

GRANT select, update, insert 
ON PUBLISHER 
TO dataEntryClerk;

GRANT select, insert 
ON AUTHOR 
TO dataEntryClerk;

GRANT select, insert 
ON BOOKAUTHOR 
TO dataEntryClerk;

CREATE ROLE customerServiceRepresentative;
--  CUSTOMERS: select, insert, update
--    > I found delete to not be appropriate for security/posterity reasons, so all other privileges to view, update, and create a record seemed appropriate
--  ORDERS: select, insert
--    > select & insert to view and create orders, though updating seemed like something that should be elevated to maintain data integrity. 
--  ORDERITEMS: select, insert 
--    > select & insert to view and create orderitems to support creating orders, though updating seemed like something that should be elevated to maintain data integrity. 
--  PROMOTION: select
--    > viewing available promotions was the only privilege I found appropriate.

GRANT select, update, insert 
ON CUSTOMERS 
TO customerServiceRepresentative; 

GRANT select, insert 
ON ORDERS 
TO customerServiceRepresentative; 

GRANT select, insert 
ON ORDERITEMS 
TO customerServiceRepresentative; 

GRANT select 
ON PROMOTION 
TO customerServiceRepresentative;

-- #4
DROP ROLE accountManager;
DROP ROLE dataEntryClerk;
DROP ROLE customerServiceRepresentative;



