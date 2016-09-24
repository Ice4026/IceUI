local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b
	local KeyBindingFrame = KeyBindingFrame

	KeyBindingFrame.header:DisableDrawLayer("BACKGROUND")
	KeyBindingFrame.header:DisableDrawLayer("BORDER")
	KeyBindingFrame.scrollFrame.scrollBorderTop:SetTexture("")
	KeyBindingFrame.scrollFrame.scrollBorderBottom:SetTexture("")
	KeyBindingFrame.scrollFrame.scrollBorderMiddle:SetTexture("")
	KeyBindingFrame.scrollFrame.scrollFrameScrollBarBackground:SetTexture("")
	KeyBindingFrame.categoryList:DisableDrawLayer("BACKGROUND")
	KeyBindingFrame.bindingsContainer:SetBackdrop(nil)

	Skins:CreateBD(KeyBindingFrame)
	Skins:Reskin(KeyBindingFrame.defaultsButton)
	Skins:Reskin(KeyBindingFrame.unbindButton)
	Skins:Reskin(KeyBindingFrame.okayButton)
	Skins:Reskin(KeyBindingFrame.cancelButton)
	Skins:ReskinCheck(KeyBindingFrame.characterSpecificButton)
	Skins:ReskinScroll(KeyBindingFrameScrollFrameScrollBar)

	local function styleBindingButton(bu)
		local selected = bu.selectedHighlight

		for i = 1, 9 do
			select(i, bu:GetRegions()):Hide()
		end

		selected:SetTexture(IC.Medias.Textures.gloss)
		selected:SetPoint("TOPLEFT", 1, -1)
		selected:SetPoint("BOTTOMRIGHT", -1, 1)
		selected:SetColorTexture(r, g, b, .2)

		Skins:Reskin(bu)
	end

	for i = 1, KEY_BINDINGS_DISPLAYED do
		local button1 = _G["KeyBindingFrameKeyBinding"..i.."Key1Button"]
		local button2 = _G["KeyBindingFrameKeyBinding"..i.."Key2Button"]

		button2:SetPoint("LEFT", button1, "RIGHT", 1, 0)

		styleBindingButton(button1)
		styleBindingButton(button2)
	end

	KeyBindingFrame.header.text:ClearAllPoints()
	KeyBindingFrame.header.text:SetPoint("TOP", KeyBindingFrame, "TOP", 0, -8)

	KeyBindingFrame.unbindButton:ClearAllPoints()
	KeyBindingFrame.unbindButton:SetPoint("BOTTOMRIGHT", -207, 16)
	KeyBindingFrame.okayButton:ClearAllPoints()
	KeyBindingFrame.okayButton:SetPoint("BOTTOMLEFT", KeyBindingFrame.unbindButton, "BOTTOMRIGHT", 1, 0)
	KeyBindingFrame.cancelButton:ClearAllPoints()
	KeyBindingFrame.cancelButton:SetPoint("BOTTOMLEFT", KeyBindingFrame.okayButton, "BOTTOMRIGHT", 1, 0)

	local line = KeyBindingFrame:CreateTexture(nil, "ARTWORK")
	line:SetSize(1, 546)
	line:SetPoint("LEFT", 205, 10)
	line:SetColorTexture(1, 1, 1, .2)
end

Skins:RegisterSkin("Blizzard_BindingUI", LoadSkin)