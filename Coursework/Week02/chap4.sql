-- Bryant Vail
-- Chapter 4

-- 1
CREATE TABLE Store_Reps(
  rep_Id NUMBER(5),
  last VARCHAR2(15),
  first VARCHAR2(10),
  comm CHAR(1) DEFAULT 'Y',
  CONSTRAINT Store-Reps_rep-id_pk PRIMARY KEY(rep_id)
);

-- 2
ALTER TABLE store_reps
  MODIFY (
    First CONSTRAINT store_reps_first_nn NOT NULL,
    Last CONSTRAINT store_reps_last_nn NOT NULL
  );

-- 3
ALTER TABLE store_reps 
  ADD CONSTRAINT store_reps_comm_ck CHECK (
    comm = 'Y'
    OR 
    comm = 'N'
  );

-- 4
ALTER TABLE Store_Reps 
  ADD
    Base_Salary NUMBER(7,2)
    CONSTRAINT Store_Reps_Base_Salary_ck CHECK (
      Base_Salary > 0
    );

-- 5
CREATE TABLE book_stores (
  Store_id NUMBER(8),
  Name VARCHAR2(30) NOT NULL,
  Contact VARCHAR2(30),
  Rep_id VARCHAR2(5),
  CONSTRAINT book_stores_Name_uk UNIQUE(Name),
  CONSTRAINT book_stores_Store_id_pk PRIMARY KEY(Store_Id)
);

-- 6
-- adjustment to align data types between: 
  -- Book_Stores & Store_Reps
ALTER TABLE book_stores 
    MODIFY(
    Rep_id NUMBER(5)
  );
ALTER TABLE book_stores ADD 
  CONSTRAINT book_stores_Store_reps_fk FOREIGN KEY (rep_id)
    REFERENCES store_reps (rep_id) ;

-- 7
ALTER TABLE book_stores 
  MODIFY(
    CONSTRAINT book_stores_store_reps_fk FOREIGN KEY(rep_id)
      REFERENCES store_reps (rep_id) ON DELETE CASCADE
  );





