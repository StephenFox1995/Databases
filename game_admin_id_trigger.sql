CREATE OR REPLACE TRIGGER gameadmin_bi
BEFORE INSERT ON gameadmin
FOR EACH ROW
DECLARE
  prefix char(1);
BEGIN
  prefix := substr(:new.gameadminid, 0, 1);

  IF prefix != 'A' THEN
     RAISE_APPLICATION_ERROR 
      (-20000, ' GAMEADMIN.GAMEADMINID: Admin does not have correct prefix. Must begin with A');
  END IF;  
END;
