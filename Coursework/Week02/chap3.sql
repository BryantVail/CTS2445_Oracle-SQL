-- Bryant Vail
-- Chapter 3

-- 2
CREATE TABLE Employees (
  Emp# Number(5, 0),
  FirstName VARCHAR2(50),
  LastName VARCHAR2(50),
  Job_Class VARCHAR2(4)
);

-- 3
ALTER TABLE Employees 
  ADD(
    EmpDate DATE DEFAULT SYSDATE,
    EndDate DATE
  );

-- 4
ALTER TABLE Employees 
  MODIFY(
    Job_Class VARCHAR2(2)
  );

-- 5
ALTER TABLE Employees 
  DROP COLUMN EndDate;

-- 7
CREATE TABLE JL_EMPS
  AS (
    SELECT isbn, cost, retail, category
    FROM Customers
  );

-- Advanced Challenge
ALTER TABLE AcctManager
  ADD(
    Comm_id NUMBER(2,0) DEFAULT 10,
    Ben_id NUMBER(2, 0)
  );

-- Advanced Challenge
CREATE TABLE CommRate(
  Comm_id NUMBER(2,0) DEFAULT 10,
  Comm_Rank VARCHAR2(15),
  Rate NUMBER(2,2)
);

-- Advanced Challenge
CREATE TABLE Benefits(
  Ben_id NUMBER(2,0) DEFAULT 10,
  Ben_Plan CHAR(1),
  Ben_Provider NUMBER(3,0),
  Active CHAR(1)
);





















