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
      SELECT ROLE, TABLE_NAME, PRIVILEGE
      FROM ROLE_TAB_PRIVS
      WHERE ROLE = pi_role_Name;
END;

CL SCR;
SET SERVEROUTPUT ON;
variable cur refcursor;
variable role_Name NVARCHAR2;
execute get_role_privileges(:cur,'NHAN_VIEN_QUAN_LY');
print cur;

SELECT *
FROM ROLE_TAB_PRIVS
WHERE ROLE = 'NHAN_VIEN_QUAN_LY'

CREATE ROLE nhan_vien_quan_ly;
GRANT INSERT ON CTHoaDon to nhan_vien_quan_ly;