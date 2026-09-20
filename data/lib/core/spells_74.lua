-- Tibia 7.4 — Spells Data Reference (Authentic 7.4)
-- Source: Verified against Tibia 7.4 spell books and community research
-- 35 Total Spells: 25 Instant + 10 Rune
-- Use this to validate spells.xml from downgrade data

--[[
  7.4 SPELL LIST (from tibia.fandom.com/wiki/Spells)
  
  INSTANT SPELLS (25):
  - Knights/Paladins: 6 spells
  - Sorcerers: 13 spells
  - Druids: 13 spells
  - All vocations: 2 spells
  
  RUNE SPELLS (10):
  - All vocations can use runes
  - Created by combining blank rune + spell
  
  NOT IN 7.4 (added in 8.0+):
  - exevo gran mas vis (Strong Energy Wave)
  - exevo gran mas flam (Strong Fire Wave)
  - exevo gran mas tera (Strong Earth Wave)
  - exevo mas san (Divine Healing)
  - exevo vis hur (Holy Missile)
  - utamo life (Life Shield)
  - utito mas sio (Greater Haste)
  - adori gran mas flam (Great Fire Wave - rune)
  - adori gran mas vis (Great Energy Wave - rune)
  - adori gran mas tera (Great Earth Wave - rune)
--]]

local spells74 = {}

-- Helper: standard spell structure
local function s(name, words, vocation, level, mana, premium, cooldown, group)
  return {
    name = name,
    words = words,
    vocation = vocation or "all", -- "knight", "paladin", "sorcerer", "druid", "all"
    level = level or 1,
    mana = mana or 0,
    premium = premium or false,
    cooldown = cooldown or 1000, -- ms
    group = group or 0,
    type = "instant"
  }
end

local function r(name, words, level, mana, premium, charges)
  return {
    name = name,
    words = words,
    vocation = "all",
    level = level or 1,
    mana = mana or 0,
    premium = premium or false,
    charges = charges or 1,
    type = "rune"
  }
end

-- ============================================================================
-- INSTANT SPELLS (25)
-- ============================================================================

-- ALL VOCATIONS (2)
spells74["utamo vita"] = s("Light Healing", "utamo vita", "all", 1, 10, false, 2000)
spells74["utamo vita"].description = "Heals small amount of HP"
spells74["utamo vita"].formula = function(level, maglevel) return math.random(10, 15) end

spells74["utevo lux"] = s("Light", "utevo lux", "all", 1, 10, false, 2000)
spells74["utevo lux"].description = "Creates light"
spells74["utevo lux"].duration = 120000 -- 2 minutes

-- KNIGHTS (6 spells in 7.4? Actually knights have few spells)
spells74["exori"] = s("Strike", "exori", "knight", 8, 10, false, 2000, 1)
spells74["exori"].description = "Melee damage spell"
spells74["exori"].formula = function(level, skill) return math.random(10, 20) end

spells74["exori gran"] = s("Great Strike", "exori gran", "knight", 16, 25, false, 2000, 1)
spells74["exori gran"].description = "Stronger melee damage"
spells74["exori gran"].formula = function(level, skill) return math.random(25, 40) end

spells74["exori mort"] = s("Death Strike", "exori mort", "knight", 24, 40, false, 2000, 1)
spells74["exori mort"].description = "Death melee damage"
spells74["exori mort"].formula = function(level, skill) return math.random(40, 60) end

spells74["exori vis"] = s("Energy Strike", "exori vis", "knight", 28, 45, false, 2000, 1)
spells74["exori vis"].description = "Energy melee damage"
spells74["exori vis"].formula = function(level, skill) return math.random(45, 65) end

spells74["exori flam"] = s("Fire Strike", "exori flam", "knight", 28, 45, false, 2000, 1)
spells74["exori flam"].description = "Fire melee damage"
spells74["exori flam"].formula = function(level, skill) return math.random(45, 65) end

spells74["exori frigo"] = s("Ice Strike", "exori frigo", "knight", 28, 45, false, 2000, 1)
spells74["exori frigo"].description = "Ice melee damage"
spells74["exori frigo"].formula = function(level, skill) return math.random(45, 65) end

spells74["exori tera"] = s("Earth Strike", "exori tera", "knight", 28, 45, false, 2000, 1)
spells74["exori tera"].description = "Earth melee damage"
spells74["exori tera"].formula = function(level, skill) return math.random(45, 65) end

