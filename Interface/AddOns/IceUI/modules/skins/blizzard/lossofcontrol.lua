local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    local IconBackdrop = CreateFrame("Frame", nil, LossOfControlFrame)
    IconBackdrop:CreateShadow("Background")
    IconBackdrop:SetAllPoints(LossOfControlFrame.Icon)
    LossOfControlFrame.Icon:SetTexCoord(.08, .92, .08, .92)

    hooksecurefunc("LossOfControlFrame_SetUpDisplay", function(self, ...)   
        self.AbilityName:SetFont(IC.Medias.Textures.font, 20, "OUTLINE")
        self.TimeLeft.NumberText:SetFont(IC.Medias.Textures.font, 20, "OUTLINE")
        self.TimeLeft.SecondsText:SetFont(IC.Medias.Textures.font, 20, "OUTLINE")
    end)

    --Test
    --LossOfControlFrame_SetUpDisplay(LossOfControlFrame, true, 1, 408, "HeHe", select(3,GetSpellInfo(408)), time(), 6, 6, lockoutSchool, 1, 1)
end

Skins:RegisterSkin("RayUI", LoadSkin)
