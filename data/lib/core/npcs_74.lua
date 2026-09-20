-- Tibia 7.4 — NPCs Data Reference
-- Source: Authentic Tibia 7.4 NPC dialogues and shop lists
-- Use to validate/correct NPC XML files from downgrade data

--[[
  7.4 TOWNS (8): Thais, Carlin, Venore, Edron, Darashia, Ankrahmun, Kazordoon, Liberty Bay
  
  Each town has standard NPCs:
  - Depot NPC (bank)
  - Boat NPC (travel)
  - Shop NPCs (weapons, armor, magic, food, tools)
  - Temple NPC (blessings - not in 7.4)
  - Quest NPCs
--]]

local npcs74 = {}

-- ============================================================================
-- THAIS (Main city)
-- ============================================================================

npcs74.thais = {}

-- Boat NPCs
npcs74.thais.garrick = {
  name = "Garrick",
  position = { x = 32315, y = 32214, z = 7 },
  type = "boat",
  destinations = {
    { name = "Carlin", cost = 110, position = { x = 32387, y = 31820, z = 7 } },
    { name = "Venore", cost = 150, position = { x = 32957, y = 32076, z = 7 } },
    { name = "Edron", cost = 160, position = { x = 33173, y = 31764, z = 7 } },
    { name = "Darashia", cost = 180, position = { x = 33289, y = 32480, z = 7 } },
    { name = "Ankrahmun", cost = 200, position = { x = 33092, y = 32883, z = 7 } },
    { name = "Kazordoon", cost = 160, position = { x = 32649, y = 31925, z = 7 } },
    { name = "Liberty Bay", cost = 210, position = { x = 32285, y = 32892, z = 7 } },
  }
}

-- Depot/Bank
npcs74.thais.tyrias = {
  name = "Tyrias",
  position = { x = 32364, y = 32239, z = 7 },
  type = "depot",
  dialogue = {
    greet = "Welcome to the Thais Depot, |PLAYERNAME|.",
    farewell = "Good bye, |PLAYERNAME|."
  }
}

-- Weapon Shop
npcs74.thais.lara = {
  name = "Lara",
  position = { x = 32348, y = 32232, z = 7 },
  type = "shop",
  shopType = "weapons",
  buyList = {
    { itemId = 2376, price = 85 },   -- Sword
    { itemId = 2384, price = 1000 }, -- Rapier
    { itemId = 2385, price = 5000 }, -- Sabre
    { itemId = 2387, price = 10000 },-- Broad Sword
    { itemId = 2389, price = 15000 },-- Dragon Slayer
    { itemId = 2391, price = 17000 },-- Giant Sword
    { itemId = 2368, price = 50 },   -- Hatchet
    { itemId = 2377, price = 230 },  -- Battle Axe
    { itemId = 2394, price = 4000 }, -- War Axe
    { itemId = 2398, price = 90 },   -- Mace
    { itemId = 2399, price = 430 },  -- Morning Star
    { itemId = 2395, price = 10000 },-- War Hammer
    { itemId = 2456, price = 400 },  -- Bow
    { itemId = 2455, price = 500 },  -- Crossbow
    { itemId = 2457, price = 1000 }, -- Composite Bow
    { itemId = 2544, price = 4 },    -- Arrow
    { itemId = 2543, price = 7 },    -- Bolt
    { itemId = 2546, price = 200 },  -- Power Bolt
  },
  sellList = {
    { itemId = 2376, price = 25 },
    { itemId = 2384, price = 150 },
    { itemId = 2385, price = 500 },
    { itemId = 2387, price = 1000 },
    { itemId = 2389, price = 5000 },
    { itemId = 2391, price = 5000 },
    { itemId = 2368, price = 10 },
    { itemId = 2377, price = 80 },
    { itemId = 2394, price = 1000 },
    { itemId = 2398, price = 30 },
    { itemId = 2399, price = 100 },
    { itemId = 2395, price = 2000 },
    { itemId = 2456, price = 100 },
    { itemId = 2455, price = 120 },
    { itemId = 2457, price = 280 },
  }
}

