function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not isPremium(cid) then
		doPlayerSendCancel(cid, "Only players with premium status can convert coins.")
		return true
	end

	-- 100 Gold Coins -> 1 Platinum Coin
	if item.itemid == 2148 then
		if item.type == 100 then
			doTransformItem(item.uid, 2152, 1)
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_GREEN)
		else
			doPlayerSendCancel(cid, "You need 100 gold coins to convert to a platinum coin.")
		end
		return true
	end

	-- 100 Platinum Coins -> 1 Crystal Coin
	if item.itemid == 2152 then
		if item.type == 100 then
			doTransformItem(item.uid, 2160, 1)
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_GREEN)
		else
			doPlayerSendCancel(cid, "You need 100 platinum coins to convert to a crystal coin.")
		end
		return true
	end

	return false
end
