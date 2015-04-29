------------------------------------------------------------------------------------------------
--  FasterLootPlus ver. @project-version@
--  Authored by Chrono Syz -- Entity-US / Wildstar
--  Based on FasterLoot by Chimpy Evans -- Entity-US / Wildstar
--  Build @project-hash@
--  Copyright (c) Chronosis. All rights reserved
--
--  https://github.com/chronosis/FasterLootPlus
------------------------------------------------------------------------------------------------
-- FasterLoot-Defaults.lua
------------------------------------------------------------------------------------------------

require "Window"

local FasterLootPlus = Apollo.GetAddon("FasterLootPlus")
local Info = Apollo.GetAddonInfo("FasterLootPlus")

local tBaseRuleSet = {
  label = "",
  lootRules = {}
}

local tBaseLootRule = {
  label = "",
  itemName = "",
  itemType = 0,
  randomAssign = false,
  patternMatch = false,
  assignees = {}
}

local tDefaultLootRules = {
  ["1"] = {
    label = "Eldan Runic Modules",
    itemName = "^Eldan Runic Module$",
    itemType = nil,
    randomAssign = false,
    patternMatch = true,
    assignees = { [0] = "Milk Shakes" }
  },
  ["2"] = {
    label = "Eldan Signs",
    itemName = "^Sign of %a+ %- Eldan$",
    itemType = nil,
    randomAssign = false,
    patternMatch = true,
    assignees = { [0] = "Horns NLegs" }
  },
  ["3"] = {
    label = "Biophage Clusters",
    itemName = "^Suspended Biophage Cluster$",
    itemType = nil,
    randomAssign = false,
    patternMatch = true,
    assignees = { [0] = "Horns NLegs" }
  },
  ["4"] = {
    label = "Recipes",
    itemName = "Archivos",
    itemType = nil,
    randomAssign = false,
    patternMatch = true,
    assignees = { [0] = "Horns NLegs" }
  },
  ["5"] = {
    label = "Cloth",
    itemName = "Starloom",
    itemType = nil,
    randomAssign = false,
    patternMatch = true,
    assignees = { [0] = "Chimpii Evans" }
  },
  ["6"] = {
    label = "Primal Patterns",
    itemName = "Partial Primal Pattern",
    itemType = nil,
    randomAssign = true,
    patternMatch = false,
    assignees = {}
  },
  ["7"] = {
    label = "Eldan Gifts",
    itemName = "Tarnished Eldan Gift",
    itemType = nil,
    randomAssign = true,
    patternMatch = false,
    assignees = {}
  }
}

FasterLootPlus.tItemTypeAggregates = {
  [-10] = { 254, 255, 256, 257, 258, 259 },
  [-9] = { 184, 185, 186, 187, 188, 189, 332, 450 },
  [-8] = { 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 53, 298, 299, 301 },
  [-7] = { 45, 46, 48, 51, 79, 204 },
  [-6] = { 328, 329, 336, 338, 361, 74, 285, 286, 291, 293, 347 },
  [-5] = { 197, 198 },  -- TODO: All Crafting Mats
  [-4] = { 155, 164 },
  [-3] = { 339, 340, 341, 342, 343, 344, 345 },
  [-2] = { 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491 },
  [-1] = { 405, 408, 414, 423 }
}

