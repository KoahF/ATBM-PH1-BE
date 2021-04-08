
--Tao role
CL SCR;
CREATE OR REPLACE PROCEDURE create_new_role (
    pi_role_name NVARCHAR2
)
AS
    li_count INT := 0;
    existed_role EXCEPTION;
    lv_stmt NVARCHAR2(200);
BEGIN
    select COUNT(1)
    into li_count
    from dba_roles
    where role = pi_role_name;
    
    IF li_count != 0 THEN
        RAISE existed_role;
    END IF;
    
    lv_stmt := 'CREATE ROLE ' || pi_role_name || ' NOT IDENTIFIED';
    EXECUTE IMMEDIATE(lv_stmt);
EXCEPTION
    WHEN existed_role THEN
        raise_application_error(-20002, 'Role already existed');
END;

execute create_new_role('DucHuy');

select *
from all_tables
where table_name = 'RULE_SET$'