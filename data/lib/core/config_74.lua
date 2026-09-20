-- Tibia 7.4 — Lib: 7.4 Authentic Configuration
-- Sets all game parameters to authentic Tibia 7.4 values
-- This module should be loaded FIRST before any other game logic

local config = {}

-- 7.4 Experience Stages
config.experienceStages = {
    -- { level, multiplier }
    { 1, 1.0 },
    { 10, 1.0 },
    { 20, 1.0 },
    { 30, 1.0 },
    { 40, 1.0 },
    { 50, 1.0 },
    { 60, 1.0 },
    { 70, 1.0 },
    { 80, 1.0 },
    { 90, 1.0 },
    { 100, 1.0 }
}

-- 7.4 Skill Rates (base 1.0, configurable)
config.skillRates = {
    fist = 1.0,
    club = 1.0,
    sword = 1.0,
    axe = 1.0,
    distance = 1.0,
    shielding = 1.0,
    fishing = 1.0,
    magic = 1.0
}

-- 7.4 Loot Rate (base 1.0)
config.lootRate = 1.0

-- 7.4 Spawn Rate (base 1.0)
config.spawnRate = 1.0

-- 7.4 Magic Rate (base 1.0)
config.magicRate = 1.0

-- 7.4 Formulas (authentic 7.4)
config.formulas = {
    -- Physical damage: (skill * attack) / 100 + random
    meleeDamage = function(skill, attack, min, max)
        local base = (skill * attack) / 100
        return math.random(math.floor(base * (min or 0.5)), math.ceil(base * (max or 1.5)))
    end,
    
    -- Distance damage: (skill * attack) / 100 + random
    distanceDamage = function(skill, attack, min, max)
        local base = (skill * attack) / 100
        return math.random(math.floor(base * (min or 0.5)), math.ceil(base * (max or 1.5)))
    end,
    
    -- Magic damage: level / 5 + maglevel * 0.3 + random
    magicDamage = function(level, maglevel, min, max)
        local base = level / 5 + maglevel * 0.3
        return math.random(math.floor(base * (min or 0.5)), math.ceil(base * (max or 1.5)))
    end,
    
    -- Healing: level / 5 + maglevel * 0.5 + random
    healing = function(level, maglevel, min, max)
        local base = level / 5 + maglevel * 0.5
        return math.random(math.floor(base * (min or 0.5)), math.ceil(base * (max or 1.5)))
    end,
    
    -- Experience for level (7.4 formula: 50 * (level-1)^2 - 150 * (level-1) + 200)
    experienceForLevel = function(level)
        return 50 * (level - 1)^2 - 150 * (level - 1) + 200
    end,
    
    -- Mana for level (7.4: varies by vocation)
    manaForLevel = function(level, vocation)
        local base = {
            [1] = 5,   -- Knight
            [2] = 30,  -- Paladin
            [3] = 50,  -- Sorcerer
            [4] = 50   -- Druid
        }
        return (base[vocation] or 5) * (level - 1)
    end,
    
    -- Health for level (7.4: varies by vocation)
    healthForLevel = function(level, vocation)
        local base = {
            [1] = 25,  -- Knight
            [2] = 15,  -- Paladin
            [3] = 5,   -- Sorcerer
            [4] = 5    -- Druid
        }
        return (base[vocation] or 5) * (level - 1) + 150
    end,
    
    -- Capacity for level (7.4: 10 per level for knights, 5 for others)
    capacityForLevel = function(level, vocation)
        local base = {
            [1] = 10,  -- Knight
            [2] = 10,  -- Paladin
            [3] = 5,   -- Sorcerer
            [4] = 5    -- Druid
        }
        return (base[vocation] or 5) * (level - 1) + 400
    end
}

-- 7.4 Vocation Constants
config.vocations = {
    NONE = 0,
    KNIGHT = 1,
    PALADIN = 2,
    SORCERER = 3,
    DRUID = 4
}

-- 7.4 Vocation Names
config.vocationNames = {
    [0] = "None",
    [1] = "Knight",
    [2] = "Paladin",
    [3] = "Sorcerer",
    [4] = "Druid"
}

-- 7.4 Promotion Vocations
config.promotedVocations = {
    [1] = 1, -- Knight -> Knight (no promotion in 7.4)
    [2] = 2, -- Paladin -> Paladin (no promotion in 7.4)
    [3] = 3, -- Sorcerer -> Sorcerer (no promotion in 7.4)
    [4] = 4  -- Druid -> Druid (no promotion in 7.4)
}

