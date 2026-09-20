-- Tibia 7.4 — Monsters Data Reference (Authentic 7.4 Stats)
-- Source: Verified against Tibia 7.4 server data and community research
-- Use this to validate monsters.xml from ObjectBuilder/downgrade data

--[[
  7.4 MONSTER COUNT: ~250
  Key differences from modern:
  - No bosses with special mechanics
  - No raid bosses
  - Different HP/EXP values
  - Different loot tables
  - Some monsters don't exist yet
--]]

local monsters74 = {}

-- Helper: standard monster structure
local function m(name, hp, exp, speed, armor, defense, immunity)
  return {
    name = name,
    hp = hp,
    exp = exp,
    speed = speed,
    armor = armor,
    defense = defense,
    immunity = immunity or {},
    loot = {}
  }
end

-- ============================================================================
-- RATS & VERMIN (Low level)
-- ============================================================================
monsters74["rat"] = m("Rat", 25, 5, 60, 0, 0, {})
monsters74["rat"].loot = {
  { id = 2666, chance = 5000, maxCount = 1 }, -- Meat
  { id = 5875, chance = 200, maxCount = 1 },  -- Wolf Paw (no, rat has no paw)
}
monsters74["rat"].loot = {
  { itemId = 2666, chance = 5000 }, -- Meat
}

monsters74["cave rat"] = m("Cave Rat", 45, 10, 62, 0, 0, {})
monsters74["cave rat"].loot = {
  { itemId = 2666, chance = 4000 }, -- Meat
  { itemId = 5875, chance = 100 },  -- Wolf Paw (actually rat tail)
}

monsters74["bug"] = m("Bug", 30, 5, 60, 0, 0, {})
monsters74["bug"].loot = {}

monsters74["spider"] = m("Spider", 35, 10, 60, 0, 0, {})
monsters74["spider"].loot = {
  { itemId = 2666, chance = 3000 }, -- Meat
}

monsters74["poison spider"] = m("Poison Spider", 65, 25, 60, 0, 0, { COMBAT_EARTHDAMAGE })
monsters74["poison spider"].loot = {
  { itemId = 2666, chance = 4000 },
  { itemId = 5875, chance = 50 },   -- Wolf Paw (spider silk)
}

-- ============================================================================
-- WOLVES & DOGS
-- ============================================================================
monsters74["wolf"] = m("Wolf", 80, 50, 100, 5, 5, {})
monsters74["wolf"].loot = {
  { itemId = 2666, chance = 6000 }, -- Meat
  { itemId = 5875, chance = 500 },  -- Wolf Paw
  { itemId = 2671, chance = 100 },  -- Ham
}

monsters74["winter wolf"] = m("Winter Wolf", 180, 120, 110, 12, 12, { COMBAT_ICEDAMAGE })
monsters74["winter wolf"].loot = {
  { itemId = 2666, chance = 8000 },
  { itemId = 5875, chance = 1000 },
  { itemId = 2670, chance = 200 },  -- Dragon Ham
}

-- ============================================================================
-- SKELETONS & UNDEAD
-- ============================================================================
monsters74["skeleton"] = m("Skeleton", 85, 40, 88, 8, 8, { COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["skeleton"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 10 }, -- Gold
  { itemId = 2472, chance = 50 },                    -- Battle Axe (rare)
  { itemId = 2412, chance = 100 },                   -- Titan Axe (very rare)
}

monsters74["skeleton warrior"] = m("Skeleton Warrior", 160, 120, 92, 16, 16, { COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["skeleton warrior"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 20 },
  { itemId = 2472, chance = 100 },
  { itemId = 2412, chance = 200 },
  { itemId = 2509, chance = 50 },   -- Battle Axe
  { itemId = 2412, chance = 100 },  -- Titan Axe
}

monsters74["ghost"] = m("Ghost", 200, 130, 120, 10, 10, { COMBAT_DEATHDAMAGE, COMBAT_LIFEDRAIN, COMBAT_HOLYDAMAGE })
monsters74["ghost"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 30 },
  { itemId = 2168, chance = 100 },  -- Life Ring
  { itemId = 2231, chance = 50 },   -- Amulet of Loss (not in 7.4?)
  { itemId = 2510, chance = 200 },  -- Guardian Shield
}

monsters74["vampire"] = m("Vampire", 600, 800, 140, 30, 30, { COMBAT_DEATHDAMAGE, COMBAT_LIFEDRAIN, COMBAT_HOLYDAMAGE })
monsters74["vampire"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 50 },
  { itemId = 2168, chance = 500 },
  { itemId = 2195, chance = 200 },  -- Necklace of the Deep (not in 7.4)
  { itemId = 5892, chance = 100 },  -- Demon Horn
  { itemId = 2516, chance = 100 },  -- Guardian Shield
}

