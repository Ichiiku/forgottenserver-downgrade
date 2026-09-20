function onCastSpell(creature, var)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local summons = player:getSummons()
	if not summons or #summons == 0 then
		player:sendCancelMessage("You do not have any summons alive.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	for _, summon in ipairs(summons) do
		local pos = summon:getPosition()
		pos:sendMagicEffect(CONST_ME_MORTAREA)
		pos:sendMagicEffect(CONST_ME_POFF)
		summon:remove()
	end

	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	return true
end
