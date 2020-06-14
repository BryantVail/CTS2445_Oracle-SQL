
-- privileges cascade so that revoked priv's revoke from those
--> that have been given priv's by those that I've given priv's
-->> to.

SET PAGESIZE 70;
SET LINESIZE 130;

CREATE USER test_user;
IDENTIFIED BY test1;

CONNECT test_user/test1;





SELECT *
FROM session_privs;

SELECT *
FROM user_sys_privs;

SELECT *
FROM user_tab_privs;

SELECT *
FROM role_tab_privs;

SELECT *
FROM session_roles;

CONNECT pro/sysdbadmin;

REVOKE insert
ON author 
FROM authorrep;

CONNECT test_user/test1;

CONNECT prof/sysdbadmin;

REVOKE authorrep
FROM test_user;

DROP ROLE authorrep;

DROP USER test_user;


















