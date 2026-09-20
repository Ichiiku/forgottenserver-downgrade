-- 5-Pointed Star Pentagram Area (9x9 grid with center at 3)
local AREA_PENTACLE = {
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 0, 0, 0},
	{1, 1, 1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 3, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 0, 1, 0, 1, 1, 0},
	{1, 1, 0, 0, 0, 0, 0, 1, 1},
	{1, 0, 0, 0, 0, 0, 0, 0, 1}
}

local area = createCombatArea(AREA_PENTACLE)

-- 1. Exevo Gran Vis Lux visual effect & Energy Damage
local combatBeam = createCombatObject()
setCombatParam(combatBeam, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatBeam, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatArea(combatBeam, area)

-- 2. Energy Field visual effect & Energy Damage
local combatField = createCombatObject()
setCombatParam(combatField, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatField, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatArea(combatField, area)

-- 3. Exori visual effect & Physical Damage
local combatExori = createCombatObject()
setCombatParam(combatExori, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatExori, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatArea(combatExori, area)

-- 4. Sudden Death Rune visual effect & Death Damage
local combatSD = createCombatObject()
setCombatParam(combatSD, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combatSD, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatArea(combatSD, area)

function onGetFormulaBeam(player, level, maglevel)
	local min = ((level * 1.5) + (maglevel * 2.5)) * 0.75
	local max = ((level * 1.5) + (maglevel * 2.5)) * 1.15
	return -min, -max
end

function onGetFormulaField(player, level, maglevel)
	local min = ((level * 1.5) + (maglevel * 2.5)) * 0.75
	local max = ((level * 1.5) + (maglevel * 2.5)) * 1.15
	return -min, -max
end

function onGetFormulaExori(player, level, maglevel)
	local min = ((level * 1.2) + (maglevel * 2.0)) * 0.70
	local max = ((level * 1.2) + (maglevel * 2.0)) * 1.10
	return -min, -max
end

function onGetFormulaSD(player, level, maglevel)
	local min = ((level * 1.8) + (maglevel * 3.0)) * 0.85
	local max = ((level * 1.8) + (maglevel * 3.0)) * 1.25
	return -min, -max
end

setCombatCallback(combatBeam, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaBeam")
setCombatCallback(combatField, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaField")
setCombatCallback(combatExori, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaExori")
setCombatCallback(combatSD, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaSD")

function onCastSpell(creature, var)
	doCombat(creature, combatBeam, var)
	doCombat(creature, combatField, var)
	doCombat(creature, combatExori, var)
	return doCombat(creature, combatSD, var)
end
