-- 5-Pointed Star Pentacle Area (Hollow Center for Crisp Star Geometry)
local AREA_PENTACLE = {
	{0, 0, 0, 0, 1, 0, 0, 0, 0}, -- Top tip
	{0, 0, 0, 1, 0, 1, 0, 0, 0}, -- Top descending diagonals
	{0, 0, 1, 0, 0, 0, 1, 0, 0}, -- Outer star diagonals
	{1, 1, 0, 0, 0, 0, 0, 1, 1}, -- Left and right horizontal arm tips
	{0, 0, 1, 0, 3, 0, 1, 0, 0}, -- Under-arm corners (caster in center 3, surrounded by open 0s)
	{0, 0, 0, 1, 0, 1, 0, 0, 0}, -- Inner crossing diagonals
	{0, 1, 1, 0, 0, 0, 1, 1, 0}, -- Outer hip transition
	{1, 0, 0, 1, 0, 1, 0, 0, 1}, -- Legs
	{1, 1, 0, 0, 0, 0, 0, 1, 1}  -- Bottom left & right feet
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

-- 4. Sudden Death Rune visual effect & Death / Mort Damage
local combatSD = createCombatObject()
setCombatParam(combatSD, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatSD, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatArea(combatSD, area)

function onGetFormulaBeam(cid, level, maglevel)
	local min = ((level * 1.5) + (maglevel * 2.5)) * 0.75
	local max = ((level * 1.5) + (maglevel * 2.5)) * 1.15
	return -min, -max
end

function onGetFormulaField(cid, level, maglevel)
	local min = ((level * 1.5) + (maglevel * 2.5)) * 0.75
	local max = ((level * 1.5) + (maglevel * 2.5)) * 1.15
	return -min, -max
end

function onGetFormulaExori(cid, level, maglevel)
	local min = ((level * 1.2) + (maglevel * 2.0)) * 0.70
	local max = ((level * 1.2) + (maglevel * 2.0)) * 1.10
	return -min, -max
end

function onGetFormulaSD(cid, level, maglevel)
	local min = ((level * 1.8) + (maglevel * 3.0)) * 0.85
	local max = ((level * 1.8) + (maglevel * 3.0)) * 1.25
	return -min, -max
end

setCombatCallback(combatBeam, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaBeam")
setCombatCallback(combatField, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaField")
setCombatCallback(combatExori, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaExori")
setCombatCallback(combatSD, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaSD")

function onCastSpell(cid, var)
	doCombat(cid, combatBeam, var)
	doCombat(cid, combatField, var)
	doCombat(cid, combatExori, var)
	return doCombat(cid, combatSD, var)
end
