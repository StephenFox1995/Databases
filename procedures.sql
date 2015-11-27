select * from gameadmin;
select * from obstacle;
select * from player;
set serveroutput on;


-- A procedure to insert an obstacle into the databse.
CREATE OR REPLACE PROCEDURE insert_obstacle (
GAME_ADMIN_ID IN  OBSTACLE.GAMEADMINID%TYPE,
OBSTACLE_ID IN OBSTACLE.OBSTACLEID%TYPE,
AWARD_POINTS IN OBSTACLE.AWARDPOINTS%TYPE,
DESCRIPTION IN OBSTACLE.DESCRIPTION%TYPE,
PLAYER_ID IN OBSTACLE.PLAYERID%TYPE)
AS
BEGIN
  IF sf_admin_exist(GAME_ADMIN_ID) THEN
    IF sf_player_exist(PLAYER_ID) THEN
      INSERT INTO OBSTACLE VALUES(OBSTACLE_ID, AWARD_POINTS, DESCRIPTION,
      GAME_ADMIN_ID, PLAYER_ID);
    ELSE
      dbms_output.put_line('Could not insert obstacle, the game player you entered,
    does not exist. Warning: A player must exist before you enter in a new
    obstacle.');
    END IF;
  ELSE
    dbms_output.put_line('Could not insert obstacle, the game admin you entered,
    does not exist. Warning: A game admin must exist before you enter in a new
    obstacle.');
  END IF;
  EXCEPTION
  WHEN others THEN
  dbms_output.put_line('Constraint violated');
END;




-- Checks to see if an admin exists already within the database.
CREATE OR REPLACE FUNCTION sf_admin_exist(admin_id gameadmin.gameadminid%TYPE)
RETURN boolean
AS
  temp_id gameadmin.gameadminid%type;
BEGIN
  SELECT gameadmin.gameadminid temp_id INTO temp_id
  FROM gameadmin
  WHERE gameadmin.gameadminid = admin_id;
  RETURN TRUE;
exception
WHEN no_data_found THEN
  RETURN FALSE;
END sf_admin_exist;


-- Checks to see if a player exists already in the database.
CREATE OR REPLACE FUNCTION sf_player_exist(player_id player.playerid%TYPE)
RETURN boolean
AS
  temp_id player.playerid%type;
BEGIN
  SELECT player.playerid INTO temp_id
  FROM player WHERE
  player.playerid = player_id;
  RETURN TRUE;
exception
WHEN no_data_found THEN
  RETURN FALSE;
END;
