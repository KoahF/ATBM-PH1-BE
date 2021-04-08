CL SCR;
CREATE OR REPLACE PROCEDURE delete_user (
    pi_usr NVARCHAR2
)
AS
    delete_sys EXCEPTION;
    lv_stmt NVARCHAR2(200);
BEGIN
    IF pi_usr = 'sys' OR pi_usr = 'system' THEN
        RAISE delete_sys;
    END IF;
    lv_stmt := 'DROP USER ' || pi_usr;
    EXECUTE IMMEDIATE (lv_stmt);
EXCEPTION
    WHEN delete_sys THEN
        raise_application_error(-20003, 'Cannot delete user sys/system');
    
END;

execute delete_user('nhanvien1')
