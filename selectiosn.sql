-- union
-- join
-- sub query

-- Selection
-- Select a player and all tools they used using and inner join.
SELECT player.playerid, tool.toolname FROM player
INNER JOIN tool ON player.playerid = tool.playerid
WHERE player.playerid = 'P001';

SELECT * FROM leaderboard;

-- Aggregate & sub query.
SELECT player.name, player.playerid, player.points, leaderboard.score from player 
JOIN leaderboard ON player.playerid = leaderboard.playerid
WHERE playerid in 
  (SELECT playerid FROM leaderboard 
   WHERE score in (
    SELECT MAX(score) FROM Leaderboard)
  );


-- Union
-- Select players who got tools and defeated obs
SELECT playerid, toolname FROM Tool
UNION
SELECT playerid, obstacle.description FROM obstacle;

-- Intersect
SELECT gameadminid FROM tool
INTERSECT
SELECT gameadminid FROM obstacle;








