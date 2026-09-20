-- Tibia 7.4 — Items Data Reference
-- This file documents the 7.4 item list for adaptation
-- Source: Authentic Tibia 7.4 client (items.otb/items.xml from ObjectBuilder)
-- Use this as a CHECKLIST when generating items from 7.4 client

--[[
  7.4 ITEM CATEGORIES (from tibia.fandom.com/wiki/Items)
  
  Total items in 7.4: ~4,500
  
  Categories:
  - Weapons (swords, axes, clubs, distance, wands/rods NOT in 7.4)
  - Armor (helmets, armor, legs, boots, shields)
  - Amulets/Necklaces
  - Rings
  - Ammunition (arrows, bolts, etc.)
  - Potions (health, mana, spirit)
  - Runes (blank, spell runes)
  - Tools (rope, shovel, pick, fishing rod)
  - Food
  - Containers (backpacks, bags, boxes)
  - Keys
  - Decoration (furniture, trophies)
  - Quest items
  - Creature products (loot items)
  - Miscellaneous
--]]

local items74 = {}

--[[
  ITEM ID RANGES (approximate for 7.4):
  1-100:    Basic items, fluids, runes
  100-500:  Weapons, armor, shields
  500-1000: Tools, food, containers
  1000-2000: Amulets, rings, ammunition
  2000-3000: Potions, runes, creature products
  3000-4000: Decoration, furniture
  4000-5000: Quest items, special
  5000+:     Extended (some 7.4 items go higher)
--]]

-- KEY 7.4 ITEMS BY CATEGORY
-- Use items.xml from ObjectBuilder for complete list

items74.weapons = {
  -- SWORDS (7.4)
  [2376] = { name = "Sword", attack = 18, defense = 12, weight = 3500 },
  [2384] = { name = "Rapier", attack = 15, defense = 15, weight = 1500 },
  [2385] = { name = "Sabre", attack = 31, defense = 10, weight = 5500 },
  [2387] = { name = "Broad Sword", attack = 32, defense = 19, weight = 3600 },
  [2389] = { name = "Dragon Slayer", attack = 41, defense = 4, weight = 5000 },
  [2391] = { name = "Giant Sword", attack = 43, defense = 25, weight = 13600 },
  [2392] = { name = "Pharaoh Sword", attack = 40, defense = 23, weight = 9000 },
  [2393] = { name = "Serpent Sword", attack = 35, defense = 19, weight = 5300 },
  
  -- AXES (7.4)
  [2368] = { name = "Hatchet", attack = 19, defense = 10, weight = 2600 },
  [2387] = { name = "Double Axe", attack = 30, defense = 15, weight = 6500 },
  [2394] = { name = "War Axe", attack = 30, defense = 20, weight = 5300 },
  [2377] = { name = "Battle Axe", attack = 22, defense = 11, weight = 4600 },
  [2412] = { name = "Titan Axe", attack = 38, defense = 19, weight = 6900 },
  
  -- CLUBS (7.4)
  [2377] = { name = "Club", attack = 11, defense = 6, weight = 2900 },
  [2398] = { name = "Mace", attack = 23, defense = 15, weight = 4800 },
  [2399] = { name = "Morning Star", attack = 28, defense = 14, weight = 5500 },
  [2395] = { name = "War Hammer", attack = 30, defense = 17, weight = 10000 },
  [2400] = { name = "Stonecrusher", attack = 36, defense = 20, weight = 12000 },
  
  -- DISTANCE WEAPONS (7.4)
  [2456] = { name = "Bow", attack = 14, hitChance = 18, weight = 2500 },
  [2455] = { name = "Crossbow", attack = 20, hitChance = 16, weight = 2600 },
  [2457] = { name = "Composite Bow", attack = 20, hitChance = 20, weight = 2600 },
  
  -- AMMUNITION (7.4)
  [2544] = { name = "Arrow", attack = 7, weight = 20, count = 50 },
  [2543] = { name = "Bolt", attack = 16, weight = 20, count = 50 },
  [2546] = { name = "Sniper Arrow", attack = 25, weight = 20, count = 50 },
  [2547] = { name = "Power Bolt", attack = 35, weight = 20, count = 50 },
}