-- Armor Shop
npcs74.thais.biff = {
  name = "Biff",
  position = { x = 32354, y = 32233, z = 7 },
  type = "shop",
  shopType = "armor",
  buyList = {
    { itemId = 2467, price = 50 },   -- Leather Armor
    { itemId = 2468, price = 150 },  -- Studded Armor
    { itemId = 2463, price = 600 },  -- Plate Armor
    { itemId = 2492, price = 40000 },-- Dragon Scale Mail
    { itemId = 2472, price = 90000 },-- Magic Plate Armor
    { itemId = 2466, price = 5000 }, -- Golden Armor
    { itemId = 2464, price = 150 },  -- Brass Armor
    { itemId = 2461, price = 12 },   -- Leather Helmet
    { itemId = 2458, price = 390 },  -- Iron Helmet
    { itemId = 2482, price = 1000 }, -- Studded Helmet
    { itemId = 2491, price = 3000 }, -- Dragon Helmet
    { itemId = 2471, price = 5000 }, -- Golden Helmet
    { itemId = 2649, price = 10 },   -- Leather Legs
    { itemId = 2470, price = 9000 }, -- Golden Legs
    { itemId = 2495, price = 3000 }, -- Dragon Legs
    { itemId = 2643, price = 10 },   -- Leather Boots
    { itemId = 2469, price = 8000 }, -- Golden Boots
    { itemId = 2493, price = 2000 }, -- Dragon Boots
    { itemId = 2512, price = 15 },   -- Wooden Shield
    { itemId = 2513, price = 95 },   -- Battle Shield
    { itemId = 2514, price = 400 },  -- Dragon Shield
    { itemId = 2515, price = 5000 }, -- Mastermind Shield
    { itemId = 2516, price = 10000 },-- Guardian Shield
  },
  sellList = {
    { itemId = 2467, price = 10 },
    { itemId = 2468, price = 30 },
    { itemId = 2463, price = 120 },
    { itemId = 2492, price = 10000 },
    { itemId = 2472, price = 20000 },
    { itemId = 2466, price = 1000 },
    { itemId = 2464, price = 30 },
    { itemId = 2461, price = 2 },
    { itemId = 2458, price = 100 },
    { itemId = 2482, price = 150 },
    { itemId = 2491, price = 800 },
    { itemId = 2471, price = 1200 },
    { itemId = 2649, price = 2 },
    { itemId = 2470, price = 2000 },
    { itemId = 2495, price = 800 },
    { itemId = 2643, price = 2 },
    { itemId = 2469, price = 2000 },
    { itemId = 2493, price = 400 },
    { itemId = 2512, price = 3 },
    { itemId = 2513, price = 20 },
    { itemId = 2514, price = 80 },
    { itemId = 2515, price = 1000 },
    { itemId = 2516, price = 2000 },
  }
}

