-- Tibia 7.4 — Lib: Core Utility Functions
-- Provides common utilities used across all script systems

-- Table utilities
table.hasvalue = function(t, value)
    for _, v in pairs(t) do
        if v == value then return true end
    end
    return false
end

table.random = function(t)
    if #t == 0 then return nil end
    return t[math.random(#t)]
end

table.merge = function(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

-- String utilities
string.split = function(str, delimiter)
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

string.trim = function(str)
    return str:match("^%s*(.-)%s*$")
end

string.starts = function(str, prefix)
    return str:sub(1, #prefix) == prefix
end

string.ends = function(str, suffix)
    return str:sub(-#suffix) == suffix
end

-- Math utilities
math.round = function(n, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(n * mult + 0.5) / mult
end

math.clamp = function(n, min, max)
    return math.max(min, math.min(max, n))
end

math.lerp = function(a, b, t)
    return a + (b - a) * t
end

-- Player utilities
Player.getIp = function(self)
    local ip = self:getIP()
    return ip and ip or 0
end

Player.isVip = function(self)
    return self:getAccountType() >= ACCOUNT_TYPE_VIP
end

Player.isPremium = function(self)
    return self:isPremium()
end

Player.getFreeCapacity = function(self)
    return self:getFreeCapacity()
end

-- Item utilities
Item.isContainer = function(self)
    return self:getType():isContainer()
end

Item.isMovable = function(self)
    return self:getType():isMovable()
end

Item.getWeight = function(self)
    return self:getWeight()
end

-- Position utilities
Position.distanceTo = function(self, other)
    local dx = math.abs(self.x - other.x)
    local dy = math.abs(self.y - other.y)
    local dz = math.abs(self.z - other.z) * 4 -- Z difference is weighted 4x
    return dx + dy + dz
end

Position.isInRange = function(self, other, range)
    return self:distanceTo(other) <= range
end

Position.sendMagicEffect = function(self, effect)
    return self:sendMagicEffect(effect)
end

Position.sendAnimatedText = function(self, text, color)
    return self:sendAnimatedText(text, color)
end

-- 7.4 Authentic Configuration
configManager = {}

configManager.getNumber = function(key)
    return Game.getConfig(key)
end

configManager.getString = function(key)
    return Game.getConfig(key)
end

configManager.getBoolean = function(key)
    return Game.getConfig(key) == true
end

-- Logging
Logger = {
    debug = function(msg) print("[DEBUG] " .. msg) end,
    info = function(msg) print("[INFO] " .. msg) end,
    warn = function(msg) print("[WARN] " .. msg) end,
    error = function(msg) print("[ERROR] " .. msg) end
}

-- Backward compatibility
dofile = function(file)
    return require(file:gsub("%.lua$", ""):gsub("/", "."))
end

-- 7.4 Reference Data Modules
-- These provide authentic 7.4 data for validation and fallback
local ok, config74 = pcall(require, "lib/core/config_74")
if ok then Config74 = config74 else Config74 = {} end

local ok, items74 = pcall(require, "lib/core/items_74")
if ok then Items74 = items74 else Items74 = {} end

local ok, monsters74 = pcall(require, "lib/core/monsters_74")
if ok then Monsters74 = monsters74 else Monsters74 = {} end

local ok, spells74 = pcall(require, "lib/core/spells_74")
if ok then Spells74 = spells74 else Spells74 = {} end

local ok, npcs74 = pcall(require, "lib/core/npcs_74")
if ok then NPCs74 = npcs74 else NPCs74 = {} end

local ok, quests74 = pcall(require, "lib/core/quests_74")
if ok then Quests74 = quests74 else Quests74 = {} end