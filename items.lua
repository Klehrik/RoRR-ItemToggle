-- Items    v1.0.1

-- A collection of all vanilla items
-- Organized by Klehrik

Items = {}

local rarities = {
    white = 1,
    green = 2,
    red = 3,
    orange = 4,
    yellow = 5,
    purple = 6
}
Items.rarities = rarities



-- ========== Data ==========

Items.items = {
    {"Meat Nugget",             gm.constants.oNugget,           rarities.white},
    {"Fire Shield",             gm.constants.oFireshield,       rarities.white},
    {"Bustling Fungus",         gm.constants.oMushroom,         rarities.white},
    {"Lens Maker's Glasses",    gm.constants.oGlasses,          rarities.white},
    {"Sprouting Egg",           gm.constants.oEgg,              rarities.white},
    {"Headstompers",            gm.constants.oStompers,         rarities.white},
    {"Life Savings",            gm.constants.oPig,              rarities.white},
    {"Barbed Wire",             gm.constants.oThorns,           rarities.white},
    {"Rusty Knife",             gm.constants.oBlade,            rarities.white},
    {"Mysterious Vial",         gm.constants.oBattery,          rarities.white},
    {"Mortar Tube",             gm.constants.oMortar,           rarities.white},
    {"Warbanner",               gm.constants.oWarbanner,        rarities.white},
    {"Monster Tooth",           gm.constants.oTooth,            rarities.white},
    {"Soldier's Syringe",       gm.constants.oSyringe,          rarities.white},
    {"Crowbar",                 gm.constants.oCrowbar,          rarities.white},
    {"Medkit",                  gm.constants.oMedkit,           rarities.white},
    {"Bundle of Fireworks",     gm.constants.oFireworks,        rarities.white},
    {"Backup Magazine",         gm.constants.oBackupMag,        rarities.white},
    {"Topaz Brooch",            gm.constants.oTopaz,            rarities.white},
    {"Taser",                   gm.constants.oTaser,            rarities.white},
    {"Paul's Goat Hoof",        gm.constants.oHoof,             rarities.white},
    {"Bitter Root",             gm.constants.oRoot,             rarities.white},
    {"Sticky Bomb",             gm.constants.oSticky,           rarities.white},
    {"Snake Eyes",              gm.constants.oDice,             rarities.white},
    {"Hermit's Scarf",          gm.constants.oScarf,            rarities.white},
    {"Gasoline",                gm.constants.oGasoline,         rarities.white},
    {"Spikestrip",              gm.constants.oSpikestrip,       rarities.white},
    {"Mocha",                   gm.constants.oMocha,            rarities.white},
    {"Voltaic Mitt",            gm.constants.oVoltMitt,         rarities.white},
    {"The Toxin",               gm.constants.oToxin,            rarities.white},
    {"Mu Construct",            gm.constants.oConstruct,        rarities.white},
    {"Razor Penny",             gm.constants.oPenny,            rarities.white},
    {"Arcane Blades",           gm.constants.oArcaneBlades,     rarities.white},

    {"Time Keeper's Secret",    gm.constants.oHourglass,        rarities.green},
    {"Smart Shopper",           gm.constants.oPurse,            rarities.green},
    {"Infusion",                gm.constants.oRage,             rarities.green},
    {"Will-O'-The-Wisp",        gm.constants.oBottled,          rarities.green},
    {"AtG Missile Mk. 1",       gm.constants.oMissile,          rarities.green},
    {"Tough Times",             gm.constants.oTeddy,            rarities.green},
    {"Energy Cell",             gm.constants.oCell,             rarities.green},
    {"Rusty Jetpack",           gm.constants.oJetpack,          rarities.green},
    {"Leeching Seed",           gm.constants.oSeed,             rarities.green},
    {"Ukulele",                 gm.constants.oUkulele,          rarities.green},
    {"Boxing Gloves",           gm.constants.oBoxing,           rarities.green},
    {"Prison Shackles",         gm.constants.oShackle,          rarities.green},
    {"Guardian's Heart",        gm.constants.oHeart,            rarities.green},
    {"Hopoo Feather",           gm.constants.oFeather,          rarities.green},
    {"Frost Relic",             gm.constants.oIceRelic,         rarities.green},
    {"Red Whip",                gm.constants.oWhip,             rarities.green},
    {"Chargefield Generator",   gm.constants.oLightningRing,    rarities.green},
    {"Arms Race",               gm.constants.oArmsrace,         rarities.green},
    {"Golden Gun",              gm.constants.oGoldGun,          rarities.green},
    {"56 Leaf Clover",          gm.constants.oClover,           rarities.green},
    {"Concussion Grenade",      gm.constants.oConcussion,       rarities.green},
    {"Filial Imprinting",       gm.constants.oRoe,              rarities.green},
    {"Dead Man's Foot",         gm.constants.oPoisonMine,       rarities.green},
    {"Toxic Centipede",         gm.constants.oPoison,           rarities.green},
    {"Harvester's Scythe",      gm.constants.oScythe,           rarities.green},
    {"Panic Mines",             gm.constants.oMine,             rarities.green},
    {"Predatory Instincts",     gm.constants.oPelt,             rarities.green},
    {"Royal Medallion",         gm.constants.oMedallion,        rarities.green},
    {"Prophet's Cape",          gm.constants.oCape,             rarities.green},
    {"Locked Jewel",            gm.constants.oJewel,            rarities.green},
    {"Hunter's Harpoon",        gm.constants.oHuntersHarpoon,   rarities.green},
    {"Insecticide",             gm.constants.oInsecticide,      rarities.green},
    {"Decaying Sample",         gm.constants.oOrbiter,          rarities.green},

    {"Thallium",                gm.constants.oThallium,         rarities.red},
    {"Tesla Coil",              gm.constants.oTesla,            rarities.red},
    {"Old Box",                 gm.constants.oJackBox,          rarities.red},
    {"Beating Embryo",          gm.constants.oEmbryo,           rarities.red},
    {"Permafrost",              gm.constants.oIceCube,          rarities.red},
    {"AtG Missile Mk. 2",       gm.constants.oMissileTri,       rarities.red},
    {"Happiest Mask",           gm.constants.oMask,             rarities.red},
    {"Plasma Chain",            gm.constants.oPlasma,           rarities.red},
    {"Heaven Cracker",          gm.constants.oDrill,            rarities.red},
    {"Rapid Mitosis",           gm.constants.oTwins,            rarities.red},
    {"Ceremonial Dagger",       gm.constants.oDagger,           rarities.red},
    {"Repulsion Armor",         gm.constants.oRepulsion,        rarities.red},
    {"Brilliant Behemoth",      gm.constants.oCannon,           rarities.red},
    {"Hardlight Afterburner",   gm.constants.oHardlight,        rarities.red},
    {"Interstellar Desk Plant", gm.constants.oDeskPlant,        rarities.red},
    {"Laser Turbine",           gm.constants.oLaserTurbine,     rarities.red},
    {"Wicked Ring",             gm.constants.oSkullRing,        rarities.red},
    {"Alien Head",              gm.constants.oAlienHead,        rarities.red},
    {"The Ol' Lopper",          gm.constants.oAxe,              rarities.red},
    {"The Hit List",            gm.constants.oHitlist,          rarities.red},
    {"Photon Jetpack",          gm.constants.oJetpack2,         rarities.red},
    {"Shattering Justice",      gm.constants.oHammer,           rarities.red},
    {"Telescopic Sight",        gm.constants.oScope,            rarities.red},
    {"Fireman's Boots",         gm.constants.oFireshoe,         rarities.red},
    {"Hyper-Threader",          gm.constants.oBlaster,          rarities.red},
    {"Dio's Best Friend",       gm.constants.oHippo,            rarities.red},
    {"Ancient Scepter",         gm.constants.oScepter,          rarities.red},
    {"Bottled Chaos",           gm.constants.oChaos,            rarities.red},
    {"Aegis",                   gm.constants.oAegis,            rarities.red},
    {"Substandard Duplicator",  gm.constants.oDuplicator,       rarities.red},
    {"Classified Access Codes", gm.constants.oClassified,       rarities.red},
    {"Umbrella",                gm.constants.oUmbrella,         rarities.red},

    {"Rotten Brain",            gm.constants.oBrain,            rarities.orange},
    {"Safeguard Lantern",       gm.constants.oLantern,          rarities.orange},
    {"Snowglobe",               gm.constants.oSnowglobe,        rarities.orange},
    {"Explorer's Key",          gm.constants.oKey,              rarities.orange},
    {"Foreign Fruit",           gm.constants.oFruit,            rarities.orange},
    {"Instant Minefield",       gm.constants.oMinefield,        rarities.orange},
    {"Jar of Souls",            gm.constants.oJarSouls,         rarities.orange},
    {"Carrara Marble",          gm.constants.oMarble,           rarities.orange},
    {"Sawmerang",               gm.constants.oSawmerang,        rarities.orange},
    {"Shattered Mirror",        gm.constants.oMirror,           rarities.orange},
    {"Disposable Missile Launcher", gm.constants.oMissileBox,   rarities.orange},
    {"Gold-Plated Bomb",        gm.constants.oBomb,             rarities.orange},
    {"Drone Repair Kit",        gm.constants.oRepairKit,        rarities.orange},
    {"Thqwib",                  gm.constants.oThqwib,           rarities.orange},
    {"Dynamite Plunger",        gm.constants.oDynamitePlunger,  rarities.orange},
    {"Mace Replica",            gm.constants.oMace,             rarities.orange},
    {"Gigantic Amethyst",       gm.constants.oAmethyst,         rarities.orange},
    {"Crudely-Drawn Buddy",     gm.constants.oDecoy,            rarities.orange},
    {"Prescriptions",           gm.constants.oPills,            rarities.orange},
    {"Shield Generator",        gm.constants.oBubbleShield,     rarities.orange},
    {"Unstable Watch",          gm.constants.oWatch,            rarities.orange},
    {"Lost Doll",               gm.constants.oDoll,             rarities.orange},
    {"Pillaged Gold",           gm.constants.oSack,             rarities.orange},
    {"Captain's Brooch",        gm.constants.oBrooch,           rarities.orange},
    {"The Back-Up",             gm.constants.oRadio,            rarities.orange},
    {"Super Massive Leech",     gm.constants.oLeech,            rarities.orange},
    {"Glowing Meteorite",       gm.constants.oMeteor,           rarities.orange},
    {"Strange Battery",         gm.constants.oStrangeBattery,   rarities.orange},
    
    {"Legendary Spark",         gm.constants.oPauldron,         rarities.yellow},
    {"Imp Overlord's Tentacle", gm.constants.oImpTentacle,      rarities.yellow},
    {"Burning Witness",         gm.constants.oWormEye,          rarities.yellow},
    {"Colossal Knurl",          gm.constants.oKnurl,            rarities.yellow},
    {"Ifrit's Horn",            gm.constants.oHorn,             rarities.yellow},
    {"Nematocyst Nozzle",       gm.constants.oJellyBox,         rarities.yellow},
    {"Scorching Shell Piece",   gm.constants.oShellPiece,       rarities.yellow},

    {"White Undershirt (M)",    gm.constants.oTshirt,           rarities.purple},
    {"Keycard",                 gm.constants.oKeycard,          rarities.purple}
}

