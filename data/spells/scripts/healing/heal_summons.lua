function onCastSpell(creature, var)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local summons = player:getSummons()
	if not summons or #summons == 0 then
		player:sendCancelMessage("You do not have any summons alive to heal.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local level = player:getLevel()
	local maglevel = player:getMagicLevel()
	local base = 160
	local variation = 40
	local min = math.max((base - variation), ((3 * maglevel + 2 * level) * (base - variation) / 100))
	local max = math.max((base + variation), ((3 * maglevel + 2 * level) * (base + variation) / 100))

	for _, summon in ipairs(summons) do
		local heal = math.random(min, max)
		summon:addHealth(heal)
		summon:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end

	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end
