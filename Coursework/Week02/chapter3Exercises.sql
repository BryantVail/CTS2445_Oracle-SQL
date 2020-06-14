-- chapter 3 exercises

CREATE TABLE ACCTMANAGER
(
  AmId CHAR(4) NOT NULL,
  AmFirst VARCHAR2(12) NOT NULL,
  AmLast VARCHAR(12) NOT NULL,
  AmEDate DATE DEFAULT SYSDATE,
  AmSal NUMBER(15,2) NULL,
  AmComm NUMBER(15,2) DEFAULT 0,
  AmEarn  AS (AmSal + AmComm) ,
  Region CHAR(2) NULL
);

--User_Tables
SELECT table_name
  FROM user_tables;

--Describe
DESC acctmanager;

--USER_TAB_COLUMNS
SELECT column_name, data_type, data_default
  FROM user_tab_columns 
  WHERE table_name = 'ACCTMANAGER';

--Invisible Column
CREATE TABLE Test_Invisible
(
  col1 CHAR(1) NOT NULL,
  col2 NUMBER(4) INVISIBLE
);

--USER_TAB_COLS
SELECT column_name, hidden_column
  FROM user_tab_cols 
  WHERE table_name = 'Test_Invisiblt'

--Create Table AS
CREATE TABLE cust_mkt
  AS (
    SELECT customer#, city, state, zip, referred, region 
      FROM Customers
  );

--ALTER TABLE
--ALTER TABLE
--ALTER TABLE

--ADD
ALTER TABLE publisher
  ADD (
    Extension Number(4)
  );

--ADD multiple columns
ALTER TABLE publisher 
  ADD(
    Extension Number(4),
    Abbreviation VARCHAR2(15)
  );

--MODIFY TABLE
--MODIFY TABLE
--MODIFY TABLE

--column datatype/size modification
ALTER TABLE books
  MODIFY (
    title VARCHAR2(10)
  );

ALTER TABLE books 
  MODIFY (
    retail NUMBER(5,1); -- cannot decrease precision regardless of the current column values
  );

--Default modified
ALTER TABLE publisher 
  ADD(
    rating CHAR(1)
  );

ALTER TABLE publisher 
  MODIFY (
    rating DEFAULT 'N'
  );

--Increase VARCHAR2 size
ALTER TABLE acctmanager
  MODIFY(
    AmLast VARCHAR2(18)
  );

--DROP
ALTER TABLE publisher 
  DROP COLUMN Extension;

--SET UNUSED
--SET UNUSED
--SET UNUSED

ALTER TABLE cust_mkt
  SET UNUSED (state);

--TRUNCATE
--TRUNCATE
--TRUNCATE

TRUNCATE TABLE cust_mkt_092009;

--DROP TABLE
DROP TABLE cust_mkt 

--FLASHBACK
FLASHBACK TABLE cust_mkt
  TO BEFORE DROP;

--PURGE TABLE
PURGE TABLE "BIN$gaoA7xgCTX0MHh+DHHaciQ==$0";