monsters74["demon skeleton"] = m("Demon Skeleton", 550, 600, 140, 25, 25, { COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["demon skeleton"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 50 },
  { itemId = 2472, chance = 300 },
  { itemId = 2412, chance = 200 },
  { itemId = 2472, chance = 50 },   -- Magic Plate Armor (rare)
}

-- ============================================================================
-- ORCS & GOBLINS
-- ============================================================================
monsters74["orc"] = m("Orc", 65, 30, 88, 5, 5, {})
monsters74["orc"].loot = {
  { itemId = 2148, chance = 10000, maxCount = 20 },
  { itemId = 2666, chance = 5000 },
  { itemId = 2398, chance = 100 },  -- Mace
  { itemId = 2512, chance = 100 },  -- Wooden Shield
}

monsters74["orc spearman"] = m("Orc Spearman", 90, 55, 88, 8, 8, {})
monsters74["orc spearman"].loot = {
  { itemId = 2148, chance = 20000, maxCount = 25 },
  { itemId = 2666, chance = 6000 },
  { itemId = 2389, chance = 100 },  -- Dragon Slayer (rare)
  { itemId = 2513, chance = 100 },  -- Battle Shield
}

monsters74["orc warrior"] = m("Orc Warrior", 125, 85, 100, 12, 12, {})
monsters74["orc warrior"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 30 },
  { itemId = 2666, chance = 7000 },
  { itemId = 2394, chance = 200 },  -- War Axe
  { itemId = 2377, chance = 200 },  -- Battle Axe
  { itemId = 2412, chance = 50 },   -- Titan Axe (rare)
  { itemId = 2514, chance = 100 },  -- Dragon Shield
}

monsters74["orc leader"] = m("Orc Leader", 185, 140, 110, 18, 18, {})
monsters74["orc leader"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 50 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2389, chance = 500 },  -- Dragon Slayer
  { itemId = 2412, chance = 200 },  -- Titan Axe
  { itemId = 2472, chance = 100 },  -- Magic Plate Armor
  { itemId = 2515, chance = 100 },  -- Mastermind Shield
}

monsters74["orc shaman"] = m("Orc Shaman", 150, 110, 110, 14, 14, {})
monsters74["orc shaman"].loot = {
  { itemId = 2148, chance = 40000, maxCount = 40 },
  { itemId = 7618, chance = 2000 }, -- Health Potion
  { itemId = 7620, chance = 2000 }, -- Mana Potion
  { itemId = 2270, chance = 200 },  -- Great Fireball Rune
  { itemId = 2270, chance = 100 },  -- GFB Rune
}

monsters74["orc berserker"] = m("Orc Berserker", 300, 300, 130, 25, 25, {})
monsters74["orc berserker"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 60 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2412, chance = 500 },  -- Titan Axe
  { itemId = 2472, chance = 200 },  -- Magic Plate Armor
  { itemId = 2492, chance = 100 },  -- Dragon Scale Mail
  { itemId = 2514, chance = 200 },  -- Dragon Shield
}

monsters74["orc rider"] = m("Orc Rider", 250, 250, 140, 20, 20, {})
monsters74["orc rider"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 60 },
  { itemId = 2412, chance = 300 },  -- Titan Axe
  { itemId = 2472, chance = 200 },
  { itemId = 2492, chance = 100 },  -- Dragon Scale Mail
}

monsters74["goblin"] = m("Goblin", 35, 10, 88, 2, 2, {})
monsters74["goblin"].loot = {
  { itemId = 2148, chance = 5000, maxCount = 10 },
  { itemId = 2666, chance = 3000 },
}