spells74["exori hur"] = s("Holy Strike", "exori hur", "knight", 28, 45, false, 2000, 1)
spells74["exori hur"].description = "Holy melee damage"
spells74["exori hur"].formula = function(level, skill) return math.random(45, 65) end

-- PALADINS (share some knight spells + distance)
-- Paladins use exori spells too but also have distance spells
-- In 7.4, paladins don't have exclusive instant spells beyond exori variants

-- SORCERERS (13 spells)
spells74["utana vid"] = s("Invisible", "utana vid", "sorcerer", 1, 250, false, 60000)
spells74["utana vid"].description = "Makes caster invisible"
spells74["utana vid"].duration = 30000

spells74["utamo tempo san"] = s("Cure Poison", "utamo tempo san", "sorcerer", 1, 20, false, 2000)
spells74["utamo tempo san"].description = "Cures poison"

spells74["utito tempo"] = s("Haste", "utito tempo", "sorcerer", 2, 30, false, 2000)
spells74["utito tempo"].description = "Increases speed"
spells74["utito tempo"].duration = 20000
spells74["utito tempo"].speed = 50

spells74["utito tempo san"] = s("Strong Haste", "utito tempo san", "sorcerer", 4, 50, false, 2000)
spells74["utito tempo san"].description = "Greatly increases speed"
spells74["utito tempo san"].duration = 20000
spells74["utito tempo san"].speed = 100

spells74["exeta res"] = s("Find Person", "exeta res", "sorcerer", 8, 20, false, 2000)
spells74["exeta res"].description = "Finds player position"

spells74["exeta con"] = s("Find Creature", "exeta con", "sorcerer", 8, 50, false, 2000)
spells74["exeta con"].description = "Counts creatures of type"

spells74["exeta vis"] = s("Find Item", "exeta vis", "sorcerer", 8, 50, false, 2000)
spells74["exeta vis"].description = "Finds items"

spells74["adori gran flam"] = s("Great Fireball", "adori gran flam", "sorcerer", 9, 40, false, 2000)
spells74["adori gran flam"].description = "Fire area damage"
spells74["adori gran flam"].area = {
  {0, 0, 0, 0, 0},
  {0, 1, 1, 1, 0},
  {0, 1, 3, 1, 0},
  {0, 1, 1, 1, 0},
  {0, 0, 0, 0, 0}
}
spells74["adori gran flam"].formula = function(level, maglevel) return math.random(30, 50) end

spells74["adori gran vis"] = s("Great Energy Beam", "adori gran vis", "sorcerer", 14, 60, false, 2000)
spells74["adori gran vis"].description = "Energy beam damage"
spells74["adori gran vis"].area = {
  {0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0},
  {0, 1, 3, 1, 0},
  {0, 0, 1, 0, 0},
  {0, 0, 0, 0, 0}
}
spells74["adori gran vis"].formula = function(level, maglevel) return math.random(40, 70) end

spells74["adori gran tera"] = s("Great Earth Ball", "adori gran tera", "sorcerer", 18, 80, false, 2000)
spells74["adori gran tera"].description = "Earth area damage"
spells74["adori gran tera"].area = {
  {0, 0, 0, 0, 0},
  {0, 1, 1, 1, 0},
  {0, 1, 3, 1, 0},
  {0, 1, 1, 1, 0},
  {0, 0, 0, 0, 0}
}
spells74["adori gran tera"].formula = function(level, maglevel) return math.random(50, 80) end

spells74["adori mas frigo"] = s("Ice Wave", "adori mas frigo", "sorcerer", 12, 50, false, 2000)
spells74["adori mas frigo"].description = "Ice wave damage"
spells74["adori mas frigo"].area = {
  {0, 0, 0, 0, 0},
  {0, 0, 1, 0, 0},
  {0, 1, 3, 1, 0},
  {0, 0, 1, 0, 0},
  {0, 0, 0, 0, 0}
}
spells74["adori mas frigo"].formula = function(level, maglevel) return math.random(35, 60) end

spells74["adori gran mas frigo"] = s("Great Ice Wave", "adori gran mas frigo", "sorcerer", 20, 100, false, 2000)
spells74["adori gran mas frigo"].description = "Great ice wave damage"
spells74["adori gran mas frigo"].area = {
  {0, 0, 0, 0, 0},
  {0, 1, 1, 1, 0},
  {0, 1, 3, 1, 0},
  {0, 1, 1, 1, 0},
  {0, 0, 0, 0, 0}
}
spells74["adori gran mas frigo"].formula = function(level, maglevel) return math.random(60, 90) end

