-- Vis Strike: Energy projectile that chains to up to 7 additional targets
local MAX_CHAIN_HOPS = 7
local CHAIN_RADIUS = 5
local HOP_DELAY_MS = 140

local function chainHop(casterId, currentPos, hitTargets, remainingHops, damageRatio)
	if remainingHops <= 0 then
		return
	end

	local spectators = getSpectators(currentPos, CHAIN_RADIUS, CHAIN_RADIUS, false)
	if not spectators or #spectators == 0 then
		return
	end

	local bestCandidate = nil
	local bestDist = 999

	for _, spec in ipairs(spectators) do
		if isCreature(spec) and spec ~= casterId and not hitTargets[spec] then
			local isFriendly = false
			if isPlayer(casterId) then
				local master = getCreatureMaster(spec)
				if master == casterId then
					isFriendly = true
				end
			end

			if not isFriendly then
				local sPos = getCreaturePosition(spec)
				local dist = math.max(math.abs(sPos.x - currentPos.x), math.abs(sPos.y - currentPos.y))
				if dist < bestDist then
					bestDist = dist
					bestCandidate = spec
				end
			end
		end
	end

	if not bestCandidate then
		return
	end

	hitTargets[bestCandidate] = true
	local targetPos = getCreaturePosition(bestCandidate)

	-- Visual: Lightning bolt distance shot from previous position to new target
	doSendDistanceShoot(currentPos, targetPos, CONST_ANI_ENERGY)

	-- Visual: Impact effects (energy hit + ground electric area)
	doSendMagicEffect(targetPos, CONST_ME_ENERGYHIT)
	doSendMagicEffect(targetPos, CONST_ME_ENERGYAREA)

	-- Energy damage calculation
	local level = isPlayer(casterId) and getPlayerLevel(casterId) or 50
	local maglevel = isPlayer(casterId) and getPlayerMagLevel(casterId) or 50
	local baseMin = ((level * 1.5) + (maglevel * 3.0)) * 0.85
	local baseMax = ((level * 1.5) + (maglevel * 3.0)) * 1.25
	local rawDmg = math.random(math.floor(baseMin), math.floor(baseMax)) * damageRatio
	local dmg = -math.max(1, math.floor(rawDmg))

	doTargetCombatHealth(casterId, bestCandidate, COMBAT_ENERGYDAMAGE, dmg, dmg, CONST_ME_ENERGYHIT)

	-- Continue chain
	addEvent(chainHop, HOP_DELAY_MS, casterId, targetPos, hitTargets, remainingHops - 1, damageRatio * 0.94)
end

function onCastSpell(cid, var)
	local target = variantToNumber(var)
	if not target or target == 0 or not isCreature(target) then
		target = getCreatureTarget(cid)
	end

	if not target or not isCreature(target) then
		doPlayerSendCancel(cid, "You need a target.")
		return false
	end

	local casterPos = getCreaturePosition(cid)
	local targetPos = getCreaturePosition(target)

	-- Primary strike
	doSendDistanceShoot(casterPos, targetPos, CONST_ANI_ENERGY)
	doSendMagicEffect(targetPos, CONST_ME_ENERGYHIT)
	doSendMagicEffect(targetPos, CONST_ME_EXPLOSIONHIT)

	local level = getPlayerLevel(cid)
	local maglevel = getPlayerMagLevel(cid)
	local baseMin = ((level * 1.5) + (maglevel * 3.0)) * 0.85
	local baseMax = ((level * 1.5) + (maglevel * 3.0)) * 1.25
	local dmg = -math.random(math.floor(baseMin), math.floor(baseMax))

	doTargetCombatHealth(cid, target, COMBAT_ENERGYDAMAGE, dmg, dmg, CONST_ME_ENERGYHIT)

	-- Initialize chain
	local hitTargets = {[cid] = true, [target] = true}
	addEvent(chainHop, HOP_DELAY_MS, cid, targetPos, hitTargets, MAX_CHAIN_HOPS, 0.95)

	return true
end