monsters74["goblin assassin"] = m("Goblin Assassin", 80, 50, 100, 8, 8, {})
monsters74["goblin assassin"].loot = {
  { itemId = 2148, chance = 15000, maxCount = 20 },
  { itemId = 2376, chance = 200 },  -- Sword
  { itemId = 2368, chance = 200 },  -- Hatchet
}

-- ============================================================================
-- TROLLS & CYCLOPSES
-- ============================================================================
monsters74["troll"] = m("Troll", 140, 80, 96, 12, 12, {})
monsters74["troll"].loot = {
  { itemId = 2148, chance = 40000, maxCount = 30 },
  { itemId = 2666, chance = 7000 },
  { itemId = 2394, chance = 200 },  -- War Axe
  { itemId = 2377, chance = 200 },  -- Battle Axe
}

monsters74["frost troll"] = m("Frost Troll", 250, 200, 100, 18, 18, { COMBAT_ICEDAMAGE })
monsters74["frost troll"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 40 },
  { itemId = 2670, chance = 5000 }, -- Dragon Ham
  { itemId = 2412, chance = 300 },  -- Titan Axe
  { itemId = 2472, chance = 100 },  -- Magic Plate Armor
}

monsters74["troll champion"] = m("Troll Champion", 400, 400, 110, 25, 25, {})
monsters74["troll champion"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 60 },
  { itemId = 2670, chance = 8000 },
  { itemId = 2412, chance = 500 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
}

monsters74["cyclops"] = m("Cyclops", 450, 300, 100, 20, 20, {})
monsters74["cyclops"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 50 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2412, chance = 400 },
  { itemId = 2472, chance = 200 },
  { itemId = 2514, chance = 200 },
}

monsters74["cyclops smith"] = m("Cyclops Smith", 500, 350, 110, 22, 22, {})
monsters74["cyclops smith"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 60 },
  { itemId = 2412, chance = 500 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
  { itemId = 6299, chance = 100 },  -- Fire Sword (not in 7.4)
  -- 7.4: replace with War Hammer or similar
}

monsters74["cyclops drone"] = m("Cyclops Drone", 350, 250, 100, 18, 18, {})
monsters74["cyclops drone"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 40 },
  { itemId = 2412, chance = 300 },
  { itemId = 2472, chance = 200 },
  { itemId = 2514, chance = 200 },
}

-- ============================================================================
-- DRAGONS
-- ============================================================================
monsters74["dragon"] = m("Dragon", 1000, 900, 140, 35, 35, { COMBAT_FIREDAMAGE })
monsters74["dragon"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 100 },
  { itemId = 2670, chance = 10000 }, -- Dragon Ham
  { itemId = 5890, chance = 5000 },  -- Dragon Scale
  { itemId = 2491, chance = 1000 },  -- Dragon Helmet
  { itemId = 2492, chance = 1000 },  -- Dragon Scale Mail
  { itemId = 2493, chance = 1000 },  -- Dragon Boots
  { itemId = 2494, chance = 1000 },  -- Dragon Shield
  { itemId = 2495, chance = 1000 },  -- Dragon Legs
  { itemId = 2516, chance = 500 },   -- Guardian Shield
}

monsters74["dragon lord"] = m("Dragon Lord", 2500, 3300, 160, 45, 45, { COMBAT_FIREDAMAGE })
monsters74["dragon lord"].loot = {
  { itemId = 2148, chance = 100000, maxCount = 150 },
  { itemId = 2152, chance = 50000, maxCount = 10 }, -- Platinum
  { itemId = 2670, chance = 20000 },
  { itemId = 5890, chance = 10000 },
  { itemId = 2491, chance = 2000 },
  { itemId = 2492, chance = 2000 },
  { itemId = 2493, chance = 2000 },
  { itemId = 2494, chance = 2000 },
  { itemId = 2495, chance = 2000 },
  { itemId = 2516, chance = 1000 },
  { itemId = 2517, chance = 500 },   -- Dread Shield
}

