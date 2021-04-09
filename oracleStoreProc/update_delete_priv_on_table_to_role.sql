CREATE OR REPLACE PROCEDURE update_delete_priv_on_table_to_role
(
    pi_table IN NVARCHAR2,
    pi_role IN NVARCHAR2,
    pi_grant_option IN BOOLEAN
)
AS
    lv_stmt NVARCHAR2(200);
BEGIN
    IF pi_grant_option = false THEN
        lv_stmt := 'REVOKE DELETE ON ' || pi_table || ' FROM ' || pi_role;
        EXECUTE IMMEDIATE(lv_stmt);
    ELSE
        lv_stmt := 'GRANT DELETE ON ' || pi_table || ' TO ' || pi_role;
        EXECUTE IMMEDIATE(lv_stmt);
    END IF;
END;

EXECUTE update_delete_priv_on_table_to_role('HOSOBENHAN', 'BAC_SI', false)

select *
from ROLE_TAB_PRIVS
WHERE ROLE = 'BAC_SI'

select count(*)
from DBA_TABLES