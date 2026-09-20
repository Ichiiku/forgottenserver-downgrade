-- Tibia 7.4 — Quests Data Reference
-- Source: Authentic Tibia 7.4 quests from community research
-- Use to validate/correct quest scripts from downgrade data

--[[
  7.4 QUESTS (from tibia.fandom.com/wiki/Quests)
  
  Main Quests:
  1. Demon Oak Quest (Ankrahmun)
  2. Ghost Quest (Thais)
  3. Postman Quest (Thais/Carlin/Venore)
  4. Demon Helmet Quest (Thais)
  5. Pits of Inferno Quest (Darashia)
  6. Isle of the Kings Quest (Liberty Bay)
  7. Dream Courts Quest (Edron) - NOT in 7.4 (added later)
  8. Inquisition Quest (Edron) - NOT in 7.4
  9. Worm God Quest (Kazordoon) - NOT in 7.4
  10. Ferumbras Quest (Thais) - Semi-implemented
  
  Mini Quests:
  - Demon Helmet
  - Demon Legs
  - Fire Sword (NOT in 7.4)
  - Ice Rapier (NOT in 7.4)
  - Energy Ring
  - Life Ring
  - Time Ring
  - Stealth Ring
  - Might Ring
  - Silver Amulet
  - Golden Amulet
  - Dragon Necklace
  - Necklace of the Deep (NOT in 7.4)
--]]

local quests74 = {}

-- ============================================================================
-- QUEST STORAGE KEYS
-- ============================================================================

quests74.storage = {
  -- Postman Quest
  postman_mission = 200,
  postman_delivered = 201,
  postman_reward = 202,
  
  -- Ghost Quest
  ghost_mission = 210,
  ghost_amulet = 211,
  ghost_reward = 212,
  
  -- Demon Oak Quest
  demonoak_mission = 220,
  demonoak_progress = 221,
  demonoak_reward = 222,
  
  -- Demon Helmet Quest
  demonhelmet_mission = 230,
  demonhelmet_lion = 231,
  demonhelmet_dragon = 232,
  demonhelmet_demon = 233,
  demonhelmet_reward = 234,
  
  -- Demon Legs Quest
  demonlegs_part1 = 240,
  demonlegs_part2 = 241,
  demonlegs_part3 = 242,
  demonlegs_reward = 243,
  
  -- Pits of Inferno
  inferno_mission = 250,
  inferno_progress = 251,
  inferno_reward = 252,
  
  -- Isle of the Kings
  kings_mission = 260,
  kings_king1 = 261,
  kings_king2 = 262,
  kings_king3 = 263,
  kings_reward = 264,
  
  -- Energy Ring Quest
  energyring_mission = 270,
  energyring_reward = 271,
  
  -- Life Ring Quest
  lifering_mission = 280,
  lifering_reward = 281,
  
  -- Time Ring Quest
  timerings_mission = 290,
  timerings_reward = 291,
  
  -- Stealth Ring Quest
  stealthring_mission = 300,
  stealthring_reward = 301,
  
  -- Silver Amulet Quest
  silveramulet_mission = 310,
  silveramulet_reward = 311,
  
  -- Golden Amulet Quest
  goldenamulet_mission = 320,
  goldenamulet_reward = 321,
  
  -- Dragon Necklace Quest
  dragonnecklace_mission = 330,
  dragonnecklace_reward = 331,
}

-- ============================================================================
-- POSTMAN QUEST
-- ============================================================================

quests74.postman = {
  name = "Postman Quest",
  minLevel = 1,
  startNpc = "Brenton",
  startPosition = { x = 32337, y = 32231, z = 7 }, -- Thais
  description = "Deliver letters between cities.",
  missions = {
    {
      id = 1,
      from = "Brenton",
      fromTown = "Thais",
      to = "Tom",
      toTown = "Carlin",
      item = 2598, -- Parcel
      reward = { itemId = 2148, count = 200 }, -- 200 gp
      storage = 200
    },
    {
      id = 2,
      from = "Tom",
      fromTown = "Carlin",
      to = "Liza",
      toTown = "Venore",
      item = 2598,
      reward = { itemId = 2148, count = 200 },
      storage = 201
    },
    {
      id = 3,
      from = "Liza",
      fromTown = "Venore",
      to = "Brenton",
      toTown = "Thais",
      item = 2598,
      reward = { itemId = 2160, count = 1 }, -- Crystal Coin
      storage = 202
    }
  }
}

