-- Wizard Custom Pentacle Spell: Outward Expanding Star Shockwaves
-- Wave 1: Immediate inner energy shockwave around caster (Radius 1)
-- Wave 2: Expanding intermediate star shockwave & diagonals (Radius 2)
-- Wave 3: Full outer 5-pointed pentacle star tips & perimeter (Radius 3-4)

-- Wave 1: Immediate core surrounding caster (Radius 1)
local AREA_WAVE1 = {
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
}

-- Wave 2: Expanding intermediate star ring & crossing diagonals (Radius 2, 5x5)
local AREA_WAVE2 = {
	{0, 1, 1, 1, 0},
	{1, 1, 0, 1, 1},
	{1, 0, 3, 0, 1},
	{1, 1, 0, 1, 1},
	{0, 1, 1, 1, 0}
}

-- Wave 3: Full 5-pointed star outer tips & encircled perimeter (Radius 3-4, 9x9)
local AREA_WAVE3 = {
	{0, 0, 0, 0, 1, 0, 0, 0, 0}, -- Top tip
	{0, 0, 1, 1, 1, 1, 1, 0, 0}, -- Upper diagonals
	{0, 1, 1, 0, 0, 0, 1, 1, 0}, -- Star diagonals
	{1, 1, 0, 0, 0, 0, 0, 1, 1}, -- Outer left/right arm tips
	{1, 0, 0, 0, 3, 0, 0, 0, 1}, -- Lateral circle
	{1, 1, 0, 0, 0, 0, 0, 1, 1}, -- Under-arm corners
	{0, 1, 1, 0, 0, 0, 1, 1, 0}, -- Outer hip transition
	{0, 0, 1, 1, 0, 1, 1, 0, 0}, -- Legs
	{0, 0, 1, 1, 0, 1, 1, 0, 0}  -- Bottom left & right feet
}

local area1 = createCombatArea(AREA_WAVE1)
local area2 = createCombatArea(AREA_WAVE2)
local area3 = createCombatArea(AREA_WAVE3)

-- Wave 1: Energy Hit + Exori Physical burst
local combatWave1_Energy = createCombatObject()
setCombatParam(combatWave1_Energy, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatWave1_Energy, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
setCombatArea(combatWave1_Energy, area1)

local combatWave1_Phys = createCombatObject()
setCombatParam(combatWave1_Phys, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatWave1_Phys, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
setCombatArea(combatWave1_Phys, area1)

-- Wave 2: Energy Field + Mort area expanding
local combatWave2_Energy = createCombatObject()
setCombatParam(combatWave2_Energy, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatWave2_Energy, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatArea(combatWave2_Energy, area2)

local combatWave2_Mort = createCombatObject()
setCombatParam(combatWave2_Mort, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatWave2_Mort, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatArea(combatWave2_Mort, area2)

-- Wave 3: Exevo Gran Vis Lux explosion + Sudden Death blast on outer star
local combatWave3_Beam = createCombatObject()
setCombatParam(combatWave3_Beam, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combatWave3_Beam, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
setCombatArea(combatWave3_Beam, area3)

local combatWave3_SD = createCombatObject()
setCombatParam(combatWave3_SD, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatWave3_SD, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatArea(combatWave3_SD, area3)

-- Damage formula calculation
local function getPentacleDamage(level, maglevel)
	local min = ((level * 1.5) + (maglevel * 2.5)) * 0.75
	local max = ((level * 1.5) + (maglevel * 2.5)) * 1.20
	return -min, -max
end

-- Distinct global functions so OTHire getEvent registers each one without collision
function onGetFormulaPentacleW1_Energy(cid, level, maglevel) return getPentacleDamage(level, maglevel) end
function onGetFormulaPentacleW1_Phys(cid, level, maglevel) return getPentacleDamage(level, maglevel) end
function onGetFormulaPentacleW2_Energy(cid, level, maglevel) return getPentacleDamage(level, maglevel) end
function onGetFormulaPentacleW2_Mort(cid, level, maglevel) return getPentacleDamage(level, maglevel) end
function onGetFormulaPentacleW3_Beam(cid, level, maglevel) return getPentacleDamage(level, maglevel) end
function onGetFormulaPentacleW3_SD(cid, level, maglevel) return getPentacleDamage(level, maglevel) end

setCombatCallback(combatWave1_Energy, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaPentacleW1_Energy")
setCombatCallback(combatWave1_Phys, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaPentacleW1_Phys")
setCombatCallback(combatWave2_Energy, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaPentacleW2_Energy")
setCombatCallback(combatWave2_Mort, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaPentacleW2_Mort")
setCombatCallback(combatWave3_Beam, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaPentacleW3_Beam")
setCombatCallback(combatWave3_SD, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaPentacleW3_SD")

local function executeWave2(cid, var)
	if isCreature(cid) then
		doCombat(cid, combatWave2_Energy, var)
		doCombat(cid, combatWave2_Mort, var)
	end
end

local function executeWave3(cid, var)
	if isCreature(cid) then
		doCombat(cid, combatWave3_Beam, var)
		doCombat(cid, combatWave3_SD, var)
	end
end

function onCastSpell(cid, var)
	-- Wave 1: Immediate inner shockwave (Radius 1)
	doCombat(cid, combatWave1_Energy, var)
	doCombat(cid, combatWave1_Phys, var)
	
	-- Wave 2: Expanding intermediate star ring (Radius 2, 150ms)
	addEvent(executeWave2, 150, cid, var)
	
	-- Wave 3: Full outer 5-pointed star tips & perimeter (Radius 3-4, 300ms)
	addEvent(executeWave3, 300, cid, var)
	return true
end
