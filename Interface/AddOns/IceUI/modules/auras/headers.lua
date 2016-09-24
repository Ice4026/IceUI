local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()

local TukuiAuras = T["Auras"]

function TukuiAuras:ResetHeadersPosition()
	local Headers = TukuiAuras.Headers
	local Buffs = Headers[1]
	local Debuffs = Headers[2]

	Buffs:SetPoint("TOPRIGHT", UIParent, -50, -28)
	Debuffs:SetPoint("TOPRIGHT", UIParent, -50, -28)
end
