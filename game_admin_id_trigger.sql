set serveroutput on;
select * from gameadmin;
select * from challenge;
CREATE OR REPLACE Trigger correctPrefixGameAdminID
AFTER INSERT ON gameadmin
FOR EACH ROW
BEGIN
  dbms_output.put_line('Triggggger:' || :new.gameadminid || :old.gameadminid);
END;

INSERT INTO challenge values('C010', 'Race', '06:06:10');
INSERT INTO gameadmin values('A010', 'C010');