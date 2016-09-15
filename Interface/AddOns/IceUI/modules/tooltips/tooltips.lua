local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()
local Tooltip = T["Tooltips"]

function Tooltip:SetUnitAura(...)
	local caster, _, _, id = select(8, UnitAura(...))
	if id then
		if caster then
			local name = UnitName(caster)
			local _, class = UnitClass(caster)
			local color = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
			self:AddDoubleLine(("|cFFCA3C3C%s|r %d"):format(ID, id), format("|c%s%s|r", color.colorStr, name))
		else
			self:AddLine(("|cFFCA3C3C%s|r %d"):format(ID, id))
		end

		self:Show()
	end
end

function Tooltip:OnTooltipSetSpell()
	local id = select(3, self:GetSpell())
	if not id then return end

	local displayString = ("|cFFCA3C3C%s|r %d"):format(ID, id)
	local lines = self:NumLines()
	local isFound
	for i= 1, lines do
		local line = _G[("GameTooltipTextLeft%d"):format(i)]
		if line and line:GetText() and line:GetText():find(displayString) then
			isFound = true;
			break
		end
	end

	if not isFound then
		self:AddLine(" ")
		self:AddLine(displayString)
		self:Show()
	end
end


function Tooltip:Expend()
	for _, Tooltip in pairs(Tooltip.Tooltips) do
		if Tooltip == GameTooltip then
			Tooltip:HookScript("OnTooltipSetSpell", self.OnTooltipSetSpell)
			hooksecurefunc(GameTooltip, "SetUnitAura", self.SetUnitAura)
		end
	end
end
