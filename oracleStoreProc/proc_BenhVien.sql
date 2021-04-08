CL SCR;
CREATE OR REPLACE PROCEDURE getUsers
(
   CURSOR_ OUT SYS_REFCURSOR
)
AS
BEGIN
   OPEN CURSOR_ FOR
      SELECT USER_ID, USERNAME FROM ALL_USERS;
END;
SET SERVEROUTPUT ON;
variable myv refcursor;
execute getUsers (:myv);
print myv;

--Thong tin ve quyen cua USER
CL SCR;
CREATE OR REPLACE PROCEDURE get_User_Privileges
(
   CURSOR_ OUT SYS_REFCURSOR, 
   pi_user_Name IN NVARCHAR2
)
AS
BEGIN
   OPEN CURSOR_ FOR
      SELECT GRANTEE, PRIVILEGE
      FROM DBA_SYS_PRIVS
      WHERE GRANTEE = pi_userName;
END;

CL SCR;
SET SERVEROUTPUT ON;
variable myv refcursor;
variable userName NVARCHAR2
execute get_User_Privileges(:myv,'DBA');
print myv;

--Thong tin ve quyen cua ROLE
CL SCR;
CREATE OR REPLACE PROCEDURE get_Role_Privileges
(
   CURSOR_ OUT SYS_REFCURSOR, 
   pi_Role_Name IN NVARCHAR2
)
AS
BEGIN
   OPEN CURSOR_ FOR
      SELECT GRANTEE, GRANTED_ROLE
      FROM DBA_ROLE_PRIVS
      WHERE GRANTEE = pi_role_Name;
END;


CL SCR;
SET SERVEROUTPUT ON;
variable cur refcursor;
variable role_Name NVARCHAR2;
execute get_role_privileges(:cur,'DBA');
print cur;

--Tao user moi
CL SCR;
CREATE OR REPLACE PROCEDURE create_New_User
(
    pi_usr IN NVARCHAR2,
    pi_pwd IN NVARCHAR2
)
AS
    li_count INT := 0;
    lv_stmt VARCHAR2(200);
    usr NVARCHAR2(20) := pi_usr;
    pwd NVARCHAR2(20) := pi_pwd;
BEGIN
    SELECT COUNT (1)
    INTO li_count
    FROM dba_users
   	WHERE username = UPPER ( pi_usr );

    --Neu quen cach ra 'CREATE USER ' thi se bi loi invalid options
    --cac cho khac cung tuong tu
    lv_stmt := 'CREATE USER ' || pi_usr || ' IDENTIFIED BY ' || pi_pwd ||
    ' DEFAULT TABLESPACE SYSTEM';
    
    EXECUTE IMMEDIATE(lv_stmt);
END;

--Neu bi loi invalid common username.... Chinh lai connection, Service: XEPDB1
CL SCR;
execute create_New_User('nhanvienkhambenh', '123');

select *
from dba_users
order by created DESC
