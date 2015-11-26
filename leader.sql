CREATE OR REPLACE FUNCTION find_leader
RETURN NUMBER
IS
  highest_score leaderboard.score%TYPE;
BEGIN 
  SELECT MAX(score) INTO highest_score
  FROM leaderboard;
  RETURN highest_score;
END;
  