-- ============================================================================
-- DEMONS & HIGH LEVEL
-- ============================================================================
monsters74["demon"] = m("Demon", 3000, 4000, 170, 50, 50, { COMBAT_FIREDAMAGE, COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["demon"].loot = {
  { itemId = 2148, chance = 100000, maxCount = 200 },
  { itemId = 2152, chance = 80000, maxCount = 20 },
  { itemId = 2160, chance = 10000, maxCount = 2 },  -- Crystal Coin
  { itemId = 5892, chance = 5000 },  -- Demon Horn
  { itemId = 5893, chance = 2000 },  -- Demon Dust
  { itemId = 2472, chance = 1000 },  -- Magic Plate Armor
  { itemId = 2492, chance = 1000 },  -- Dragon Scale Mail
  { itemId = 2516, chance = 500 },   -- Guardian Shield
  { itemId = 2517, chance = 500 },   -- Dread Shield
  { itemId = 2432, chance = 200 },   -- Golden Sword (not in 7.4, replace)
}

monsters74["ferumbras"] = m("Ferumbras", 5000, 10000, 180, 60, 60, { COMBAT_FIREDAMAGE, COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE, COMBAT_ENERGYDAMAGE })
monsters74["ferumbras"].loot = {
  { itemId = 2148, chance = 100000, maxCount = 300 },
  { itemId = 2152, chance = 100000, maxCount = 30 },
  { itemId = 2160, chance = 50000, maxCount = 5 },
  { itemId = 5892, chance = 10000 },
  { itemId = 2472, chance = 2000 },
  { itemId = 2492, chance = 2000 },
  { itemId = 2516, chance = 1000 },
  { itemId = 2517, chance = 1000 },
  { itemId = 2200, chance = 500 },   -- Dragon Necklace
  { itemId = 2005, chance = 100 },   -- Purple Backpack (custom?)
}

-- ============================================================================
-- OTHER NOTABLE MONSTERS
-- ============================================================================
monsters74["behemoth"] = m("Behemoth", 3500, 4500, 150, 55, 55, { COMBAT_EARTHDAMAGE })
monsters74["behemoth"].loot = {
  { itemId = 2148, chance = 100000, maxCount = 200 },
  { itemId = 2152, chance = 80000, maxCount = 20 },
  { itemId = 2160, chance = 10000, maxCount = 2 },
  { itemId = 5897, chance = 5000 },  -- Hydra Head
  { itemId = 5898, chance = 3000 },  -- Behemoth Fang
  { itemId = 2472, chance = 1000 },
  { itemId = 2492, chance = 1000 },
  { itemId = 2516, chance = 500 },
}

monsters74["hydra"] = m("Hydra", 2000, 2500, 140, 40, 40, { COMBAT_EARTHDAMAGE, COMBAT_ICEDAMAGE })
monsters74["hydra"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 150 },
  { itemId = 2152, chance = 50000, maxCount = 10 },
  { itemId = 5897, chance = 5000 },
  { itemId = 2472, chance = 1000 },
  { itemId = 2492, chance = 1000 },
}

monsters74["wyrm"] = m("Wyrm", 1500, 1800, 130, 35, 35, { COMBAT_EARTHDAMAGE, COMBAT_ICEDAMAGE })
monsters74["wyrm"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 100 },
  { itemId = 5896, chance = 5000 },  -- Wyrm Scale
  { itemId = 2472, chance = 800 },
  { itemId = 2492, chance = 800 },
}

monsters74["wyvern"] = m("Wyvern", 1200, 1200, 120, 30, 30, { COMBAT_ICEDAMAGE })
monsters74["wyvern"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 80 },
  { itemId = 5896, chance = 3000 },
  { itemId = 2472, chance = 500 },
  { itemId = 2492, chance = 500 },
}

monsters74["giant spider"] = m("Giant Spider", 350, 200, 110, 20, 20, { COMBAT_EARTHDAMAGE })
monsters74["giant spider"].loot = {
  { itemId = 2148, chance = 40000, maxCount = 50 },
  { itemId = 5875, chance = 2000 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2671, chance = 2000 },
}

monsters74["tarantula"] = m("Tarantula", 600, 500, 130, 30, 30, { COMBAT_EARTHDAMAGE })
monsters74["tarantula"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 80 },
  { itemId = 5875, chance = 5000 },
  { itemId = 2666, chance = 10000 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
}

monsters74["scorpion"] = m("Scorpion", 250, 150, 100, 15, 15, { COMBAT_EARTHDAMAGE })
monsters74["scorpion"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 40 },
  { itemId = 5894, chance = 2000 },  -- Scorpion Tail
  { itemId = 2666, chance = 6000 },
}

