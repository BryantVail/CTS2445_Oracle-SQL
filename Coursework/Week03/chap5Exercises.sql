--  INSERT
INSERT INTO acctManager
  VALUES ('T500', 'NICK', 'TAYLOR', '05-SEP-09', 42000, 3500, 'NE');

-- INSERT INTO acctManager
--   VALUES('L500', 'MANDY', 'LOPEZ', '01-OCT-09', 47000, 1500);

-- INSERT INTO acctManager
--   VALUES('L500', 'MANDY', 'LOPEZ', '01-OCT-09', 47000, 1500, '');

INSERT INTO acctManager
  VALUES('L500', 'MANDY', 'LOPEZ', '01-OCT-09', 47000, 1500, NULL);

INSERT INTO acctManager (amid, amfirst, amlast, amsal, amcomm, region)
  VALUES('J500', 'SAMMIE', 'JONES', DEFAULT, 39500, 2000, 'NW');

--
-- DATA DICTIONARY
--

SELECT table_name, column_name, data_default, default_on_null
  FROM user_tab_columns
  WHERE table_name = 'AcctManager';

--
-- VIRTUAL COLUMNS
--
ALTER TABLE AcctManager
  ADD (amEarn AS (amsal + amComm));

--Add record with virtual column existing
INSERT INTO AcctManager (amId, amfirst, amlast, amsal, amComm, region)
  VALUES('D500', 'SCOTT', 'DAVIS', 53000, 6000, 'SE');
  
-- ESCAPE SINGLE QUOTE
INSERT INTO AcctManager (amid, amfirst, amlast, amsal, amcomm, region)
  VALUES ('M500', 'PEG', 'O''HARA', 46000, 2000, 'SW');

-- INSERT INTO with Subquery
INSERT INTO acctBonus (amid, amsal, region)
  (
    SELECT amid, amsal, region 
    FROM acctManager
  );

--
-- UPDATE EXISTING RECORD
--
-- UPDATE tableName
-- SET columnName  = new_datavalue, ...
-- [WHERE condition];

UPDATE AcctManager
  SET amedate = '01-AUG-09'
  WHERE amId = 'J500';

UPDATE AcctManager
  SET region = 'W'
  WHERE region IN('NE', 'NW');

UPDATE AcctManager
  SET 
    amedate = '10-OCT-09',
    region = 'S'
  WHERE amId = 'L500';


UPDATE customers
  SET region = '';

UPDATE customers
  SET region = 'W'
  WHERE State = 'CA';

-- SUBSTITUTION VARIABLES
UPDATE customers 
  SET region = '&Region'
  WHERE state = '&State';

--
-- DELETE ROWS
--
DELETE FROM AcctManager
  WHERE amId = 'J500';




-- TRANSACTION CONTROL STRATEMENTS
COMMIT;


UPDATE acctManager
  SET region = 'E'
  WHERE amId = 'N500';
COMMIT;

UPDATE acctManager
  SET region = 'E'
  WHERE amId = 'T500';

UPDATE acctManager
  SET region = 'E'
  WHERE amId = 'L500';

SAVEPOINT One;

UPDATE acctManager
  SET amcomm = 6600
  WHERE amId = 'T500';