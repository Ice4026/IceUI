local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	DeathRecapFrame:StripTextures()
	Skins:ReskinClose(DeathRecapFrame.CloseXButton)
	Skins:SetBD(DeathRecapFrame)

	for i=1, 5 do
		local iconBorder = DeathRecapFrame["Recap"..i].SpellInfo.IconBorder
		local icon = DeathRecapFrame["Recap"..i].SpellInfo.Icon
		iconBorder:SetAlpha(0)
		icon:SetTexCoord(.08, .92, .08, .92)
		DeathRecapFrame["Recap"..i].SpellInfo.bg = Skins:CreateBG(DeathRecapFrame["Recap"..i].SpellInfo)
		DeathRecapFrame["Recap"..i].SpellInfo.bg:SetOutside(icon)
		icon:SetParent(DeathRecapFrame["Recap"..i].SpellInfo)
	end

	for i=1, DeathRecapFrame:GetNumChildren() do
		local child = select(i, DeathRecapFrame:GetChildren())
		if(child:GetObjectType() == "Button" and child.GetText and child:GetText() == CLOSE) then
			Skins:Reskin(child)
		end
	end
end

Skins:RegisterSkin("Blizzard_DeathRecap", LoadSkin)