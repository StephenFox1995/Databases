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


--CREATE OR REPLACE TRIGGER gameadmin_ai
--AFTER INSERT ON gameadmin
--FOR EACH ROW 
--BEGIN
--  INSERT INTO CHALLENGE_LOGTABLE values('gameadmin table', 
--  :new.gameadminid, 
--  TO_CHAR(user),
--  'INS',
--  sysdate);
--END;

DROP TABLE CHALLENGE_LOGTABLE;

CREATE TABLE CHALLENGE_LOGTABLE (
  tablename varchar(20),
  gameadminid varchar2(4),
  userLogin varchar(255),
  auditor char(3) CHECK (auditor IN ('INS','UPD','DEL')),
  sys_date DATE
);

delete from challenge where challengeid = 'C006';
delete from gameadmin where gameadminid = 'A010';
insert into challenge values('C006', 'Football', '09:09:12');
insert into gameadmin values('A010', 'C006');

drop table challenge_logtable;

select * from challenge_logtable;
