local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    select(18, PetitionFrame:GetRegions()):Hide()
    select(19, PetitionFrame:GetRegions()):Hide()
    select(23, PetitionFrame:GetRegions()):Hide()
    select(24, PetitionFrame:GetRegions()):Hide()
    PetitionFrameTop:Hide()
    PetitionFrameBottom:Hide()
    PetitionFrameMiddle:Hide()

    Skins:ReskinPortraitFrame(PetitionFrame, true)
    Skins:Reskin(PetitionFrameSignButton)
    Skins:Reskin(PetitionFrameRequestButton)
    Skins:Reskin(PetitionFrameRenameButton)
    Skins:Reskin(PetitionFrameCancelButton)
end

Skins:RegisterSkin("RayUI", LoadSkin)
