local I, IC, L = select(2, ...):unpack()

I["MyClass"] = select(2, UnitClass("player"))
I["MyName"] = UnitName("Player")
I["Realm"] = GetRealmName()
I["Colors"] = {
    ["Classes"] = {}
}

local classColors = {
    ["DEATHKNIGHT"] = { 0.77,   0.12,       0.23 },
    ["DEMONHUNTER"] = { 0.64,   0.19,      0.79 },
    ["DRUID"]       = { 1,      0.49,       0.04 },
    ["HUNTER"]      = { 0.58,   0.86,       0.49 },
    ["MAGE"]        = { 0.2,    0.76,       1 },
    ["PALADIN"]     = { 1,      0.42,       0.62 },
    ["PRIEST"]      = { 1,      1,          1 },
    ["ROGUE"]       = { 1,      0.91,       0.3 },
    ["SHAMAN"]      = { 0.16,   0.31,       0.61 },
    ["WARLOCK"]     = { 0.6,    0.47,       0.85 },
    ["WARRIOR"]     = { 0.9,    0.65,       0.45 },
    ["MONK"]        = { 0,      1,          0.59 },
}

for class, color in pairs(classColors) do
    I.Colors.Classes[class] = { r = color[1], g = color[2], b = color[3] }
end