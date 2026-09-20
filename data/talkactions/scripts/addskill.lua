local statMap = {
	["hp"] = 50100,
	["health"] = 50100,
	["hitpoints"] = 50100,
	["50100"] = 50100,

	["mana"] = 50101,
	["50101"] = 50101,

	["cap"] = 50102,
	["capacity"] = 50102,
	["50102"] = 50102,

	["speed"] = 50103,
	["50103"] = 50103,

	["hpregen"] = 50104,
	["healthregen"] = 50104,
	["50104"] = 50104,

	["manaregen"] = 50105,
	["50105"] = 50105
}

function onSay(cid, words, param)
	if not param or param == "" then
		doPlayerSendSkillPointsInfo(cid)
		return false
	end

	local t = string.explode(param, " ")
	local stat = string.lower(t[1] or "")
	local count = tonumber(t[2] or 1) or 1

	local key = statMap[stat]
	if not key then
		doPlayerSendCancel(cid, "Invalid skill attribute.")
		return false
	end

	if count <= 0 then
		doPlayerSendCancel(cid, "Points to allocate must be greater than 0.")
		return false
	end

	local success = doPlayerAddSkillPoints(cid, key, count)
	if not success then
		doPlayerSendCancel(cid, "You do not have enough skill points available.")
		return false
	end

	return false
end
