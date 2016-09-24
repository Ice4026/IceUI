local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()

local TukuiAuras = T["Auras"]

function TukuiAuras:Expend()
	self:ResetHeadersPosition()
end