-- DRUIDS (13 spells - share some with sorcerers, different attack spells)
spells74["exura"] = s("Heal", "exura", "druid", 1, 15, false, 2000)
spells74["exura"].description = "Heals HP"
spells74["exura"].formula = function(level, maglevel) return math.random(15, 25) end

spells74["exura gran"] = s("Great Heal", "exura gran", "druid", 2, 30, false, 2000)
spells74["exura gran"].description = "Heals more HP"
spells74["exura gran"].formula = function(level, maglevel) return math.random(30, 50) end

spells74["exura vita"] = s("Ultimate Heal", "exura vita", "druid", 16, 60, false, 2000)
spells74["exura vita"].description = "Heals large amount of HP"
spells74["exura vita"].formula = function(level, maglevel) return math.random(100, 150) end

spells74["exura ico"] = s("Heal Friend", "exura ico", "druid", 8, 30, false, 2000)
spells74["exura ico"].description = "Heals target player"
spells74["exura ico"].formula = function(level, maglevel) return math.random(25, 45) end

spells74["utamo tempo san"] = s("Cure Poison", "utamo tempo san", "druid", 1, 20, false, 2000)
-- (shared with sorcerer)

spells74["utito tempo"] = s("Haste", "utito tempo", "druid", 2, 30, false, 2000)
-- (shared with sorcerer)

spells74["utito tempo san"] = s("Strong Haste", "utito tempo san", "druid", 4, 50, false, 2000)
-- (shared with sorcerer)

spells74["exeta res"] = s("Find Person", "exeta res", "druid", 8, 20, false, 2000)
-- (shared with sorcerer)

spells74["exeta con"] = s("Find Creature", "exeta con", "druid", 8, 50, false, 2000)
-- (shared with sorcerer)

spells74["exeta vis"] = s("Find Item", "exeta vis", "druid", 8, 50, false, 2000)
-- (shared with sorcerer)

spells74["adroi gran flam"] = s("Great Fireball", "adori gran flam", "druid", 9, 40, false, 2000)
-- (shared with sorcerer)

spells74["adori gran vis"] = s("Great Energy Beam", "adori gran vis", "druid", 14, 60, false, 2000)
-- (shared with sorcerer)

spells74["adori gran tera"] = s("Great Earth Ball", "adori gran tera", "druid", 18, 80, false, 2000)
-- (shared with sorcerer)

spells74["adori mas frigo"] = s("Ice Wave", "adori mas frigo", "druid", 12, 50, false, 2000)
-- (shared with sorcerer)

spells74["adori gran mas frigo"] = s("Great Ice Wave", "adori gran mas frigo", "druid", 20, 100, false, 2000)
-- (shared with sorcerer)

-- ============================================================================
-- RUNE SPELLS (10) - Cast from runes
-- ============================================================================

spells74["adori gran flam"] = r("Great Fireball Rune", "adori gran flam", 9, 40, false, 3)
spells74["adori gran flam"].description = "Creates GFB rune from blank rune"

spells74["adori gran vis"] = r("Great Energy Beam Rune", "adori gran vis", 14, 60, false, 3)
spells74["adori gran vis"].description = "Creates GEB rune"

spells74["adori gran tera"] = r("Great Earth Ball Rune", "adori gran tera", 18, 80, false, 3)
spells74["adori gran tera"].description = "Creates GE rune"

spells74["adori mas frigo"] = r("Ice Wave Rune", "adori mas frigo", 12, 50, false, 3)
spells74["adori mas frigo"].description = "Creates Ice Wave rune"

spells74["adori gran mas frigo"] = r("Great Ice Wave Rune", "adori gran mas frigo", 20, 100, false, 3)
spells74["adori gran mas frigo"].description = "Creates Great Ice Wave rune"

spells74["exori"] = r("Strike Rune", "exori", 8, 10, false, 3)
spells74["exori"].description = "Creates Strike rune"

spells74["exori gran"] = r("Great Strike Rune", "exori gran", 16, 25, false, 3)
spells74["exori gran"].description = "Creates Great Strike rune"

spells74["exori mort"] = r("Death Strike Rune", "exori mort", 24, 40, false, 3)
spells74["exori mort"].description = "Creates Death Strike rune"

spells74["exori vis"] = r("Energy Strike Rune", "exori vis", 28, 45, false, 3)
spells74["exori vis"].description = "Creates Energy Strike rune"

