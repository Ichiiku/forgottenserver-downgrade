-- Annihilator with Solo Player Support (1 to 4 players)
local questLevel = 100

local room = {
	fromX = 33219,
	fromY = 31657,
	fromZ = 13,
	toX = 33222,
	toY = 31661,
	toZ = 13
}

local monster_pos = {
	[1] = {pos = {33219, 31657, 13}, monster = "Demon"},
	[2] = {pos = {33221, 31657, 13}, monster = "Demon"},
	[3] = {pos = {33220, 31661, 13}, monster = "Demon"},
	[4] = {pos = {33222, 31661, 13}, monster = "Demon"},
	[5] = {pos = {33223, 31659, 13}, monster = "Demon"},
	[6] = {pos = {33224, 31659, 13}, monster = "Demon"}
}

local players_pos = {
	{x = 33222, y = 31671, z = 13},
	{x = 33223, y = 31671, z = 13},
	{x = 33224, y = 31671, z = 13},
	{x = 33225, y = 31671, z = 13}
}

local new_player_pos = {
	{x = 33219, y = 31659, z = 13},
	{x = 33220, y = 31659, z = 13},
	{x = 33221, y = 31659, z = 13},
	{x = 33222, y = 31659, z = 13}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		local ready_players = {}
		local monsters = 0

		for i = 1, #players_pos do
			local creature = getTopCreature(players_pos[i])
			if creature and creature.itemid > 0 then
				if isPlayer(creature.uid) then
					table.insert(ready_players, {uid = creature.uid, fromPos = players_pos[i], originalIdx = i})
				else
					monsters = monsters + 1
				end
			end
		end

		if #ready_players == 0 then
			doPlayerSendCancel(cid, "You need at least 1 player on the quest tiles to enter.")
			return true
		end

		if monsters > 0 then
			doPlayerSendTextMessage(cid, 19, "Only players can do this quest.")
			return true
		end

		-- Check level of all players
		for _, p in ipairs(ready_players) do
			if getPlayerLevel(p.uid) < questLevel then
				doPlayerSendTextMessage(cid, 19, "All players must be at least level " .. questLevel .. " to do this quest.")
				return true
			end
		end

		-- Check if room already has players
		for x = room.fromX, room.toX do
			for y = room.fromY, room.toY do
				for z = room.fromZ, room.toZ do
					local thing = getThingfromPos({x = x, y = y, z = z, stackpos = 253})
					if thing.itemid > 0 and isPlayer(thing.uid) then
						doPlayerSendTextMessage(cid, 19, "There is already a team in the quest room.")
						return true
					end
				end
			end
		end

		-- Clean any leftover monsters in room
		for x = room.fromX, room.toX do
			for y = room.fromY, room.toY do
				for z = room.fromZ, room.toZ do
					local thing = getThingfromPos({x = x, y = y, z = z, stackpos = 253})
					if thing.itemid > 0 and not isPlayer(thing.uid) then
						doRemoveCreature(thing.uid)
					end
				end
			end
		end

		-- Spawn Demons
		for _, area in ipairs(monster_pos) do
			doSummonCreature(area.monster, {x = area.pos[1], y = area.pos[2], z = area.pos[3]})
		end

		-- Teleport players to quest arena
		for idx, p in ipairs(ready_players) do
			doSendMagicEffect(p.fromPos, CONST_ME_POFF)
			local dest = new_player_pos[idx]
			doTeleportThing(p.uid, dest)
			doSendMagicEffect(dest, CONST_ME_ENERGYAREA)
		end

		doTransformItem(item.uid, 1945)

	elseif item.itemid == 1945 then
		local player_room = 0
		for x = room.fromX, room.toX do
			for y = room.fromY, room.toY do
				for z = room.fromZ, room.toZ do
					local thing = getThingfromPos({x = x, y = y, z = z, stackpos = 253})
					if thing.itemid > 0 and isPlayer(thing.uid) then
						player_room = player_room + 1
					end
				end
			end
		end

		if player_room > 0 then
			doPlayerSendTextMessage(cid, 19, "There is already a team in the quest room.")
		else
			-- Clear room monsters and reset lever
			for x = room.fromX, room.toX do
				for y = room.fromY, room.toY do
					for z = room.fromZ, room.toZ do
						local thing = getThingfromPos({x = x, y = y, z = z, stackpos = 253})
						if thing.itemid > 0 and not isPlayer(thing.uid) then
							doRemoveCreature(thing.uid)
						end
					end
				end
			end
			doTransformItem(item.uid, 1946)
		end
	end

	return true
end