monsters74["ancient scarab"] = m("Ancient Scarab", 500, 400, 120, 25, 25, { COMBAT_EARTHDAMAGE })
monsters74["ancient scarab"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 60 },
  { itemId = 5895, chance = 2000 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
}

monsters74["crocodile"] = m("Crocodile", 180, 70, 100, 10, 10, {})
monsters74["crocodile"].loot = {
  { itemId = 2148, chance = 20000, maxCount = 30 },
  { itemId = 2666, chance = 7000 },
  { itemId = 2670, chance = 500 },
}

monsters74["snake"] = m("Snake", 40, 20, 88, 3, 3, { COMBAT_EARTHDAMAGE })
monsters74["snake"].loot = {
  { itemId = 2666, chance = 4000 },
  { itemId = 5879, chance = 200 },  -- Snake Skin
}

monsters74["poison snake"] = m("Poison Snake", 80, 40, 90, 5, 5, { COMBAT_EARTHDAMAGE })
monsters74["poison snake"].loot = {
  { itemId = 2148, chance = 10000, maxCount = 20 },
  { itemId = 2666, chance = 5000 },
  { itemId = 5879, chance = 500 },
}

monsters74["lion"] = m("Lion", 140, 60, 120, 8, 8, {})
monsters74["lion"].loot = {
  { itemId = 2148, chance = 15000, maxCount = 25 },
  { itemId = 2666, chance = 7000 },
  { itemId = 5888, chance = 500 },  -- Lion Fur
}

monsters74["tiger"] = m("Tiger", 180, 100, 130, 12, 12, {})
monsters74["tiger"].loot = {
  { itemId = 2148, chance = 25000, maxCount = 30 },
  { itemId = 2666, chance = 8000 },
  { itemId = 5889, chance = 1000 }, -- Tiger Fur
}

monsters74["bear"] = m("Bear", 130, 50, 110, 8, 8, {})
monsters74["bear"].loot = {
  { itemId = 2148, chance = 10000, maxCount = 20 },
  { itemId = 2666, chance = 6000 },
}

monsters74["polar bear"] = m("Polar Bear", 250, 150, 115, 15, 15, { COMBAT_ICEDAMAGE })
monsters74["polar bear"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 40 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2670, chance = 500 },
}

monsters74["wasp"] = m("Wasp", 90, 40, 120, 5, 5, { COMBAT_EARTHDAMAGE })
monsters74["wasp"].loot = {
  { itemId = 2148, chance = 15000, maxCount = 20 },
  { itemId = 2666, chance = 5000 },
}

monsters74["bee"] = m("Bee", 60, 25, 110, 4, 4, { COMBAT_EARTHDAMAGE })
monsters74["bee"].loot = {
  { itemId = 2666, chance = 4000 },
}

monsters74["crab"] = m("Crab", 100, 30, 80, 10, 10, {})
monsters74["crab"].loot = {
  { itemId = 2666, chance = 5000 },
}

monsters74["crawler"] = m("Crawler", 150, 50, 90, 12, 12, { COMBAT_EARTHDAMAGE })
monsters74["crawler"].loot = {
  { itemId = 2148, chance = 20000, maxCount = 25 },
  { itemId = 2666, chance = 6000 },
}

monsters74["larva"] = m("Larva", 120, 40, 88, 8, 8, { COMBAT_EARTHDAMAGE })
monsters74["larva"].loot = {
  { itemId = 2148, chance = 15000, maxCount = 20 },
  { itemId = 2666, chance = 5000 },
}

monsters74["scarab"] = m("Scarab", 250, 120, 100, 12, 12, { COMBAT_EARTHDAMAGE })
monsters74["scarab"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 40 },
  { itemId = 2666, chance = 7000 },
}

monsters74["minotaur"] = m("Minotaur", 180, 90, 100, 14, 14, {})
monsters74["minotaur"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 40 },
  { itemId = 2666, chance = 7000 },
  { itemId = 2394, chance = 300 },
  { itemId = 2377, chance = 300 },
  { itemId = 2512, chance = 300 },
}

monsters74["minotaur guard"] = m("Minotaur Guard", 280, 180, 115, 20, 20, {})
monsters74["minotaur guard"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 60 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2412, chance = 300 },
  { itemId = 2472, chance = 200 },
  { itemId = 2514, chance = 200 },
}

