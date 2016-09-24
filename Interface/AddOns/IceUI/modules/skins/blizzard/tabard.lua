local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	TabardFrameMoneyInset:DisableDrawLayer("BORDER")
    TabardFrameCustomizationBorder:Hide()
    TabardFrameMoneyBg:Hide()
    TabardFrameMoneyInsetBg:Hide()

    for i = 19, 28 do
        select(i, TabardFrame:GetRegions()):Hide()
    end

    for i = 1, 5 do
        _G["TabardFrameCustomization"..i.."Left"]:Hide()
        _G["TabardFrameCustomization"..i.."Middle"]:Hide()
        _G["TabardFrameCustomization"..i.."Right"]:Hide()
        Skins:ReskinArrow(_G["TabardFrameCustomization"..i.."LeftButton"], "left")
        Skins:ReskinArrow(_G["TabardFrameCustomization"..i.."RightButton"], "right")
    end

    Skins:ReskinPortraitFrame(TabardFrame, true)
    Skins:CreateBD(TabardFrameCostFrame, .25)
    Skins:Reskin(TabardFrameAcceptButton)
    Skins:Reskin(TabardFrameCancelButton)
end

Skins:RegisterSkin("RayUI", LoadSkin)
