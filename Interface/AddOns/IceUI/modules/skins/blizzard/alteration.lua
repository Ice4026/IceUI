local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	Skins:SetBD(TransmogrifyFrame)
	TransmogrifyArtFrame:DisableDrawLayer("BACKGROUND")
	TransmogrifyArtFrame:DisableDrawLayer("BORDER")
	TransmogrifyArtFramePortraitFrame:Hide()
	TransmogrifyArtFramePortrait:Hide()
	TransmogrifyArtFrameTopBorder:Hide()
	TransmogrifyArtFrameTopRightCorner:Hide()
	TransmogrifyModelFrameMarbleBg:Hide()
	select(2, TransmogrifyModelFrame:GetRegions()):Hide()
	TransmogrifyModelFrameLines:Hide()
	TransmogrifyFrameButtonFrame:GetRegions():Hide()
	TransmogrifyFrameButtonFrameButtonBorder:Hide()
	TransmogrifyFrameButtonFrameButtonBottomBorder:Hide()
	TransmogrifyFrameButtonFrameMoneyLeft:Hide()
	TransmogrifyFrameButtonFrameMoneyRight:Hide()
	TransmogrifyFrameButtonFrameMoneyMiddle:Hide()
	TransmogrifyApplyButton_LeftSeparator:Hide()

	local slots = {"Head", "Shoulder", "Chest", "Waist", "Legs", "Feet", "Wrist", "Hands", "Back", "MainHand", "SecondaryHand", "Ranged"}

	for i = 1, #slots do
		local slot = _G["TransmogrifyFrame"..slots[i].."Slot"]
		if slot then
			local ic = _G["TransmogrifyFrame"..slots[i].."SlotIconTexture"]
			_G["TransmogrifyFrame"..slots[i].."SlotBorder"]:Hide()
			_G["TransmogrifyFrame"..slots[i].."SlotGrabber"]:Hide()

			ic:SetTexCoord(.08, .92, .08, .92)
			Skins:CreateBD(slot, 0)

			slot:StyleButton(1)
		end
	end

	Skins:Reskin(TransmogrifyApplyButton)
	Skins:ReskinClose(TransmogrifyArtFrameCloseButton)

	TransmogrifyConfirmationPopup:SetParent(UIParent)
    TransmogrifyConfirmationPopup:StripTextures()
    Skins:SetBD(TransmogrifyConfirmationPopup)
    Skins:Reskin(TransmogrifyConfirmationPopup.Button1)
    Skins:Reskin(TransmogrifyConfirmationPopup.Button2)
    for i = 1, 2 do
        local bu = _G["TransmogrifyConfirmationPopupItemFrame"..i]
        bu:StyleButton(true)
        bu.icon:SetTexCoord(.08, .92, .08, .92)
        Skins:CreateBG(bu.icon)
    end
end

Skins:RegisterSkin("Blizzard_ItemAlterationUI", LoadSkin)