items74.armor = {
  -- HELMETS
  [2461] = { name = "Leather Helmet", defense = 3, weight = 1200 },
  [2458] = { name = "Iron Helmet", defense = 5, weight = 3200 },
  [2458] = { name = "Chain Helmet", defense = 4, weight = 2600 },
  [2482] = { name = "Studded Helmet", defense = 5, weight = 2500 },
  [2491] = { name = "Dragon Helmet", defense = 7, weight = 2800 },
  [2471] = { name = "Golden Helmet", defense = 6, weight = 2800 },
  [2490] = { name = "Draco Helmet", defense = 8, weight = 3000 },
  
  -- ARMOR
  [2467] = { name = "Leather Armor", defense = 4, weight = 3000 },
  [2468] = { name = "Studded Armor", defense = 5, weight = 3800 },
  [2463] = { name = "Plate Armor", defense = 9, weight = 4700 },
  [2492] = { name = "Dragon Scale Mail", defense = 9, weight = 4600 },
  [2472] = { name = "Magic Plate Armor", defense = 12, weight = 4600 },
  [2466] = { name = "Golden Armor", defense = 7, weight = 4600 },
  [2464] = { name = "Brass Armor", defense = 5, weight = 4400 },
  [2464] = { name = "Chain Armor", defense = 5, weight = 3400 },
  
  -- LEGS
  [2649] = { name = "Leather Legs", defense = 2, weight = 2000 },
  [2470] = { name = "Golden Legs", defense = 5, weight = 4400 },
  [2495] = { name = "Dragon Legs", defense = 6, weight = 4400 },
  
  -- BOOTS
  [2643] = { name = "Leather Boots", defense = 1, weight = 2000 },
  [2469] = { name = "Golden Boots", defense = 2, weight = 2800 },
  [2493] = { name = "Dragon Boots", defense = 2, weight = 3000 },
  
  -- SHIELDS
  [2512] = { name = "Wooden Shield", defense = 3, weight = 4000 },
  [2513] = { name = "Battle Shield", defense = 6, weight = 5500 },
  [2514] = { name = "Dragon Shield", defense = 10, weight = 6200 },
  [2515] = { name = "Mastermind Shield", defense = 10, weight = 5500 },
  [2516] = { name = "Guardian Shield", defense = 15, weight = 7800 },
  [2517] = { name = "Dread Shield", defense = 12, weight = 5500 },
  [2518] = { name = "Black Shield", defense = 9, weight = 5500 },
}

items74.amulets = {
  [2137] = { name = "Necklace", defense = 1, weight = 100 },
  [2200] = { name = "Dragon Necklace", defense = 2, weight = 100 },
  [2195] = { name = "Necklace of the Deep", defense = 2, weight = 100 }, -- Not in 7.4
  [2662] = { name = "Scarf", defense = 1, weight = 100 },
}

items74.rings = {
  [2168] = { name = "Ring", weight = 20 },
  [2204] = { name = "Stealth Ring", weight = 20 },
  [2167] = { name = "Power Ring", weight = 20 },
  [2166] = { name = "Energy Ring", weight = 20 },
  [2168] = { name = "Life Ring", weight = 20 },
  [2168] = { name = "Time Ring", weight = 20 },
}

items74.potions = {
  [7618] = { name = "Health Potion", health = 60, weight = 50 },
  [7620] = { name = "Mana Potion", mana = 100, weight = 50 },
  [7588] = { name = "Strong Health Potion", health = 100, weight = 50 },
  [7589] = { name = "Strong Mana Potion", mana = 200, weight = 50 },
  [7642] = { name = "Great Health Potion", health = 200, weight = 50 },
  [7643] = { name = "Great Mana Potion", mana = 400, weight = 50 },
  [8473] = { name = "Ultimate Health Potion", health = 400, weight = 50 },
  [8472] = { name = "Ultimate Mana Potion", mana = 800, weight = 50 },
  [8474] = { name = "Great Spirit Potion", health = 200, mana = 100, weight = 50 },
}

