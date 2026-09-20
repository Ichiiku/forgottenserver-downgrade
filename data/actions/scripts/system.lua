-- Unified Quest Chest System for Real Map 7.4 / 7.72

local specialQuests = {
	-- Annihilator Quest Chests (Storage 20001 shared across all 4 chests)
	[20001] = {storage = 20001, itemid = 2494}, -- Demon Armor
	[20002] = {storage = 20001, itemid = 2400}, -- Magic Sword
	[20003] = {storage = 20001, itemid = 2431}, -- Stonecutter Axe
	[20004] = {storage = 20001, itemid = 1990, container = {2326}}, -- Present Box with Teddy Bear
	-- In case map uses item ID as UID for Annihilator chests:
	[1990]  = {storage = 20001, itemid = 1990, container = {2326}},
	[2400]  = {storage = 20001, itemid = 2400},
	[2431]  = {storage = 20001, itemid = 2431},
	[2494]  = {storage = 20001, itemid = 2494},

	-- Postman Quest
	[20069] = {storage = 243, itemid = 2091, actionid = 3980},

	-- Custom / Unique quests from system2.lua
	[10007] = {storage = 10007, itemid = 2485}, -- doublet
	[10009] = {storage = 10009, itemid = 2103}, -- honeyflower
	[10018] = {storage = 10018, itemid = 1955, text = "Hardek *\nBozo *\nSam ****\nOswald\nPartos ***\nQuentin *\nTark ***\nHarsky ***\nStutch *\nFerumbras *\nFrodo **\nNoodles ****"},
	[10019] = {storage = 10019, itemid = 2676}, -- banana
	[10020] = {storage = 10020, itemid = 2676}, -- banana
	[10024] = {storage = 10024, itemid = 2559}, -- small axe
	[20040] = {storage = 20040, itemid = 2091, actionid = 3980}, -- golden key, deeper fibula
	[20085] = {storage = 20085, itemid = 2463}, -- plate armor
	[20086] = {storage = 20086, items = {
		{itemid = 2091, actionid = 6010}, -- golden key, demon quest
		{itemid = 1948},                  -- parchment
		{itemid = 2229},                  -- skull
		{itemid = 2230},                  -- bone
		{itemid = 2151, count = 2},       -- talon
		{itemid = 2165}                   -- stealth ring
	}},
	[20087] = {storage = 20087, itemid = 2487}, -- crown armor
	[20088] = {storage = 20088, itemid = 2519}, -- crown shield
	[20089] = {storage = 20089, itemid = 2798}, -- blood herb
	[20091] = {storage = 20091, itemid = 2432}, -- fire axe
	[20092] = {storage = 20092, itemid = 2089, actionid = 3899}, -- copper key, paradox tower
	[20093] = {storage = 20093, itemid = 2088, actionid = 5010}, -- silver key, bk quest
	[20104] = {storage = 20104, itemid = 2089, actionid = 3301}, -- copper key, bright sword quest
	[20105] = {storage = 20105, itemid = 2088, actionid = 3302}, -- silver key, bright sword quest
	[20106] = {storage = 20106, itemid = 2089, actionid = 3303}  -- copper key, bright sword quest
}

