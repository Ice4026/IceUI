local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function SkinMogIt()
	if not S.db.mogit then return end
	local MogIt = MogIt
	--Skinning MogIt Frames
	MogItFrame:StripTextures()
	Skins:SetBD(MogItFrame)
	MogItFrameInset:StripTextures()
	Skins:CreateBD(MogItFrameInset)
	MogItFilters:StripTextures()
	MogItFilters:CreateShadow("Background")
	MogItFiltersInset:StripTextures()
	MogItFiltersInset:CreateShadow("Background")

	--Skin the Buttons
	Skins:Reskin(MogItFrameFiltersDefaults)
	MogItFrameFiltersDefaults:StripTextures()
	MogItFrameFiltersDefaults:CreateShadow("Background")

	Skins:ReskinClose(MogItFrameCloseButton)
	Skins:ReskinClose(MogItFiltersCloseButton)

	--Skin the Scrollbars
	Skins:ReskinScroll(MogItScroll)
	Skins:ReskinScroll(MogItFiltersScrollScrollBar)

	local _CreatePreview = MogIt.CreatePreview
	function MogIt.CreatePreview()
		local f = _CreatePreview()
		f:StripTextures()
		f.Inset:Kill()
		Skins:Reskin(f.activate)
		Skins:SetBD(f)
		for i = 1, 13 do
			local slotIndex = MogIt:GetSlot(i)
			f.slots[slotIndex]:StripTextures()
			f.slots[slotIndex]:StyleButton(1)
			_G[f.slots[slotIndex]:GetName().."IconTexture"]:SetTexCoord(.08, .92, .08, .92)
			_G[f.slots[slotIndex]:GetName().."IconTexture"]:SetInside(nil, 1, 1)
			Skins:CreateBD(f.slots[slotIndex])
		end

		return f
	end

	local _CreateModelFrame = MogIt.CreateModelFrame
	function MogIt:CreateModelFrame(parent)
		local f = _CreateModelFrame(self, parent)
		Skins:CreateBD(f.model, 0)

		return f
	end
end

Skins:RegisterSkin("MogIt", SkinMogIt)