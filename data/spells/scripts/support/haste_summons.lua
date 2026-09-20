local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 33000)
condition:setFormula(0.3, -24, 0.3, -24)

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
		summon:addCondition(condition)
		summon:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end

	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end
