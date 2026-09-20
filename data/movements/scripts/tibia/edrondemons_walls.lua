-- Demon Helmet Quest Wall Opening - Solo Player Supported
local wallPositions = {
	{x = 33210, y = 31630, z = 13},
	{x = 33211, y = 31630, z = 13},
	{x = 33212, y = 31630, z = 13}
}

local demonWallsTimer = nil

local function resetDemonWalls()
	for i = 1, #wallPositions do
		local wallItem = getTileItemById(wallPositions[i], 1050)
		if not wallItem or wallItem.uid == 0 then
			local nextTile = {x = wallPositions[i].x, y = wallPositions[i].y + 1, z = wallPositions[i].z}
			doRelocate(wallPositions[i], nextTile)
			doCreateItem(1050, 1, wallPositions[i])
		end
	end
	demonWallsTimer = nil
end

function onStepIn(cid, item, position)
	if not isPlayer(cid) then
		return true
	end

	-- Depress pressure plate
	doTransformItem(item.uid, item.itemid - 1)

	local removed = false
	for i = 1, #wallPositions do
		local wallItem = getTileItemById(wallPositions[i], 1050)
		if wallItem and wallItem.itemid == 1050 then
			doRemoveItem(wallItem.uid, 1)
			removed = true
		end
	end

	if removed then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "A heavy stone mechanism rumbles. The walls have opened!")
		doSendMagicEffect(position, CONST_ME_MAGIC_BLUE)
	end

	-- Keep walls open for 120 seconds (2 minutes) to give solo players ample time to walk through
	if demonWallsTimer then
		stopEvent(demonWallsTimer)
	end
	demonWallsTimer = addEvent(resetDemonWalls, 120000)

	return true
end

function onStepOut(cid, item, position)
	if not isPlayer(cid) then
		return true
	end
	doTransformItem(item.uid, item.itemid + 1)
	return true
end