items74.runes = {
  [2260] = { name = "Blank Rune", charges = 1, weight = 50 },
  [2272] = { name = "Light Rune", spell = "utevo lux", charges = 1, weight = 50 },
  [2265] = { name = "Health Rune", spell = "exura", charges = 3, weight = 50 },
  [2274] = { name = "Mana Rune", spell = "utamo vita", charges = 3, weight = 50 },
  [2266] = { name = "Strong Health Rune", spell = "exura gran", charges = 3, weight = 50 },
  [2267] = { name = "Strong Mana Rune", spell = "utamo tempo", charges = 3, weight = 50 },
  [2268] = { name = "Sudden Death Rune", spell = "exori mort", charges = 3, weight = 50 },
  [2313] = { name = "Explosion Rune", spell = "adori gran flam", charges = 3, weight = 50 },
  [2272] = { name = "Ultimate Explosion Rune", spell = "adori gran flam", charges = 4, weight = 50 }, -- Different in 7.4
  [2269] = { name = "Heavy Magic Missile Rune", spell = "exori vis", charges = 3, weight = 50 },
  [2270] = { name = "Great Fireball Rune", spell = "adori gran flam", charges = 3, weight = 50 },
  [2271] = { name = "Holy Missile Rune", spell = "exori hur", charges = 3, weight = 50 },
  [2273] = { name = "Soulfire Rune", spell = "adori gran vis", charges = 3, weight = 50 },
  [2275] = { name = "Paralyze Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2276] = { name = "Thunderstorm Rune", spell = "adori gran vis", charges = 3, weight = 50 },
  [2277] = { name = "Stone Shower Rune", spell = "adori gran tera", charges = 3, weight = 50 },
  [2278] = { name = "Avalanche Rune", spell = "adori mas frigo", charges = 3, weight = 50 },
  [2279] = { name = "Icicle Rune", spell = "exori frigo", charges = 3, weight = 50 },
  [2280] = { name = "Poison Bomb Rune", spell = "exori tera", charges = 3, weight = 50 },
  [2281] = { name = "Magic Wall Rune", spell = "utamo vita", charges = 3, weight = 50 },
  [2282] = { name = "Wild Growth Rune", spell = "utamo vita", charges = 3, weight = 50 },
  [2283] = { name = "Destroy Field Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2284] = { name = "Energy Wall Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2285] = { name = "Energy Field Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2286] = { name = "Fire Wall Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2287] = { name = "Fire Field Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2288] = { name = "Poison Wall Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2289] = { name = "Poison Field Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2290] = { name = "Antidote Rune", spell = "utamo tempo san", charges = 3, weight = 50 },
  [2291] = { name = "Intense Healing Rune", spell = "exura vita", charges = 3, weight = 50 },
  [2292] = { name = "Ultimate Healing Rune", spell = "exura vita", charges = 3, weight = 50 },
  [2293] = { name = "Convince Creature Rune", spell = "utamo vita", charges = 1, weight = 50 },
  [2294] = { name = "Chameleon Rune", spell = "utana vid", charges = 1, weight = 50 },
}

items74.tools = {
  [2120] = { name = "Rope", weight = 350 },
  [2554] = { name = "Shovel", weight = 3500 },
  [2553] = { name = "Pick", weight = 3500 },
  [2580] = { name = "Fishing Rod", weight = 3500 },
  [2580] = { name = "Worm", weight = 10 },
}

items74.food = {
  [2690] = { name = "Brown Bread", nutrition = 300 },
  [2696] = { name = "Cheese", nutrition = 200 },
  [2671] = { name = "Ham", nutrition = 300 },
  [2666] = { name = "Meat", nutrition = 500 },
  [2670] = { name = "Dragon Ham", nutrition = 600 },
  [2693] = { name = "Roll", nutrition = 100 },
  [2689] = { name = "White Bread", nutrition = 200 },
  [2667] = { name = "Apple", nutrition = 50 },
  [2673] = { name = "Banana", nutrition = 50 },
  [2674] = { name = "Orange", nutrition = 50 },
  [2675] = { name = "Melon", nutrition = 200 },
  [2676] = { name = "Cheese", nutrition = 200 },
  [2677] = { name = "Carrot", nutrition = 50 },
  [2678] = { name = "Cookie", nutrition = 100 },
  [2679] = { name = "Bread", nutrition = 100 },
  [2680] = { name = "Banana", nutrition = 50 },
  [2681] = { name = "Pear", nutrition = 50 },
  [2682] = { name = "Coconut", nutrition = 200 },
  [2683] = { name = "Pumpkin", nutrition = 200 },
  [2684] = { name = "Carrot", nutrition = 50 },
  [2685] = { name = "Tomato", nutrition = 50 },
  [2686] = { name = "Grapes", nutrition = 100 },
  [2687] = { name = "Mango", nutrition = 100 },
  [2688] = { name = "Sandwich", nutrition = 200 },
  [2690] = { name = "Brown Bread", nutrition = 300 },
  [2691] = { name = "Red Tomato", nutrition = 50 },
  [2692] = { name = "Yellow Tomato", nutrition = 50 },
  [2693] = { name = "Roll", nutrition = 100 },
  [2694] = { name = "Bun", nutrition = 100 },
  [2695] = { name = "Ham", nutrition = 300 },
  [2696] = { name = "Cheese", nutrition = 200 },
  [2697] = { name = "Cake", nutrition = 400 },
  [2698] = { name = "Cookie", nutrition = 100 },
  [2699] = { name = "Green Apple", nutrition = 50 },
}

items74.containers = {
  [1987] = { name = "Backpack", capacity = 20, weight = 400 },
  [1988] = { name = "Bag", capacity = 8, weight = 100 },
  [1989] = { name = "Crate", capacity = 10, weight = 300 },
  [1990] = { name = "Chest", capacity = 20, weight = 2000 },
  [1991] = { name = "Barrel", capacity = 10, weight = 200 },
  [1992] = { name = "Box", capacity = 10, weight = 200 },
  [1993] = { name = "Locker", capacity = 20, weight = 2000 },
  [1994] = { name = "Present", capacity = 1, weight = 100 },
  [1995] = { name = "Parcel", capacity = 10, weight = 100 },
  [1996] = { name = "Letter", capacity = 1, weight = 10 },
  [1997] = { name = "Label", capacity = 1, weight = 1 },
  [1998] = { name = "Magic Box", capacity = 20, weight = 1000 },
  [1999] = { name = "Backpack of Holding", capacity = 20, weight = 400 }, -- Not in 7.4
  [2000] = { name = "Grey Backpack", capacity = 20, weight = 400 },
  [2001] = { name = "Red Backpack", capacity = 20, weight = 400 },
  [2002] = { name = "Yellow Backpack", capacity = 20, weight = 400 },
  [2003] = { name = "Blue Backpack", capacity = 20, weight = 400 },
  [2004] = { name = "Green Backpack", capacity = 20, weight = 400 },
  [2005] = { name = "Purple Backpack", capacity = 20, weight = 400 },
  [2006] = { name = "Orange Backpack", capacity = 20, weight = 400 },
  [2007] = { name = "White Backpack", capacity = 20, weight = 400 },
  [2008] = { name = "Camouflage Backpack", capacity = 20, weight = 400 },
  [2009] = { name = "Beach Backpack", capacity = 20, weight = 400 },
}

items74.coins = {
  [2148] = { name = "Gold Coin", value = 1, weight = 1, count = 100 },
  [2152] = { name = "Platinum Coin", value = 100, weight = 1, count = 100 },
  [2160] = { name = "Crystal Coin", value = 10000, weight = 1, count = 100 },
}

items74.keys = {
  -- Range 2011-2030 for standard keys
  [2011] = { name = "Key 2011", weight = 10 },
  [2012] = { name = "Key 2012", weight = 10 },
  [2013] = { name = "Key 2013", weight = 10 },
  [2014] = { name = "Key 2014", weight = 10 },
  [2015] = { name = "Key 2015", weight = 10 },
  [2016] = { name = "Key 2016", weight = 10 },
  [2017] = { name = "Key 2017", weight = 10 },
  [2018] = { name = "Key 2018", weight = 10 },
  [2019] = { name = "Key 2019", weight = 10 },
  [2020] = { name = "Key 2020", weight = 10 },
  [2021] = { name = "Key 2021", weight = 10 },
  [2022] = { name = "Key 2022", weight = 10 },
  [2023] = { name = "Key 2023", weight = 10 },
  [2024] = { name = "Key 2024", weight = 10 },
  [2025] = { name = "Key 2025", weight = 10 },
  [2026] = { name = "Key 2026", weight = 10 },
  [2027] = { name = "Key 2027", weight = 10 },
  [2028] = { name = "Key 2028", weight = 10 },
  [2029] = { name = "Key 2029", weight = 10 },
  [2030] = { name = "Key 2030", weight = 10 },
}

-- CREATURE PRODUCTS (common loot)
items74.creatureProducts = {
  [5875] = { name = "Wolf Paw", weight = 250 },
  [5876] = { name = "Deer Antlers", weight = 150 },
  [5877] = { name = "Flask of Warrior's Sweat", weight = 100 },
  [5878] = { name = "Frosty Heart", weight = 110 },
  [5879] = { name = "Snake Skin", weight = 50 },
  [5880] = { name = "Turtle Shell", weight = 4000 },
  [5881] = { name = "Lizard Tail", weight = 160 },
  [5882] = { name = "Bat Wing", weight = 40 },
  [5883] = { name = "Gargoyle Ear", weight = 200 },
  [5884] = { name = "Pig Foot", weight = 130 },
  [5885] = { name = "Cow Fur", weight = 200 },
  [5886] = { name = "Sheep Fleece", weight = 100 },
  [5887] = { name = "Penguin Feather", weight = 10 },
  [5888] = { name = "Lion Fur", weight = 250 },
  [5889] = { name = "Tiger Fur", weight = 250 },
  [5890] = { name = "Dragon Scale", weight = 100 },
  [5891] = { name = "Dragon Blood", weight = 50 },
  [5892] = { name = "Demon Horn", weight = 250 },
  [5893] = { name = "Demon Dust", weight = 50 },
  [5894] = { name = "Scorpion Tail", weight = 100 },
  [5895] = { name = "Ancient Scarab Shell", weight = 500 },
  [5896] = { name = "Wyrm Scale", weight = 200 },
  [5897] = { name = "Hydra Head", weight = 1000 },
  [5898] = { name = "Behemoth Fang", weight = 500 },
}

-- DECORATION / FURNITURE (partial)
items74.decoration = {
  [2126] = { name = "Table", weight = 10000 },
  [2127] = { name = "Chair", weight = 5000 },
  [2128] = { name = "Bed", weight = 20000 },
  [2129] = { name = "Wardrobe", weight = 20000 },
  [2130] = { name = "Bookcase", weight = 20000 },
  [2131] = { name = "Fireplace", weight = 10000 },
  [2132] = { name = "Stove", weight = 10000 },
  [2133] = { name = "Oven", weight = 10000 },
  [2134] = { name = "Sink", weight = 10000 },
  [2135] = { name = "Toilet", weight = 10000 },
  [2136] = { name = "Mirror", weight = 5000 },
}

-- QUEST ITEMS (partial)
items74.questItems = {
  [2140] = { name = "Ankh", weight = 50 },
  [2141] = { name = "Scarab Coin", weight = 50 },
  [2142] = { name = "Beetle Member", weight = 50 },
  [2143] = { name = "Maggot", weight = 10 },
  [2144] = { name = "Pincer", weight = 50 },
  [2145] = { name = "Worm", weight = 10 },
}

-- Export
return items74