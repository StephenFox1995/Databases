-- Constraint trigger.
CREATE OR REPLACE TRIGGER obstacle_bi
BEFORE INSERT ON obstacle
FOR EACH ROW
DECLARE
  prefix char(1);
BEGIN
  prefix := substr(:new.obstacleid, 0, 1);
  IF prefix != 'O' THEN
     RAISE_APPLICATION_ERROR
      (-20000, ' OBSTALCE.OBSTALCEID: OBSTACLE does not have correct prefix. Must begin with O');
  END IF;
END;



-- Audit trigger.
CREATE OR REPLACE TRIGGER OBSTACLE_AI
AFTER INSERT ON obstacle
FOR EACH ROW
BEGIN
    INSERT INTO OBSTACLE_LOGTABLE values('obstacle table',
  :new.obstalceid,
  :new.gameadminid,
  TO_CHAR(user),
  'INS',
  sysdate);
END;


CREATE TABLE OBSTACLE_LOGTABLE (
  tablename varchar(20),
  obstacleid varchar2(4),
  gameadminid varchar(4),
  userLogin varchar(255),
  auditor char(3) CHECK (auditor IN ('INS','UPD','DEL')),
  sys_date DATE
)