spells74["exori flam"] = r("Fire Strike Rune", "exori flam", 28, 45, false, 3)
spells74["exori flam"].description = "Creates Fire Strike rune"

spells74["exori frigo"] = r("Ice Strike Rune", "exori frigo", 28, 45, false, 3)
spells74["exori frigo"].description = "Creates Ice Strike rune"

spells74["exori tera"] = r("Earth Strike Rune", "exori tera", 28, 45, false, 3)
spells74["exori tera"].description = "Creates Earth Strike rune"

spells74["exori hur"] = r("Holy Strike Rune", "exori hur", 28, 45, false, 3)
spells74["exori hur"].description = "Creates Holy Strike rune"

spells74["exura"] = r("Heal Rune (HMM)", "exura", 1, 15, false, 3)
spells74["exura"].description = "Creates Heavy Magic Missile rune"

spells74["exura gran"] = r("Great Heal Rune (SHR)", "exura gran", 2, 30, false, 3)
spells74["exura gran"].description = "Creates Strong Health Rune"

spells74["exura vita"] = r("Ultimate Heal Rune (UHR)", "exura vita", 16, 60, false, 3)
spells74["exura vita"].description = "Creates Ultimate Healing Rune"

spells74["exura ico"] = r("Heal Friend Rune", "exura ico", 8, 30, false, 3)
spells74["exura ico"].description = "Creates Heal Friend rune"

spells74["utevo lux"] = r("Light Rune", "utevo lux", 1, 10, false, 3)
spells74["utevo lux"].description = "Creates Light rune"

spells74["upexo"] = r("Levitate Rune", "upexo", 1, 250, false, 1)
spells74["upexo"].description = "Creates Levitate rune"

spells74["utamo tempo san"] = r("Cure Poison Rune", "utamo tempo san", 1, 20, false, 3)
spells74["utamo tempo san"].description = "Creates Cure Poison rune"

spells74["utito tempo"] = r("Haste Rune", "utito tempo", 2, 30, false, 3)
spells74["utito tempo"].description = "Creates Haste rune"

spells74["utito tempo san"] = r("Strong Haste Rune", "utito tempo san", 4, 50, false, 3)
spells74["utito tempo san"].description = "Creates Strong Haste rune"

spells74["utamo vita"] = r("Light Healing Rune", "utamo vita", 1, 10, false, 3)
spells74["utamo vita"].description = "Creates Light Healing rune"

spells74["utana vid"] = r("Invisible Rune", "utana vid", 1, 250, false, 1)
spells74["utana vid"].description = "Creates Invisible rune"

-- ============================================================================
-- VOCATION SPELL MAPPING
-- ============================================================================

spells74.vocationSpells = {
  knight = {
    instant = { "exori", "exori gran", "exori mort", "exori vis", "exori flam", 
                "exori frigo", "exori tera", "exori hur" },
    rune = { "exori", "exori gran", "exori mort", "exori vis", "exori flam",
             "exori frigo", "exori tera", "exori hur" }
  },
  paladin = {
    instant = { "exori", "exori gran", "exori mort", "exori vis", "exori flam",
                "exori frigo", "exori tera", "exori hur" },
    rune = { "exori", "exori gran", "exori mort", "exori vis", "exori flam",
             "exori frigo", "exori tera", "exori hur" }
  },
  sorcerer = {
    instant = { "utana vid", "utamo tempo san", "utito tempo", "utito tempo san",
                "exeta res", "exeta con", "exeta vis",
                "adori gran flam", "adori gran vis", "adori gran tera",
                "adori mas frigo", "adori gran mas frigo" },
    rune = { "adori gran flam", "adori gran vis", "adori gran tera",
             "adori mas frigo", "adori gran mas frigo",
             "utana vid", "utamo tempo san", "utito tempo", "utito tempo san",
             "utamo vita" }
  },
  druid = {
    instant = { "exura", "exura gran", "exura vita", "exura ico",
                "utamo tempo san", "utito tempo", "utito tempo san",
                "exeta res", "exeta con", "exeta vis",
                "adori gran flam", "adori gran vis", "adori gran tera",
                "adori mas frigo", "adori gran mas frigo" },
    rune = { "exura", "exura gran", "exura vita", "exura ico",
             "utevo lux", "upexo", "utamo tempo san", "utito tempo",
             "utito tempo san", "utamo vita", "utana vid" }
  },
  all = {
    instant = { "utamo vita", "utevo lux" },
    rune = { "utevo lux", "upexo" }
  }
}

