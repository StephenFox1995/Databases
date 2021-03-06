SET serveroutput ON;
SELECT * FROM OBSTACLE;
SELECT * FROM GameAdmin;
select * from player;

DECLARE
GAME_ADMIN_ID OBSTACLE.GAMEADMINID%TYPE := '&game_admin_id';
OBSTACLE_ID OBSTACLE.OBSTACLEID%TYPE := '&obstacle_id';
AWARD_POINTS OBSTACLE.AWARDPOINTS%TYPE := '&award_points';
DESCRIPTION OBSTACLE.DESCRIPTION%TYPE := '&description';
PLAYER_ID OBSTACLE.PLAYERID%TYPE := '&player_id';
BEGIN
  insert_obstacle(GAME_ADMIN_ID, OBSTACLE_ID, AWARD_POINTS,
  DESCRIPTION, PLAYER_ID );
END;
