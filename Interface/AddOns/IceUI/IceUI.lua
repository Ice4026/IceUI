local AddOn, Engine = ...
local TC
local Realm = GetRealmName()
local Name = UnitName("Player")

if (TukuiConfigPerAccount) then
    TC = TukuiConfigShared.Account
else
    TC = TukuiConfigShared[Realm][Name]
end


Engine[1] = CreateFrame("Frame")
Engine[2] = {}
Engine[3] = {}
Engine[4] = TC

function Engine:unpack()
    return self[1], self[2], self[3], self[4]
end

function Engine:GetName()
    return AddOn
end

_G[AddOn] = Engine
