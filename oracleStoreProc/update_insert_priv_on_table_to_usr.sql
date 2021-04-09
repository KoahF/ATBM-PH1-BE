CREATE OR REPLACE PROCEDURE update_insert_priv_on_table_to_usr 
(
    pi_table IN NVARCHAR2,
    pi_usr IN NVARCHAR2,
    pi_grant_option IN BOOLEAN,
    pi_with_grant_option IN BOOLEAN
)
AS
    lv_stmt NVARCHAR2(200);
    invalid_options EXCEPTION;
BEGIN
    IF pi_grant_option = false THEN
        IF pi_with_grant_option = false THEN
            lv_stmt := 'REVOKE INSERT ON ' || pi_table || ' FROM ' || pi_usr;
            EXECUTE IMMEDIATE(lv_stmt);
        ELSE
            RAISE invalid_options;
        END IF;
    ELSE
        IF pi_with_grant_option = true THEN
            lv_stmt := 'GRANT INSERT ON ' || pi_table || ' TO ' || pi_usr || ' WITH GRANT OPTION';
            EXECUTE IMMEDIATE(lv_stmt);
        ELSE
            lv_stmt := 'GRANT INSERT ON ' || pi_table || ' TO ' || pi_usr;
            EXECUTE IMMEDIATE(lv_stmt);
        END IF;
    END IF;
EXCEPTION
    WHEN invalid_options THEN
        raise_application_error(-20098,'User must have insert privilege before having WITH GRANT OPTIONS privilege on insert');
END;

CREATE USER bacsi3 IDENTIFIED BY 123

execute update_insert_priv_on_table_to_usr ('HOSOBENHAN', 'BACSI3', false, false)
GRANT INSERT ON HOSOBENHAN TO BACSI3

select *
from dba_users

select *
from dba_tab_privs
where GRANTEE = 'BACSI3'