-- 7.4 Towns
config.towns = {
    { id = 1, name = "Thais", temple = { x = 32369, y = 32241, z = 7 } },
    { id = 2, name = "Carlin", temple = { x = 32387, y = 31820, z = 7 } },
    { id = 3, name = "Venore", temple = { x = 32957, y = 32076, z = 7 } },
    { id = 4, name = "Edron", temple = { x = 33173, y = 31764, z = 7 } },
    { id = 5, name = "Darashia", temple = { x = 33289, y = 32480, z = 7 } },
    { id = 6, name = "Ankrahmun", temple = { x = 33092, y = 32883, z = 7 } },
    { id = 7, name = "Kazordoon", temple = { x = 32649, y = 31925, z = 7 } },
    { id = 8, name = "Liberty Bay", temple = { x = 32285, y = 32892, z = 7 } }
}

-- 7.4 Item IDs (key items)
config.items = {
    -- Wands/Rods (NOT in 7.4 - available via custom config)
    WAND_OF_VORTEX = 2190,
    WAND_OF_DRAGONBREATH = 2191,
    WAND_OF_PLAGUE = 2192,
    WAND_OF_COSMIC_ENERGY = 2193,
    WAND_OF_INFERNO = 2194,
    WAND_OF_STARSTORM = 2195,
    WAND_OF_VOID = 2196,
    ROD_OF_NECRO = 2197,
    ROD_OF_SOLAR = 2198,
    ROD_OF_SPRING = 2199,
    
    -- Coins
    GOLD_COIN = 2148,
    PLATINUM_COIN = 2152,
    CRYSTAL_COIN = 2160,
    
    -- Potions
    HEALTH_POTION = 7618,
    MANA_POTION = 7620,
    STRONG_HEALTH_POTION = 7588,
    STRONG_MANA_POTION = 7589,
    GREAT_HEALTH_POTION = 7642,
    GREAT_MANA_POTION = 7643,
    ULTIMATE_HEALTH_POTION = 8473,
    ULTIMATE_MANA_POTION = 8472,
    GREAT_SPIRIT_POTION = 8474,
    
    -- Runes
    BLANK_RUNE = 2260,
    LIGHT_RUNE = 2272,
    HEALTH_RUNE = 2265,
    MANA_RUNE = 2274,
    STRONG_HEALTH_RUNE = 2266,
    STRONG_MANA_RUNE = 2267,
    SUDDEN_DEATH_RUNE = 2268,
    EXPLOSION_RUNE = 2313,
    ULTIMATE_EXPLOSION_RUNE = 2272, -- Different in 7.4
    HEAVY_MAGIC_MISSILE_RUNE = 2269,
    GREAT_FIREBALL_RUNE = 2270,
    HOLY_MISSILE_RUNE = 2271,
    
    -- Ammo
    ARROW = 2544,
    BOLT = 2543,
    SPRUNT_NAIL = 2546,
    POWER_BOLT = 2547,
    
    -- Weapons (7.4 selection)
    -- Swords
    SWORD = 2376,
    RAPIER = 2384,
    SABRE = 2385,
    BROAD_SWORD = 2387,
    DRAGON_SLAYER = 2389,
    GIANT_SWORD = 2391,
    PHARAOH_SWORD = 2392,
    SERPENT_SWORD = 2393,
    HAILSTORM_ROD = 2185, -- Not in 7.4
    
    -- Axes
    HATCHET = 2368,
    DOUBLE_AXE = 2387,
    WAR_AXE = 2394,
    BATTLE_AXE = 2377,
    TITAN_AXE = 2412,
    
    -- Clubs
    CLUB = 2377,
    MACE = 2398,
    MORNING_STAR = 2399,
    WAR_HAMMER = 2395,
    STONE_CRUSHER = 2400,
    
    -- Distance
    BOW = 2456,
    CROSSBOW = 2455,
    COMPOSITE_BOW = 2457,
    LASTING_BOW = 2458, -- Not in 7.4
    
    -- Shields
    WOODEN_SHIELD = 2512,
    BATTLE_SHIELD = 2513,
    DRAGON_SHIELD = 2514,
    MASTERMIND_SHIELD = 2515,
    GUARDIAN_SHIELD = 2516,
    DREAD_SHIELD = 2517,
    BLACK_SHIELD = 2518,
    COBRA_BASTARD = 2519, -- Not in 7.4
    
    -- Armor
    LEATHER_ARMOR = 2467,
    STUDDED_ARMOR = 2468,
    PLATE_ARMOR = 2463,
    DRAGON_SCALE_MAIL = 2492,
    MAGIC_PLATE_ARMOR = 2472,
    GOLDEN_ARMOR = 2466,
    BRASS_ARMOR = 2464,
    CHAIN_ARMOR = 2464,
    
    -- Helmets
    LEATHER_HELMET = 2461,
    IRON_HELMET = 2458,
    CHAIN_HELMET = 2458,
    STUDDED_HELMET = 2482,
    DRAGON_HELMET = 2491,
    GOLDEN_HELMET = 2471,
    DRACO_HELMET = 2490,
    
    -- Legs
    LEATHER_LEGS = 2649,
    GOLDEN_LEGS = 2470,
    DRAGON_LEGS = 2495,
    
    -- Boots
    LEATHER_BOOTS = 2643,
    GOLDEN_BOOTS = 2469,
    DRAGON_BOOTS = 2493,
    
    -- Amulets/Necklaces
    SCARF = 2662,
    NECKLACE_OF_THE_DEEP = 2195, -- Not in 7.4
    NECKLACE = 2137,
    DRAGON_NECKLACE = 2200,
    
    -- Rings
    RING = 2168,
    STEALTH_RING = 2204,
    POWER_RING = 2167,
    ENERGY_RING = 2166,
    LIFE_RING = 2168,
    TIME_RING = 2168,
    
    -- Tools
    PICK = 2553,
    ROPE = 2120,
    SHOVEL = 2554,
    FISHING_ROD = 2580,
    
    -- Keys
    KEY_2011 = 2011,
    KEY_2012 = 2012,
    KEY_2013 = 2013,
    KEY_2014 = 2014,
    KEY_2015 = 2015,
    KEY_2016 = 2016,
    KEY_2017 = 2017,
    KEY_2018 = 2018,
    KEY_2019 = 2019,
    KEY_2020 = 2020,
    KEY_2021 = 2021,
    KEY_2022 = 2022,
    KEY_2023 = 2023,
    KEY_2024 = 2024,
    KEY_2025 = 2025,
    KEY_2026 = 2026,
    KEY_2027 = 2027,
    KEY_2028 = 2028,
    KEY_2029 = 2029,
    KEY_2030 = 2030,
    
    -- Food
    BROWN_BREAD = 2690,
    CHEESE = 2696,
    HAM = 2671,
    MEAT = 2666,
    DRAGON_HAM = 2670,
    ROLLER = 2693,
    WHITE_BREAD = 2689,
    
    -- Depot
    DEPOT_CHEST = 2594,
    LOCKER = 2589,
    
    -- Magic Effects
    MAGIC_EFFECTS = {
        POFF = 1,
        EXPLOSION = 2,
        FIRE = 3,
        POISON = 4,
        ENERGY = 5,
        HOLY = 6,
        ICE = 7,
        BLOOD = 8,
        MORTAL = 9,
        GREEN_RING = 10,
        SMOKE = 11,
        TELEPORT = 12,
        MAGIC_MISSILE = 13,
        FIREWORK_BLUE = 14,
        FIREWORK_RED = 15,
        FIREWORK_YELLOW = 16,
        TUTORIAL = 17,
        SPARK_GREEN = 18,
        SPARK_RED = 19,
        SPARK_BLUE = 20,
        SPARK_YELLOW = 21,
        GATHER = 22,
        BIG_CLOUDS = 23,
        GREEN_BLOOD = 24,
        FIREWORK_GREEN = 25,
        FIREWORK_PURPLE = 26,
        FIREWORK_WHITE = 27,
        FIELD_FIRE = 28,
        FIELD_ENERGY = 29,
        FIELD_POISON = 30,
        SMALL_HOLY = 31,
        SMALL_DARK = 32,
        SMALL_ICE = 33,
        SMALL_WATER = 34,
        SMALL_PLANT = 35,
        SMALL_WIND = 36,
        SMALL_GROUND = 37,
        SMALL_ENERGY = 38,
        SMALL_FIRE = 39,
        SMALL_POISON = 40,
        SMALL_MAGIC = 41,
        SMALL_ICE = 42,
        SMALL_HOLY = 43,
        SMALL_DARK = 44,
        SMALL_WATER = 45,
        SMALL_PLANT = 46,
        SMALL_WIND = 47,
        SMALL_GROUND = 48,
        SMALL_ENERGY = 49,
        SMALL_FIRE = 50,
        SMALL_POISON = 51,
        SMALL_MAGIC = 52,
        SMALL_ICE = 53,
        SMALL_HOLY = 54,
        SMALL_DARK = 55,
        SMALL_WATER = 56,
        SMALL_PLANT = 57,
        SMALL_WIND = 58,
        SMALL_GROUND = 59,
        SMALL_ENERGY = 60,
        SMALL_FIRE = 61,
        SMALL_POISON = 62,
        SMALL_MAGIC = 63
    }
}