Items.white_items = {}
Items.green_items = {}
Items.red_items = {}
Items.orange_items = {}
Items.yellow_items = {}
Items.purple_items = {}

for i = 1, #Items.items do
    local item = Items.items[i]
    if item[3] == rarities.white then table.insert(Items.white_items, item)
    elseif item[3] == rarities.green then table.insert(Items.green_items, item)
    elseif item[3] == rarities.red then table.insert(Items.red_items, item)
    elseif item[3] == rarities.orange then table.insert(Items.orange_items, item)
    elseif item[3] == rarities.yellow then table.insert(Items.yellow_items, item)
    elseif item[3] == rarities.purple then table.insert(Items.purple_items, item)
    end
end



-- ========== Functions ==========

Items.get_item_names = function(rarity, ind)
    local ind = ind or 1

    -- Returns a table containing all item names of
    -- a rarity, or all items if none is specified.
    local rarity = rarity or -1
    local item_table = Items.items

    if rarity == Items.rarities.white then item_table = Items.white_items
    elseif rarity == Items.rarities.green then item_table = Items.green_items
    elseif rarity == Items.rarities.red then item_table = Items.red_items
    elseif rarity == Items.rarities.orange then item_table = Items.orange_items
    elseif rarity == Items.rarities.yellow then item_table = Items.yellow_items
    elseif rarity == Items.rarities.purple then item_table = Items.purple_items
    end
    
    local t = {}
    for i = 1, #item_table do
        t[i] = item_table[i][ind]
    end
    return t
end

Items.get_item_constants = function(rarity)
    -- Returns a table containing all item constants of
    -- a rarity, or all items if none is specified.
    return Items.get_item_names(rarity, 2)
end

Items.find_item = function(name_or_const)
    -- Returns the table index of the item and its data table.
    -- Returns -1 and nil if the item doesn't exist.
    for i = 1, #Items.items do
        if name_or_const == Items.items[i][1] or name_or_const == Items.items[i][2] then
            return i, Items.items[i]
        end
    end
    return -1, nil
end



return Items