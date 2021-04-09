CL SCR;
CREATE OR REPLACE PROCEDURE table_properties
(
   pi_table_name IN NVARCHAR2,
   CURSOR_ OUT SYS_REFCURSOR
)
AS
BEGIN
   OPEN CURSOR_ FOR
      select column_name
        from USER_tab_columns 
            where table_Name = UPPER(pi_table_name);
    --DBMS_OUTPUT.put_line(pi_table_name);
END;

SET SERVEROUTPUT ON;
variable myv REFCURSOR;
execute table_properties ('benhnhan',:myv);
print myv

--select OBJECT_NAME from all_users;

--select name from 
--desc name from all_users

--SELECT
--column_name "Name" FROM user_tab_columns
--WHERE table_name='BS';


--select column_name
--from USER_tab_columns 
--where table_Name = UPPER('benhnhan') 