local questsExperience = {
	-- [10017] = 10
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	-- If it's a normal container opened in game (no actionid and no valid quest uid), allow default open
	if (item.actionid == 0 or item.actionid == nil) and (item.uid <= 100 or item.uid > 65535) then
		return false
	end

	local cfg = specialQuests[item.uid]
	local storage = cfg and cfg.storage or item.uid
	if not cfg and (storage <= 100 or storage > 65535) then
		if item.actionid == 2000 or item.actionid == 2001 then
			storage = 100000 + item.actionid + fromPosition.x * 100 + fromPosition.y
		else
			return false
		end
	end

	-- Check if already completed
	if getPlayerStorageValue(cid, storage) > 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		return true
	end

	local reward = nil
	local reward_desc = ""

	-- Check if the container in the map actually has items placed inside it
	local items = {}
	local size = isContainer(item.uid) and getContainerSize(item.uid) or 0
	if size > 0 then
		for i = 0, size - 1 do
			local tmp = getContainerItem(item.uid, i)
			if tmp and tmp.itemid > 0 then
				table.insert(items, tmp)
			end
		end
	end

	if #items == 1 then
		reward = doCopyItem(items[1], true)
	elseif #items > 1 then
		if #items > 20 then
			reward = doCopyItem(item, false)
		elseif #items > 8 then
			reward = getThing(doCreateItemEx(1988, 1)) -- backpack
		else
			reward = getThing(doCreateItemEx(1987, 1)) -- bag
		end
		for i = 1, #items do
			local tmp = doCopyItem(items[i], true)
			doAddContainerItemEx(reward.uid, tmp.uid)
		end
	elseif cfg then
		-- Predefined quest config
		if cfg.items then
			local pack = getThing(doCreateItemEx(1987, 1)) -- bag
			for _, it in ipairs(cfg.items) do
				local created = doCreateItemEx(it.itemid, it.count or 1)
				if it.actionid then doSetItemActionId(created, it.actionid) end
				if it.text then doSetItemText(created, it.text) end
				doAddContainerItemEx(pack.uid, created)
		end
			reward = pack
		elseif cfg.itemid then
			local created = doCreateItemEx(cfg.itemid, cfg.count or 1)
			if cfg.actionid then doSetItemActionId(created, cfg.actionid) end
			if cfg.text then doSetItemText(created, cfg.text) end
			if cfg.container then
				for _, sub in ipairs(cfg.container) do
					local subItem = doCreateItemEx(sub, 1)
					doAddContainerItemEx(created, subItem)
				end
			end
			reward = getThing(created)
		end
	else
		-- UID-based rewards on Real Map
		local rewardId = 0
		local count = 1
		if item.uid >= 50000 and item.uid <= 60000 then
			rewardId = item.uid - 50000
			if rewardId == 2148 then -- Gold coins
				count = 100
			elseif rewardId == 2149 or rewardId == 2152 then -- Small emerald or Platinum coin
				count = 5
			end
		elseif item.uid >= 100 and item.uid <= 25000 then
			rewardId = item.uid
		end

		if rewardId > 0 then
			local created = doCreateItemEx(rewardId, count)
			if created and created > 0 then
				reward = getThing(created)
				if rewardId == 1990 then -- Annihilator present box includes teddy bear
					local teddy = doCreateItemEx(2326, 1)
					if teddy and teddy > 0 then
						doAddContainerItemEx(reward.uid, teddy)
					end
				end
			end
		end
	end

	if not reward or reward == 0 or reward.uid == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty.")
		return true
	end

	-- Format description
	local ret = getItemDescriptions(reward.itemid)
	if reward.type > 0 and isItemRune(reward.itemid) then
		reward_desc = reward.type .. " charges " .. (ret.name or "rune")
	elseif reward.type > 1 and isItemStackable(reward.itemid) then
		reward_desc = reward.type .. " " .. (ret.plural or "items")
	else
		reward_desc = (ret.article or "a") .. " " .. (ret.name or "item")
	end

	-- Check capacity
	if getPlayerFreeCap(cid) < getItemWeight(reward.uid) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. reward_desc .. " weighing " .. string.format("%.2f", getItemWeight(reward.uid)) .. " oz. It is too heavy.")
		return true
	end

	-- Add item to player
	if doPlayerAddItemEx(cid, reward.uid, false) ~= RETURNVALUE_NOERROR then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have enough room.")
		return true
	end

	-- Mark completed
	setPlayerStorageValue(cid, storage, 1)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. reward_desc .. ".")

	if questsExperience[storage] ~= nil then
		doPlayerAddExp(cid, questsExperience[storage])
		doSendAnimatedText(getCreaturePosition(cid), questsExperience[storage], TEXTCOLOR_WHITE)
	end

	return true
end