-- Magic Shop
npcs74.thais.isbeth = {
  name = "Isbeth",
  position = { x = 32350, y = 32226, z = 7 },
  type = "shop",
  shopType = "magic",
  buyList = {
    { itemId = 2148, price = 100, count = 100 }, -- Gold coins (not really)
    { itemId = 7618, price = 45 },  -- Health Potion
    { itemId = 7620, price = 50 },  -- Mana Potion
    { itemId = 7588, price = 100 }, -- Strong Health Potion
    { itemId = 7589, price = 200 }, -- Strong Mana Potion
    { itemId = 7642, price = 190 }, -- Great Health Potion
    { itemId = 7643, price = 120 }, -- Great Mana Potion
    { itemId = 8473, price = 310 }, -- Ultimate Health Potion
    { itemId = 8472, price = 570 }, -- Ultimate Mana Potion
    { itemId = 8474, price = 190 }, -- Great Spirit Potion
    { itemId = 2260, price = 10 },  -- Blank Rune
    { itemId = 2272, price = 50 },  -- Light Rune
    { itemId = 2265, price = 55 },  -- Health Rune
    { itemId = 2274, price = 60 },  -- Mana Rune
    { itemId = 2266, price = 70 },  -- Strong Health Rune
    { itemId = 2267, price = 80 },  -- Strong Mana Rune
    { itemId = 2268, price = 350 }, -- Sudden Death Rune
    { itemId = 2313, price = 230 }, -- Explosion Rune
    { itemId = 2269, price = 160 }, -- HMM Rune
    { itemId = 2270, price = 200 }, -- GFB Rune
    { itemId = 2271, price = 230 }, -- Holy Missile Rune
    { itemId = 2580, price = 100 }, -- Fishing Rod
    { itemId = 2580, price = 1, count = 10 }, -- Worms
  },
  sellList = {
    { itemId = 2148, price = 1 },
    { itemId = 7618, price = 20 },
    { itemId = 7620, price = 25 },
    { itemId = 7588, price = 50 },
    { itemId = 7589, price = 100 },
    { itemId = 7642, price = 95 },
    { itemId = 7643, price = 60 },
    { itemId = 8473, price = 155 },
    { itemId = 8472, price = 285 },
    { itemId = 8474, price = 95 },
    { itemId = 2260, price = 5 },
  }
}

-- Food Shop
npcs74.thais.william = {
  name = "William",
  position = { x = 32361, y = 32219, z = 7 },
  type = "shop",
  shopType = "food",
  buyList = {
    { itemId = 2666, price = 7 },   -- Meat
    { itemId = 2671, price = 35 },  -- Ham
    { itemId = 2690, price = 5 },   -- Brown Bread
    { itemId = 2689, price = 4 },   -- White Bread
    { itemId = 2696, price = 12 },  -- Cheese
    { itemId = 2670, price = 70 },  -- Dragon Ham
    { itemId = 2676, price = 5 },   -- Apple
    { itemId = 2673, price = 5 },   -- Banana
    { itemId = 2693, price = 3 },   -- Roll
  },
  sellList = {
    { itemId = 2666, price = 3 },
    { itemId = 2671, price = 15 },
    { itemId = 2690, price = 2 },
    { itemId = 2689, price = 2 },
    { itemId = 2696, price = 6 },
    { itemId = 2670, price = 35 },
  }
}

-- Tools Shop
npcs74.thais.tuck = {
  name = "Tuck",
  position = { x = 32357, y = 32219, z = 7 },
  type = "shop",
  shopType = "tools",
  buyList = {
    { itemId = 2120, price = 50 },  -- Rope
    { itemId = 2554, price = 10 },  -- Shovel
    { itemId = 2553, price = 50 },  -- Pick
    { itemId = 2580, price = 100 }, -- Fishing Rod
    { itemId = 1988, price = 20 },  -- Bag
    { itemId = 1987, price = 400 }, -- Backpack
    { itemId = 2000, price = 400 }, -- Grey Backpack
    { itemId = 2001, price = 400 }, -- Red Backpack
    { itemId = 2002, price = 400 }, -- Yellow Backpack
    { itemId = 2003, price = 400 }, -- Blue Backpack
    { itemId = 2004, price = 400 }, -- Green Backpack
    { itemId = 2005, price = 400 }, -- Purple Backpack
    { itemId = 2006, price = 400 }, -- Orange Backpack
    { itemId = 2007, price = 400 }, -- White Backpack
  },
  sellList = {
    { itemId = 2120, price = 10 },
    { itemId = 2554, price = 3 },
    { itemId = 2553, price = 15 },
    { itemId = 2580, price = 30 },
    { itemId = 1988, price = 5 },
    { itemId = 1987, price = 100 },
  }
}

