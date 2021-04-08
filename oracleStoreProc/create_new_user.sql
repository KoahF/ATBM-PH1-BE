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
