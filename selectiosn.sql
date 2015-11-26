-- union
-- join
-- sub query

-- Selection
-- Select a player and all tools they used using and inner join.
SELECT player.playerid, tool.toolname FROM player
INNER JOIN tool ON player.playerid = tool.playerid
WHERE player.playerid = 'P001';

-- Aggregate.
SELECT * FROM player 
WHERE playerid = (
  SELECT MAX(leaderboard.score), leaderboard.playerid
  FROM leaderboard
  GROUP BY leaderboard.playerid
);









