local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	MacroFrameText:SetFont(IC.Medias.Textures.font, 14)
	Skins:ReskinPortraitFrame(MacroFrame, true)
	Skins:CreateBD(MacroFrameScrollFrame, .25)
	Skins:CreateBD(MacroPopupFrame)
	Skins:CreateBD(MacroPopupEditBox, .25)
	select(18, MacroFrame:GetRegions()):Hide()
	MacroHorizontalBarLeft:Hide()
	select(21, MacroFrame:GetRegions()):Hide()
	for i = 1, 6 do
		select(i, MacroFrameTab1:GetRegions()):Hide()
		select(i, MacroFrameTab2:GetRegions()):Hide()
		select(i, MacroFrameTab1:GetRegions()).Show = R.dummy
		select(i, MacroFrameTab2:GetRegions()).Show = R.dummy
	end
	for i = 1, 5 do
		select(i, MacroPopupFrame:GetRegions()):Hide()
	end
	MacroPopupScrollFrame:GetRegions():Hide()
	select(2, MacroPopupScrollFrame:GetRegions()):Hide()
	MacroPopupNameLeft:Hide()
	MacroPopupNameMiddle:Hide()
	MacroPopupNameRight:Hide()
	MacroFrameTextBackground:SetBackdrop(nil)
	select(2, MacroFrameSelectedMacroButton:GetRegions()):Hide()
	MacroFrameSelectedMacroBackground:SetAlpha(0)
	MacroButtonScrollFrameTop:Hide()
	MacroButtonScrollFrameBottom:Hide()

	for i = 1, MAX_ACCOUNT_MACROS do
		local bu = _G["MacroButton"..i]
		local ic = _G["MacroButton"..i.."Icon"]

		select(2, bu:GetRegions()):Hide()
		bu:StyleButton(1)
		bu:SetPushedTexture(nil)

		ic:Point("TOPLEFT", 1, -1)
		ic:Point("BOTTOMRIGHT", -1, 1)
		ic:SetTexCoord(.08, .92, .08, .92)

		Skins:CreateBD(bu, .25)
	end

	for i = 1, NUM_MACRO_ICONS_SHOWN do
		local bu = _G["MacroPopupButton"..i]
		local ic = _G["MacroPopupButton"..i.."Icon"]

		select(2, bu:GetRegions()):Hide()
		bu:StyleButton(1)
		bu:SetPushedTexture(nil)

		ic:Point("TOPLEFT", 1, -1)
		ic:Point("BOTTOMRIGHT", -1, 1)
		ic:SetTexCoord(.08, .92, .08, .92)

		Skins:CreateBD(bu, .25)
	end

	MacroFrameSelectedMacroButton:StyleButton(true)
	MacroFrameSelectedMacroButton:SetPoint("TOPLEFT", MacroFrameSelectedMacroBackground, "TOPLEFT", 12, -16)
	MacroFrameSelectedMacroButtonIcon:SetPoint("TOPLEFT", 1, -1)
	MacroFrameSelectedMacroButtonIcon:SetPoint("BOTTOMRIGHT", -1, 1)
	MacroFrameSelectedMacroButtonIcon:SetTexCoord(.08, .92, .08, .92)

	Skins:CreateBD(MacroFrameSelectedMacroButton, .25)

	Skins:Reskin(MacroDeleteButton)
	Skins:Reskin(MacroNewButton)
	Skins:Reskin(MacroExitButton)
	Skins:Reskin(MacroEditButton)
	Skins:Reskin(MacroSaveButton)
	Skins:Reskin(MacroCancelButton)
	Skins:Reskin(MacroPopupOkayButton)
	Skins:Reskin(MacroPopupCancelButton)
	MacroPopupFrame:ClearAllPoints()
	MacroPopupFrame:SetPoint("TOPLEFT", MacroFrame, "TOPRIGHT", -32, -40)

	Skins:ReskinClose(MacroFrameCloseButton, "TOPRIGHT", MacroFrame, "TOPRIGHT", -38, -14)
	Skins:ReskinScroll(MacroButtonScrollFrameScrollBar)
	Skins:ReskinScroll(MacroFrameScrollFrameScrollBar)
	Skins:ReskinScroll(MacroPopupScrollFrameScrollBar)
end

Skins:RegisterSkin("Blizzard_MacroUI", LoadSkin)