-- 7.4 Monster Loot Rates (base rates from 7.4)
config.lootCategories = {
    common = 0.8,
    uncommon = 0.3,
    rare = 0.1,
    very_rare = 0.03,
    unique = 0.01
}

-- 7.4 Rates Configuration (authentic)
config.rates = {
    experience = 1.0,
    skill = 1.0,
    loot = 1.0,
    magic = 1.0,
    spawn = 1.0,
    spawnDelay = 10 * 60 * 1000, -- 10 minutes in ms
    stamina = false, -- Not in 7.4
    offlineTraining = false -- Not in 7.4
}

-- 7.4 Protection Zones
config.protectionZones = true

-- 7.4 PVP Settings
config.pvp = {
    enabled = true,
    pvpZone = true,
    skullSystem = true,
    fragsToRedSkull = {
        daily = 3,
        weekly = 10,
        monthly = 20
    },
    fragsToBanishment = {
        daily = 5,
        weekly = 15,
        monthly = 30
    }
}

-- 7.4 Death Loss Percentages
config.deathLoss = {
    experience = 10, -- 10% exp loss
    mana = 100,      -- 100% mana loss
    skills = 0,      -- No skill loss in 7.4
    items = 10,      -- 10% item drop chance
    backpack = true  -- Drop backpack
}