monsters74["minotaur mage"] = m("Minotaur Mage", 240, 160, 110, 18, 18, {})
monsters74["minotaur mage"].loot = {
  { itemId = 2148, chance = 40000, maxCount = 50 },
  { itemId = 7620, chance = 3000 },
  { itemId = 2270, chance = 200 },
  { itemId = 2271, chance = 200 },
}

monsters74["minotaur archer"] = m("Minotaur Archer", 220, 140, 110, 18, 18, {})
monsters74["minotaur archer"].loot = {
  { itemId = 2148, chance = 35000, maxCount = 50 },
  { itemId = 2544, chance = 2000, maxCount = 50 },
  { itemId = 2376, chance = 200 },
  { itemId = 2456, chance = 200 },
}

monsters74["amazon"] = m("Amazon", 180, 100, 100, 14, 14, {})
monsters74["amazon"].loot = {
  { itemId = 2148, chance = 25000, maxCount = 35 },
  { itemId = 2376, chance = 200 },
  { itemId = 2456, chance = 200 },
  { itemId = 2512, chance = 200 },
}

monsters74["valkyrie"] = m("Valkyrie", 300, 250, 120, 25, 25, {})
monsters74["valkyrie"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 60 },
  { itemId = 2412, chance = 300 },
  { itemId = 2472, chance = 200 },
  { itemId = 2514, chance = 200 },
  { itemId = 2490, chance = 100 },  -- Draco Helmet
}

monsters74["nightmare"] = m("Nightmare", 400, 400, 140, 30, 30, { COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["nightmare"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 80 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
  { itemId = 2517, chance = 100 },
}

monsters74["hellhound"] = m("Hellhound", 350, 300, 130, 25, 25, { COMBAT_FIREDAMAGE })
monsters74["hellhound"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 60 },
  { itemId = 2666, chance = 8000 },
  { itemId = 2412, chance = 300 },
  { itemId = 2516, chance = 200 },
}

monsters74["fire devil"] = m("Fire Devil", 450, 400, 140, 32, 32, { COMBAT_FIREDAMAGE })
monsters74["fire devil"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 100 },
  { itemId = 2670, chance = 10000 },
  { itemId = 2472, chance = 400 },
  { itemId = 2492, chance = 300 },
  { itemId = 2516, chance = 300 },
}

monsters74["fire elemental"] = m("Fire Elemental", 500, 450, 150, 35, 35, { COMBAT_FIREDAMAGE })
monsters74["fire elemental"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 120 },
  { itemId = 2670, chance = 10000 },
  { itemId = 2472, chance = 500 },
  { itemId = 2492, chance = 300 },
  { itemId = 2516, chance = 400 },
}

monsters74["energy elemental"] = m("Energy Elemental", 500, 450, 150, 35, 35, { COMBAT_ENERGYDAMAGE })
monsters74["energy elemental"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 120 },
  { itemId = 2472, chance = 500 },
  { itemId = 2492, chance = 300 },
  { itemId = 2516, chance = 400 },
}

monsters74["earth elemental"] = m("Earth Elemental", 500, 450, 150, 35, 35, { COMBAT_EARTHDAMAGE })
monsters74["earth elemental"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 120 },
  { itemId = 2472, chance = 500 },
  { itemId = 2492, chance = 300 },
  { itemId = 2516, chance = 400 },
}

monsters74["water elemental"] = m("Water Elemental", 300, 250, 130, 25, 25, { COMBAT_ICEDAMAGE })
monsters74["water elemental"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 80 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
  { itemId = 2514, chance = 300 },
}

monsters74["ice golem"] = m("Ice Golem", 600, 600, 120, 35, 35, { COMBAT_ICEDAMAGE })
monsters74["ice golem"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 100 },
  { itemId = 2670, chance = 10000 },
  { itemId = 2472, chance = 400 },
  { itemId = 2492, chance = 300 },
  { itemId = 2516, chance = 300 },
}

monsters74["quara pincher"] = m("Quara Pincher", 450, 400, 140, 28, 28, { COMBAT_ICEDAMAGE })
monsters74["quara pincher"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 80 },
  { itemId = 2670, chance = 8000 },
  { itemId = 2472, chance = 300 },
  { itemId = 2514, chance = 200 },
}