-- ============================================================================
-- GHOST QUEST
-- ============================================================================

quests74.ghost = {
  name = "Ghost Quest",
  minLevel = 8,
  startNpc = "Edgar",
  startPosition = { x = 32337, y = 32231, z = 7 }, -- Thais
  description = "Find Edgar's lost amulet in the Ghostlands.",
  missions = {
    {
      id = 1,
      npc = "Edgar",
      task = "Go to the Ghostlands (north of Thais) and find my amulet.",
      requiredItem = 2168, -- Life Ring (actually a special amulet)
      reward = { itemId = 2148, count = 5000 }, -- 5000 gp
      storage = 210
    }
  }
}

-- ============================================================================
-- DEMON OAK QUEST (Ankrahmun)
-- ============================================================================

quests74.demonoak = {
  name = "Demon Oak Quest",
  minLevel = 50,
  startNpc = "Grott",
  startPosition = { x = 33092, y = 32883, z = 7 }, -- Ankrahmun
  description = "Defeat the Demon Oak in the caves below Ankrahmun.",
  missions = {
    {
      id = 1,
      npc = "Grott",
      task = "Enter the Demon Oak cave and defeat the Oak.",
      bosses = { "Demon Oak", "Demon", "Demon" },
      reward = { itemId = 2160, count = 3 }, -- 3 Crystal Coins
      storage = 220
    }
  }
}

-- ============================================================================
-- DEMON HELMET QUEST
-- ============================================================================

quests74.demonhelmet = {
  name = "Demon Helmet Quest",
  minLevel = 80,
  startNpc = "Gnomally",
  startPosition = { x = 32335, y = 32207, z = 7 }, -- Thais (castle)
  description = "Collect parts to forge a Demon Helmet.",
  missions = {
    {
      id = 1,
      npc = "Gnomally",
      task = "Bring me a Lion's Mane, a Dragon Scale, and a Demon Horn.",
      requiredItems = {
        { itemId = 5888, count = 1 }, -- Lion Fur
        { itemId = 5890, count = 1 }, -- Dragon Scale
        { itemId = 5892, count = 1 }, -- Demon Horn
      },
      reward = { itemId = 2490, count = 1 }, -- Draco Helmet (Demon Helmet in 7.4)
      storage = 230
    }
  }
}

-- ============================================================================
-- DEMON LEGS QUEST
-- ============================================================================

quests74.demonlegs = {
  name = "Demon Legs Quest",
  minLevel = 60,
  startNpc = "Rashid",
  startPosition = { x = 33289, y = 32480, z = 7 }, -- Darashia
  description = "Collect materials for Demon Legs.",
  missions = {
    {
      id = 1,
      npc = "Rashid",
      task = "Find the three pieces of the demon legs.",
      requiredItems = {
        { itemId = 5898, count = 1 }, -- Behemoth Fang
        { itemId = 5897, count = 1 }, -- Hydra Head
        { itemId = 5892, count = 1 }, -- Demon Horn
      },
      reward = { itemId = 2495, count = 1 }, -- Dragon Legs (Demon Legs in 7.4)
      storage = 240
    }
  }
}

-- ============================================================================
-- PITS OF INFERNO QUEST (Darashia)
-- ============================================================================

quests74.inferno = {
  name = "Pits of Inferno Quest",
  minLevel = 60,
  startNpc = "Rashid",
  startPosition = { x = 33289, y = 32480, z = 7 }, -- Darashia
  description = "Navigate the Pits of Inferno and defeat the final boss.",
  missions = {
    {
      id = 1,
      npc = "Rashid",
      task = "Enter the Pits of Inferno and retrieve the ancient artifact.",
      bosses = { "Demon", "Demon", "Demon Lord" },
      reward = { itemId = 2160, count = 5 }, -- 5 Crystal Coins
      storage = 250
    }
  }
}

-- ============================================================================
-- ISLE OF THE KINGS QUEST (Liberty Bay)
-- ============================================================================

