local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    GuildRegistrarFrameTop:Hide()
    GuildRegistrarFrameBottom:Hide()
    GuildRegistrarFrameMiddle:Hide()
    select(19, GuildRegistrarFrame:GetRegions()):Hide()
    select(6, GuildRegistrarFrameEditBox:GetRegions()):Hide()
    select(7, GuildRegistrarFrameEditBox:GetRegions()):Hide()

    GuildRegistrarFrameEditBox:SetHeight(20)

    Skins:ReskinPortraitFrame(GuildRegistrarFrame, true)
    Skins:CreateBD(GuildRegistrarFrameEditBox, .25)
    Skins:Reskin(GuildRegistrarFrameGoodbyeButton)
    Skins:Reskin(GuildRegistrarFramePurchaseButton)
    Skins:Reskin(GuildRegistrarFrameCancelButton)
end

Skins:RegisterSkin("RayUI", LoadSkin)
