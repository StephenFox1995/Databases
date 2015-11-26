SET serveroutput ON;

DECLARE
  leader leaderboard.score%TYPE;
BEGIN
  leader := find_leader;
  dbms_output.put_line(leader);
END;