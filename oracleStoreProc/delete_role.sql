CL SCR;
CREATE OR REPLACE PROCEDURE delete_role (
    pi_role NVARCHAR2
)
AS
    lv_stmt NVARCHAR2(200);
BEGIN
    lv_stmt := 'DROP ROLE ' || pi_role;
    EXECUTE IMMEDIATE (lv_stmt);
END;

execute delete_role('nhan_vien_quan_ly')

