set serveroutput on;
select * from gameadmin;
CREATE OR REPLACE Trigger correctPrefixGameAdminID
AFTER INSERT ON gameadmin
FOR EACH ROW
BEGIN
  dbms_output.put_line(:new.gameadminid || :old.gameadminid);
END;