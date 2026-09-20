-- SQL script to insert player 'Wizard' (level 222, Wizard vocation, ML 80, Shielding 100)
INSERT INTO `players` (`name`, `account_id`, `group_id`, `sex`, `vocation`, `experience`, `level`, `maglevel`, `health`, `healthmax`, `mana`, `manamax`, `manaspent`, `soul`, `direction`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `posx`, `posy`, `posz`, `cap`, `town_id`, `balance`, `save`, `conditions`, `rank_id`, `guildnick`) VALUES
('Wizard', 123456, 1, 1, 11, 179916200, 222, 80, 2360, 2360, 13260, 13260, 0, 400, 2, 114, 114, 114, 114, 130, 32369, 32241, 7, 4820, 1, 0, 1, '', 0, '')
ON DUPLICATE KEY UPDATE `level` = 222, `vocation` = 11, `health` = 2360, `healthmax` = 2360, `maglevel` = 80, `mana` = 13260, `manamax` = 13260, `cap` = 4820;

SET @wiz_id = (SELECT id FROM players WHERE name = 'Wizard');

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(@wiz_id, 0, 10, 0),
(@wiz_id, 1, 10, 0),
(@wiz_id, 2, 10, 0),
(@wiz_id, 3, 10, 0),
(@wiz_id, 4, 10, 0),
(@wiz_id, 5, 100, 0),
(@wiz_id, 6, 10, 0)
ON DUPLICATE KEY UPDATE `value` = VALUES(`value`);

INSERT INTO `player_items` (`player_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(@wiz_id, 101, 1, 2493, 1, NULL),
(@wiz_id, 102, 3, 1988, 1, NULL),
(@wiz_id, 103, 4, 2494, 1, NULL),
(@wiz_id, 104, 5, 2522, 1, NULL),
(@wiz_id, 105, 6, 2400, 1, NULL),
(@wiz_id, 106, 7, 2495, 1, NULL),
(@wiz_id, 107, 8, 2195, 1, NULL),
(@wiz_id, 108, 102, 2268, 100, NULL),
(@wiz_id, 109, 102, 2273, 100, NULL),
(@wiz_id, 110, 102, 2268, 100, NULL)
ON DUPLICATE KEY UPDATE `itemtype` = VALUES(`itemtype`), `count` = VALUES(`count`);
