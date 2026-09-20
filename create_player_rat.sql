-- SQL script to insert player 'Rat' (level 222, Sniper vocation, ML 22, Distance 100, Shielding 100)
INSERT INTO `players` (`name`, `account_id`, `group_id`, `sex`, `vocation`, `experience`, `level`, `maglevel`, `health`, `healthmax`, `mana`, `manamax`, `manaspent`, `soul`, `direction`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `posx`, `posy`, `posz`, `cap`, `town_id`, `balance`, `save`, `conditions`, `rank_id`, `guildnick`) VALUES
('Rat', 123456, 1, 1, 10, 179916200, 222, 22, 4570, 4570, 6630, 6630, 0, 400, 2, 114, 114, 114, 114, 129, 160, 54, 7, 9240, 1, 0, 1, '', 0, '')
ON DUPLICATE KEY UPDATE `level` = 222, `vocation` = 10, `health` = 4570, `healthmax` = 4570, `maglevel` = 22, `mana` = 6630, `manamax` = 6630, `cap` = 9240;

-- Set skills and equipment for Rat
SET @rat_id = (SELECT id FROM players WHERE name = 'Rat');

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(@rat_id, 4, 100, 0),
(@rat_id, 5, 100, 0)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

INSERT INTO `player_items` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(@rat_id, 101, 1, 2493, 1, NULL),
(@rat_id, 102, 3, 1988, 1, NULL),
(@rat_id, 103, 4, 2494, 1, NULL),
(@rat_id, 104, 6, 5803, 1, NULL),
(@rat_id, 105, 7, 2495, 1, NULL),
(@rat_id, 106, 8, 2195, 1, NULL),
(@rat_id, 107, 10, 2547, 100, NULL)
ON DUPLICATE KEY UPDATE `itemtype` = VALUES(`itemtype`), `count` = VALUES(`count`);