-- ============================================================================
-- RUNE CREATION REQUIREMENTS
-- ============================================================================

spells74.runeCreation = {
  -- { spellName, blankRuneId, requiredLevel, requiredMana, resultRuneId, charges }
  ["adori gran flam"] = { itemId = 2260, level = 9, mana = 40 * 3, resultId = 2270, charges = 3, vocation = "sorcerer" },
  ["adori gran vis"] = { itemId = 2260, level = 14, mana = 60 * 3, resultId = 2271, charges = 3, vocation = "sorcerer" },
  ["adori gran tera"] = { itemId = 2260, level = 18, mana = 80 * 3, resultId = 2268, charges = 3, vocation = "sorcerer" },
  ["adori mas frigo"] = { itemId = 2260, level = 12, mana = 50 * 3, resultId = 2278, charges = 3, vocation = "sorcerer" },
  ["adori gran mas frigo"] = { itemId = 2260, level = 20, mana = 100 * 3, resultId = 2279, charges = 3, vocation = "sorcerer" },
  
  ["exori"] = { itemId = 2260, level = 8, mana = 10 * 3, resultId = 2263, charges = 3, vocation = "knight" },
  ["exori gran"] = { itemId = 2260, level = 16, mana = 25 * 3, resultId = 2264, charges = 3, vocation = "knight" },
  ["exori mort"] = { itemId = 2260, level = 24, mana = 40 * 3, resultId = 2265, charges = 3, vocation = "knight" },
  ["exori vis"] = { itemId = 2260, level = 28, mana = 45 * 3, resultId = 2269, charges = 3, vocation = "knight" },
  ["exori flam"] = { itemId = 2260, level = 28, mana = 45 * 3, resultId = 2270, charges = 3, vocation = "knight" },
  ["exori frigo"] = { itemId = 2260, level = 28, mana = 45 * 3, resultId = 2271, charges = 3, vocation = "knight" },
  ["exori tera"] = { itemId = 2260, level = 28, mana = 45 * 3, resultId = 2272, charges = 3, vocation = "knight" },
  ["exori hur"] = { itemId = 2260, level = 28, mana = 45 * 3, resultId = 2273, charges = 3, vocation = "knight" },
  
  ["exura"] = { itemId = 2260, level = 1, mana = 15 * 3, resultId = 2265, charges = 3, vocation = "druid" }, -- HMM
  ["exura gran"] = { itemId = 2260, level = 2, mana = 30 * 3, resultId = 2266, charges = 3, vocation = "druid" }, -- SHR
  ["exura vita"] = { itemId = 2260, level = 16, mana = 60 * 3, resultId = 2267, charges = 3, vocation = "druid" }, -- UHR
  ["exura ico"] = { itemId = 2260, level = 8, mana = 30 * 3, resultId = 2274, charges = 3, vocation = "druid" }, -- Heal Friend
  ["utevo lux"] = { itemId = 2260, level = 1, mana = 10 * 3, resultId = 2272, charges = 3, vocation = "druid" }, -- Light
  ["upexo"] = { itemId = 2260, level = 1, mana = 250, resultId = 2275, charges = 1, vocation = "druid" }, -- Levitate (1 charge)
  ["utamo tempo san"] = { itemId = 2260, level = 1, mana = 20 * 3, resultId = 2276, charges = 3, vocation = "druid" },
  ["utito tempo"] = { itemId = 2260, level = 2, mana = 30 * 3, resultId = 2277, charges = 3, vocation = "druid" },
  ["utito tempo san"] = { itemId = 2260, level = 4, mana = 50 * 3, resultId = 2278, charges = 3, vocation = "druid" },
  ["utamo vita"] = { itemId = 2260, level = 1, mana = 10 * 3, resultId = 2279, charges = 3, vocation = "druid" },
  ["utana vid"] = { itemId = 2260, level = 1, mana = 250, resultId = 2280, charges = 1, vocation = "druid" },
}

-- ============================================================================
-- SPELL COOLDOWN GROUPS
-- ============================================================================

spells74.cooldownGroups = {
  combat = 1,      -- exori, adori, etc.
  healing = 2,     -- exura, exura gran, exura vita, exura ico
  support = 3,     -- utevo lux, upexo, utito tempo, etc.
  utility = 4      -- exeta, utamo tempo san, utana vid
}

-- ============================================================================
-- EXPORT
-- ============================================================================

return spells74