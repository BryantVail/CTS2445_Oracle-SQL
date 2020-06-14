-- column level constraint syntax
-- > columnName [CONSTRAINT constraintName] constraintType

-- table level constraint
-- > [CONSTRAINT constraintName] constraintType
      -- (columnName, columnName)

-- Primary Key__
-- ALTER TABLE tableName
  -- ADD [CONSTRAINT constraintName] PRIMARY KEY (columnName, ...)

-- NOT NULL__
-- ALTER TABLE tableName
  -- MODIFY (
  --   columnName [CONSTRAINT constraintName] NOT NULL
  -- )

-- Foreign Key__
--ALTER TABLE tableName
  --ADD [CONSTRAINT constraintName] FOREIGN KEY(columnName)
  --REFERENCES referencedTableName (referencedColumnName);




ALTER TABLE customers 
  ADD  CONSTRAINT customers_customer#_pk PRIMARY KEY(Customer#);

ALTER TABLE orderitems
  ADD CONSTRAINT orderItems_order#item#_pk PRIMARY KEY(order#, item#);