FasterLootPlus.tItemTypes = {
  [-10] = "- Any Recipe -",
  [-9] = "- Any Costume -",
  [-8] = "- Any Armor -",
  [-7] = "- Any Weapon -",
  [-6] = "- Any Consumable -",
  [-5] = "- Any Crafting -",
  [-4] = "- Any Housing -",
  [-3] = "- Any Element -",
  [-2] = "- Any Tokens -",
  [-1] = "- Any Rune -",
  [1] = "Armor - Light - Chest",
  [2] = "Armor - Light - Legs",
  [3] = "Armor - Light - Head",
  [4] = "Armor - Light - Shoulder",
  [5] = "Armor - Light - Feet",
  [6] = "Armor - Light - Hands",
  [8] = "Armor - Medium - Chest",
  [9] = "Armor - Medium - Legs",
  [10] = "Armor - Medium - Head",
  [11] = "Armor - Medium - Shoulders",
  [12] = "Armor - Medium - Feet",
  [13] = "Armor - Medium - Hands",
  [15] = "Armor - Heavy - Chest",
  [16] = "Armor - Heavy - Legs",
  [17] = "Armor - Heavy - Head",
  [18] = "Armor - Heavy - Shoulder",
  [19] = "Armor - Heavy - Feet",
  [20] = "Armor - Heavy - Hands",
  [45] = "Pistols",
  [46] = "Psyblade",
  [48] = "Claws",
  [51] = "Greatsword",
  [53] = "Energy Shield",
  [74] = "Food",
  [79] = "Resonators",
  [134] = "Bag",
  [143] = "Untyped (Consumable/Flair/etc.)",
  [155] = "Decor",
  [164] = "Improvement",
  [183] = "Untyped (Mount)",
  [184] = "Costume - Chest",
  [185] = "Costume - Legs",
  [186] = "Costume - Head",
  [187] = "Costume - Shoulder",
  [188] = "Costume - Feet",
  [189] = "Costume - Hands",
  [197] = "Ore",
  [198] = "Herb",
  [201] = "Tool - Mining",
  [202] = "Omni-Plasm",
  [204] = "Heavy Gun",
  [206] = "Power Core",
  [207] = "Leather",
  [208] = "Meat",
  [211] = "Cloth",
  [213] = "Seeds",
  [214] = "Relic Parts",
  [215] = "Gadget",
  [219] = "Wood",
  [200] = "Treasure - Junk",
  [221] = "Produce",
  [227] = "Essence - Junk",
  [231] = "Fur - Junk",
  [232] = "Gland - Junk",
  [236] = "Knick-Knacks - Junk",
  [254] = "Tailor Pattern",
  [255] = "Outfitter Guide",
  [256] = "Armorer Design",
  [257] = "Weaponsmith Schematic",
  [258] = "Technologist Formula",
  [259] = "Cooking Recipe",
--[260] = "???",
--[261] = "???",
--[262] = "???",
--[263] = "???",
--[264] = "???",
--[265] = "???",
  [266] = "Fish",
--[267] = "???",
  [268] = "Bug Meat",
  [269] = "Poultry",
  [270] = "Gem",
  [271] = "Crystal",
  [272] = "Tool - Relic Hunter",
  [273] = "Tool - Survivalist",
  [274] = "Pelt",
  [285] = "Meat Meal",
  [286] = "Poultry Meal",
  [291] = "Deradune Victuals",
  [293] = "Ellevar Edibles",
  [298] = "Weapon Attachment",
  [299] = "Support System",
  [301] = "Implant",
  [326] = "Farming - No Commodity",
  [328] = "Medishot",
  [329] = "Boost",
  [330] = "Cloth - No Commodity",
  [332] = "Dye",
  [336] = "Elder Meals",
  [338] = "Datascape Meals",
  [339] = "Water Element",
  [340] = "Life Element",
  [341] = "Earth Element",
  [342] = "Fusion Element",
  [343] = "Fire Element",
  [344] = "Logic Element",
  [345] = "Air Element",
  [347] = "Special Diet",
  [359] = "Rune Fragment",
  [361] = "Field Tech",
  [391] = "Tradeskill Reagent",
  [392] = "Imbuement Material",
  [393] = "Security Key Material",
  [394] = "Warrior Amp",
  [395] = "Engineer Amp",
  [396] = "Medic Amp",
  [397] = "Stalker Amp",
  [398] = "Esper Amp",
  [399] = "Spellslinger Amp",
  [400] = "Carcass - Beast",
  [405] = "General Rune Sets",
  [408] = "Attribute Rune",
  [414] = "Class Rune Sets",
  [423] = "Elder Rune Sets",
  [450] = "Dye Loot Bag",
  [455] = "Nexus Nourishments",
  [465] = "Runic Flux",
  [471] = "Token - Heavy Armor - Hands",
  [484] = "Token - Medium Armor - Shoulder",
  [487] = "Token - Medium Armor - Hands",
  [489] = "Token - Light Armor - Head",
  [490] = "Token - Light Armor - Shoulder",
  [491] = "Token - Light Armor - Chest"
}

function FasterLootPlus:LoadDefaultLootRules()
end

function FasterLootPlus:GetBaseRule()
  return tBaseLootRule
end

function FasterLootPlus:GetBaseRuleSet()
  return tBaseRuleSet
end
