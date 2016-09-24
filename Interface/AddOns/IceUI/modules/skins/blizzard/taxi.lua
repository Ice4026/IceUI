local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    TaxiFrame:DisableDrawLayer("BORDER")
    TaxiFrame:DisableDrawLayer("OVERLAY")
    TaxiFrame.Bg:Hide()
    TaxiFrame.TitleBg:Hide()
    TaxiFrame.TopTileStreaks:Hide()

    Skins:SetBD(TaxiFrame, 3, -23, -5, 3)
    Skins:ReskinClose(TaxiFrame.CloseButton, "TOPRIGHT", TaxiRouteMap, "TOPRIGHT", -4, -4)
end

Skins:RegisterSkin("RayUI", LoadSkin)