quests74.kings = {
  name = "Isle of the Kings Quest",
  minLevel = 80,
  startNpc = "King Tibianus III",
  startPosition = { x = 32335, y = 32207, z = 7 }, -- Thais Castle
  description = "Find the three ancient kings on the Isle of the Kings.",
  missions = {
    {
      id = 1,
      npc = "King Tibianus III",
      task = "Travel to Liberty Bay and find the Isle of the Kings.",
      subMissions = {
        { king = "King Dago", position = { x = 32285, y = 32892, z = 7 } },
        { king = "King Roderick", position = { x = 32285, y = 32892, z = 7 } },
        { king = "King Nibelor", position = { x = 32285, y = 32892, z = 7 } },
      },
      reward = { itemId = 2160, count = 10 }, -- 10 Crystal Coins
      storage = 260
    }
  }
}

-- ============================================================================
-- RING QUESTS
-- ============================================================================

quests74.energyring = {
  name = "Energy Ring Quest",
  minLevel = 10,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 }, -- Thais Magic Shop
  description = "Bring 5 Energy Rings to create a new one.",
  missions = {
    {
      id = 1,
      requiredItems = { { itemId = 2166, count = 5 } }, -- Energy Ring
      reward = { itemId = 2166, count = 1 }, -- Energy Ring (charged)
      storage = 270
    }
  }
}

quests74.lifering = {
  name = "Life Ring Quest",
  minLevel = 10,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 },
  description = "Bring 5 Life Rings to create a new one.",
  missions = {
    {
      id = 1,
      requiredItems = { { itemId = 2168, count = 5 } },
      reward = { itemId = 2168, count = 1 },
      storage = 280
    }
  }
}

quests74.timerings = {
  name = "Time Ring Quest",
  minLevel = 20,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 },
  description = "Bring 5 Time Rings to create a new one.",
  missions = {
    {
      id = 1,
      requiredItems = { { itemId = 2168, count = 5 } }, -- Time Ring uses Life Ring ID
      reward = { itemId = 2168, count = 1 },
      storage = 290
    }
  }
}

quests74.stealthring = {
  name = "Stealth Ring Quest",
  minLevel = 20,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 },
  description = "Bring 5 Stealth Rings to create a new one.",
  missions = {
    {
      id = 1,
      requiredItems = { { itemId = 2204, count = 5 } },
      reward = { itemId = 2204, count = 1 },
      storage = 300
    }
  }
}

-- ============================================================================
-- AMULET QUESTS
-- ============================================================================

quests74.silveramulet = {
  name = "Silver Amulet Quest",
  minLevel = 20,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 },
  description = "Bring materials to craft a Silver Amulet.",
  missions = {
    {
      id = 1,
      requiredItems = {
        { itemId = 2137, count = 1 }, -- Necklace
        { itemId = 2168, count = 3 }, -- Life Ring
      },
      reward = { itemId = 2137, count = 1 }, -- Silver Amulet (modified necklace)
      storage = 310
    }
  }
}

quests74.goldenamulet = {
  name = "Golden Amulet Quest",
  minLevel = 30,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 },
  description = "Bring materials to craft a Golden Amulet.",
  missions = {
    {
      id = 1,
      requiredItems = {
        { itemId = 2137, count = 1 }, -- Necklace
        { itemId = 2167, count = 3 }, -- Power Ring
      },
      reward = { itemId = 2137, count = 1 }, -- Golden Amulet
      storage = 320
    }
  }
}

quests74.dragonnecklace = {
  name = "Dragon Necklace Quest",
  minLevel = 40,
  startNpc = "Isbeth",
  startPosition = { x = 32350, y = 32226, z = 7 },
  description = "Bring materials to craft a Dragon Necklace.",
  missions = {
    {
      id = 1,
      requiredItems = {
        { itemId = 2137, count = 1 }, -- Necklace
        { itemId = 5890, count = 5 }, -- Dragon Scale
      },
      reward = { itemId = 2200, count = 1 }, -- Dragon Necklace
      storage = 330
    }
  }
}

-- ============================================================================
-- EXPORT
-- ============================================================================

return quests74