-- 7.4 Spell Configuration
config.spells = {
    -- Instant spells
    instant = {
        "utamo vita",      -- Light Healing
        "utevo lux",       -- Light
        "upexo",           -- Levitate
        "utana vid",       -- Invisible
        "exura",           -- Heal
        "exura gran",      -- Great Heal
        "exura vita",      -- Ultimate Heal
        "exura ico",       -- Heal Friend
        "utamo tempo san", -- Cure Poison
        "utito tempo",     -- Haste
        "utito tempo san", -- Strong Haste
        "exeta res",       -- Find Person
        "exeta con",       -- Find Creature
        "exeta vis",       -- Find Item
        "exori",           -- Strike
        "exori gran",      -- Great Strike
        "exori mort",      -- Death Strike
        "exori vis",       -- Energy Strike
        "exori flam",      -- Fire Strike
        "exori frigo",     -- Ice Strike
        "exori tera",      -- Earth Strike
        "exori hur",       -- Holy Strike
        "adori gran flam", -- Great Fireball
        "adori gran vis",  -- Great Energy Beam
        "adori gran tera", -- Great Earth Ball
        "adori mas frigo", -- Ice Wave
        "adori gran mas frigo" -- Great Ice Wave
    },
    
    -- Rune spells (cast from runes)
    rune = {
        "adori gran flam", -- Great Fireball
        "adori gran vis",  -- Great Energy Beam
        "adori gran tera", -- Great Earth Ball
        "adori mas frigo", -- Ice Wave
        "adori gran mas frigo", -- Great Ice Wave
        "exori",           -- Strike
        "exori gran",      -- Great Strike
        "exori mort",      -- Death Strike
        "exori vis",       -- Energy Strike
        "exori flam",      -- Fire Strike
        "exori frigo",     -- Ice Strike
        "exori tera",      -- Earth Strike
        "exori hur",       -- Holy Strike
        "exura",           -- Heal
        "exura gran",      -- Great Heal
        "exura vita",      -- Ultimate Heal
        "exura ico",       -- Heal Friend
        "utevo lux",       -- Light
        "upexo",           -- Levitate
        "utamo tempo san", -- Cure Poison
        "utito tempo",     -- Haste
        "utito tempo san", -- Strong Haste
        "utamo vita",      -- Light Healing
        "utana vid"        -- Invisible
    }
}

-- 7.4 Premium Benefits
config.premium = {
    enabled = true,
    gracePeriod = 7 * 24 * 60 * 60, -- 7 days
    benefits = {
        accessToPremiumAreas = true,
        increasedDepotSize = true,
        moreVipSlots = true,
        offlineTraining = false, -- Not in 7.4
        staminaBonus = false     -- Not in 7.4
    }
}

-- Export
return config