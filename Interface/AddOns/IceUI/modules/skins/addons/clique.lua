local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function SkinClique()
	local tab = _G["CliqueSpellTab"]
	tab:GetRegions():Hide()
	tab:SetCheckedTexture(R.checked)
	tab:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
	Skins:CreateBG(tab)
	Skins:CreateSD(tab, 5, 0, 0, 0, 1, 1)
	select(4, tab:GetRegions()):SetTexCoord(.08, .92, .08, .92)
	CliqueConfig:StripTextures()
	CliqueConfigInset:StripTextures()
	Skins:SetBD(CliqueConfig)
	CliqueConfigPage1Column1:DisableDrawLayer("BACKGROUND")
	CliqueConfigPage1Column2:DisableDrawLayer("BACKGROUND")
	Skins:ReskinClose(CliqueConfigCloseButton)
	Skins:Reskin(CliqueConfigPage1ButtonSpell)
	CliqueConfigPage1ButtonSpell_RightSeparator:Kill()
	Skins:Reskin(CliqueConfigPage1ButtonOther)
	CliqueConfigPage1ButtonOther_RightSeparator:Kill()
	Skins:Reskin(CliqueConfigPage1ButtonOptions)
	CliqueConfigPage1ButtonOptions_LeftSeparator:Kill()
end

Skins:RegisterSkin("Clique", SkinClique)