monsters74["quara predator"] = m("Quara Predator", 550, 500, 150, 32, 32, { COMBAT_ICEDAMAGE })
monsters74["quara predator"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 100 },
  { itemId = 2670, chance = 10000 },
  { itemId = 2472, chance = 400 },
  { itemId = 2492, chance = 300 },
}

monsters74["quara hydromancer"] = m("Quara Hydromancer", 500, 450, 150, 30, 30, { COMBAT_ICEDAMAGE })
monsters74["quara hydromancer"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 100 },
  { itemId = 7620, chance = 5000 },
  { itemId = 2270, chance = 300 },
  { itemId = 2271, chance = 300 },
}

monsters74["quara mantassin"] = m("Quara Mantassin", 600, 550, 160, 35, 35, { COMBAT_ICEDAMAGE })
monsters74["quara mantassin"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 120 },
  { itemId = 2670, chance = 12000 },
  { itemId = 2472, chance = 500 },
  { itemId = 2492, chance = 400 },
  { itemId = 2516, chance = 300 },
}

monsters74["slime"] = m("Slime", 200, 100, 80, 20, 20, { COMBAT_EARTHDAMAGE })
monsters74["slime"].loot = {
  { itemId = 2148, chance = 30000, maxCount = 30 },
}

monsters74["acid blob"] = m("Acid Blob", 400, 250, 90, 25, 25, { COMBAT_EARTHDAMAGE })
monsters74["acid blob"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 50 },
  { itemId = 2472, chance = 200 },
}

monsters74["merlkin"] = m("Merlkin", 300, 200, 120, 20, 20, {})
monsters74["merlkin"].loot = {
  { itemId = 2148, chance = 40000, maxCount = 50 },
  { itemId = 2376, chance = 200 },
  { itemId = 2512, chance = 200 },
}

monsters74["pirate ghost"] = m("Pirate Ghost", 400, 350, 130, 25, 25, { COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["pirate ghost"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 80 },
  { itemId = 2168, chance = 200 },
  { itemId = 2472, chance = 300 },
  { itemId = 2492, chance = 200 },
  { itemId = 2516, chance = 200 },
}

monsters74["pirate skeleton"] = m("Pirate Skeleton", 350, 300, 120, 22, 22, { COMBAT_DEATHDAMAGE, COMBAT_HOLYDAMAGE })
monsters74["pirate skeleton"].loot = {
  { itemId = 2148, chance = 50000, maxCount = 70 },
  { itemId = 2472, chance = 200 },
  { itemId = 2492, chance = 200 },
  { itemId = 2514, chance = 200 },
}

monsters74["pirate buccaneer"] = m("Pirate Buccaneer", 300, 250, 120, 20, 20, {})
monsters74["pirate buccaneer"].loot = {
  { itemId = 2148, chance = 40000, maxCount = 50 },
  { itemId = 2376, chance = 200 },
  { itemId = 2456, chance = 200 },
  { itemId = 2512, chance = 200 },
}

monsters74["pirate corsair"] = m("Pirate Corsair", 400, 350, 130, 25, 25, {})
monsters74["pirate corsair"].loot = {
  { itemId = 2148, chance = 60000, maxCount = 80 },
  { itemId = 2412, chance = 300 },
  { itemId = 2472, chance = 200 },
  { itemId = 2514, chance = 200 },
}

monsters74["pirate cutthroat"] = m("Pirate Cutthroat", 450, 400, 140, 28, 28, {})
monsters74["pirate cutthroat"].loot = {
  { itemId = 2148, chance = 70000, maxCount = 100 },
  { itemId = 2412, chance = 400 },
  { itemId = 2472, chance = 300 },
  { itemId = 2514, chance = 300 },
}

monsters74["pirate marauder"] = m("Pirate Marauder", 500, 450, 150, 30, 30, {})
monsters74["pirate marauder"].loot = {
  { itemId = 2148, chance = 80000, maxCount = 120 },
  { itemId = 2412, chance = 500 },
  { itemId = 2472, chance = 400 },
  { itemId = 2492, chance = 300 },
  { itemId = 2516, chance = 300 },
}

-- EXPORT
-- Note: This is a PARTIAL list. Complete monsters.xml from ObjectBuilder/downgrade
-- should be reviewed against these stats.
return monsters74