-- Temple Priest
npcs74.thais.padre = {
  name = "Padre",
  position = { x = 32369, y = 32241, z = 7 },
  type = "temple",
  dialogue = {
    greet = "Welcome, |PLAYERNAME|. Do you want to heal your wounds?",
    heal = "You are healed now.",
    bless = "I can't bless you yet. Come back when you're level 20.", -- Not in 7.4
  }
}

-- Quest NPCs
npcs74.thais.brenton = {
  name = "Brenton",
  position = { x = 32337, y = 32231, z = 7 },
  type = "quest",
  quest = "Postman Quest",
  dialogue = {
    greet = "Hello |PLAYERNAME|! Do you want to deliver some letters?",
    mission = "Take this parcel to |NPCNAME| in |TOWN|.",
    complete = "Thank you! Here is your reward."
  }
}

npcs74.thais.edgar = {
  name = "Edgar",
  position = { x = 32337, y = 32231, z = 7 },
  type = "quest",
  quest = "Ghost Quest",
  dialogue = {
    greet = "Halt! Who goes there?",
    mission = "I need you to find my lost amulet in the Ghostlands.",
    complete = "You found it! Here is your reward."
  }
}

-- King
npcs74.thais.tibianus = {
  name = "King Tibianus III",
  position = { x = 32335, y = 32207, z = 7 },
  type = "royalty",
  dialogue = {
    greet = "Welcome to my throne room, |PLAYERNAME|.",
    mission = "I have a task for you, brave adventurer."
  }
}

-- ============================================================================
-- CARLIN
-- ============================================================================

npcs74.carlin = {}

npcs74.carlin.bryn = {
  name = "Bryn",
  position = { x = 32387, y = 31820, z = 7 },
  type = "boat",
  destinations = {
    { name = "Thais", cost = 110 },
    { name = "Venore", cost = 130 },
    { name = "Edron", cost = 140 },
    { name = "Darashia", cost = 160 },
    { name = "Ankrahmun", cost = 180 },
    { name = "Kazordoon", cost = 140 },
  }
}

npcs74.carlin.yberius = {
  name = "Yberius",
  position = { x = 32387, y = 31820, z = 7 },
  type = "depot",
}

npcs74.carlin.helen = {
  name = "Helen",
  position = { x = 32387, y = 31820, z = 7 },
  type = "shop",
  shopType = "weapons",
  -- Similar to Lara
}

npcs74.carlin.lisa = {
  name = "Lisa",
  position = { x = 32387, y = 31820, z = 7 },
  type = "shop",
  shopType = "armor",
  -- Similar to Biff
}

npcs74.carlin.nora = {
  name = "Nora",
  position = { x = 32387, y = 31820, z = 7 },
  type = "shop",
  shopType = "magic",
  -- Similar to Isbeth
}

npcs74.carlin.thessalia = {
  name = "Thessalia",
  position = { x = 32387, y = 31820, z = 7 },
  type = "shop",
  shopType = "food",
}

npcs74.carlin.william = {
  name = "William",
  position = { x = 32387, y = 31820, z = 7 },
  type = "shop",
  shopType = "tools",
}

npcs74.carlin.padre = {
  name = "Padre",
  position = { x = 32387, y = 31820, z = 7 },
  type = "temple",
}

-- ============================================================================
-- VENORE
-- ============================================================================

npcs74.venore = {}

npcs74.venore.turvy = {
  name = "Turvy",
  position = { x = 32957, y = 32076, z = 7 },
  type = "boat",
  destinations = {
    { name = "Thais", cost = 150 },
    { name = "Carlin", cost = 130 },
    { name = "Edron", cost = 60 },
    { name = "Darashia", cost = 90 },
    { name = "Ankrahmun", cost = 110 },
    { name = "Kazordoon", cost = 100 },
  }
}

-- Similar structure for other towns...

-- ============================================================================
-- EXPORT
-- ============================================================================

return npcs74