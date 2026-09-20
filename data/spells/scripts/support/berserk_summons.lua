local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 60000)
setConditionFormula(condition, 0.7, -56, 0.7, -56)

function onCastSpell(cid, var)
	local summons = getCreatureSummons(cid)
	if not summons or #summons == 0 then
		doPlayerSendCancel(cid, "You do not have any summons alive.")
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		return false
	end

	for _, summon in ipairs(summons) do
		if isCreature(summon) then
			doAddCondition(summon, condition)
			doCreatureSetBerserk(summon, 60000)
			doSendMagicEffect(getCreaturePosition(summon), CONST_ME_MAGIC_RED)
		end
	end

	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
	return true
end
