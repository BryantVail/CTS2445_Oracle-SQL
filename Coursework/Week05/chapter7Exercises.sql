-- Chapter 7 Exercises
--
-- utilities
-- ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- GRANT SYSDBA TO username;
-- GRANT ALL PRIVILEGES TO username;

--
-- CREATING A USER
--
CREATE USER username
IDENTIFIED BY password;

-- PASSWORD EXPIRE
CREATE USER bvail
IDENTIFIED BY oracle12c
PASSWORD EXPIRE;

-- SYSTEM_PRIVILEGE_MAP
SELECT name
FROM system_privilege_map;

-- GRANT systemPrivilege [, systemPrivilege, ...]
  -- TO username | rolename [, username|rolename, ...]
  -- [WITH ADMIN OPTION];

GRANT CREATE SESSION
 TO bvail;

 GRANT select, insert 
 ON bvail.customers
 TO steph;

GRANT select, update(lastname, firstname)
ON bvail.customers 
TO steph;

GRANT ALL 
  ON bvail.customers 
  TO steph 
  WITH GRANT OPTION;

GRANT UPDATE (title, pubdate)
  ON bvail.books
  TO steph;

ALTER USER steph 
  IDENTIFIED BY newpassword
  PASSWORD EXPIRE;

--
-- ROLES
--

CREATE ROLE orderentry;

-- assign privileges
GRANT select, insert, update 
  ON bvail.customers 
  TO orderentry; 
GRANT select, insert, update 
  ON bvail.ORDERS 
  TO orderentry;
GRANT select, insert, update 
  ON bvail.ORDERITEMS 
  TO orderentry;

GRANT orderentry
  TO steph;

-- compound role
CREATE ROLE supervisor;

GRANT orderentry, billing 
  TO supervisor;

ALTER USER steph 
  DEFAULT ROLE orderentry; 

ALTER USER steph 
  DEFAULT ROLE ALL;

ALTER USER steph 
  DEFAULT ROLE 
  ALL EXCEPT mod tables;

--
-- SET ROLE
--
ALTER ROLE supervisor 
  IDENTIFIED BY password;

--
-- VIEWING PRIVILEGE INFO
--
SELECT *
FROM role_tab_privs
WHERE role = 'orderentry'
ORDER BY table_name;

SELECT *
FROM user_sys_privs;

SELECT *
FROM user_role_privs;

--
-- REVOKE PRIVILEGES
--
REVOKE DELETE 
ON customers 
FROM orderentry;

REVOKE orderentry 
FROM steph;






