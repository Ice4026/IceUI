local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()
local Loading = T["Loading"]

function Loading:OnEvent(event, addon)
    if (event == "PLAYER_LOGIN") then
        -- LOAD SETTINGS
            self:LoadCustomSettings()

        -- LOAD AUTOMATIC SCALING IF AUTOSCALE IF ON
            if (C.General.AutoScale) then
                C.General.UIScale = min(2, max(0.32, 768 / string.match(T.Resolution, "%d+x(%d+)")))
            end

            T.Mult = 768/string.match(T.Resolution, "%d+x(%d+)")/C.General.UIScale

        -- PANELS
            T["Panels"]:Enable()

        -- INVENTORY
            -- Bags
            if (C.Bags.Enable) then
                T["Inventory"]["Bags"]:Enable()
            end

            -- Loot Frame
            T["Inventory"]["Loot"]:Enable()

            -- Merchant
            T["Inventory"]["Merchant"]:Enable()

            -- Bag Filter
            if C["Bags"].BagFilter then
                T["Inventory"]["BagFilter"]:Enable()
            end

        -- ACTION BARS
            if (C.ActionBars.Enable) then
                T["ActionBars"]:Enable()
            end

        -- COOLDOWNS
            T["Cooldowns"]:Enable()

        -- MISCELLANEOUS
            if C["Misc"].ThreatBarEnable then
                T["Miscellaneous"]["ThreatBar"]:Enable()
            end

            if C["Misc"].AltPowerBarEnable then
                T["Miscellaneous"]["AltPowerBar"]:Enable()
            end

            if C["Misc"].ExperienceEnable then
                T["Miscellaneous"]["Experience"]:Enable()
            end

            if C["Misc"].ReputationEnable then
                T["Miscellaneous"]["Reputation"]:Enable()
            end

            if C["Misc"].ErrorFilterEnable then
                T["Miscellaneous"]["ErrorFilter"]:Enable()
            end

            if C["Misc"].AutoInviteEnable then
                T["Miscellaneous"]["Invite"]:Enable()
            end

            T["Miscellaneous"]["MirrorTimers"]:Enable()
            T["Miscellaneous"]["DropDown"]:Enable()
            T["Miscellaneous"]["CollectGarbage"]:Enable()
            T["Miscellaneous"]["GameMenu"]:Enable()
            T["Miscellaneous"]["LossControl"]:Enable()
            T["Miscellaneous"]["StaticPopups"]:Enable()
            T["Miscellaneous"]["TimerTracker"]:Enable()
            T["Miscellaneous"]["Durability"]:Enable()
            T["Miscellaneous"]["Capture"]:Enable()
            T["Miscellaneous"]["Ghost"]:Enable()
            T["Miscellaneous"]["VehicleIndicator"]:Enable()
            T["Miscellaneous"]["TalkingHead"]:Enable()

        -- BUFFS
            if (C.Auras.Enable) then
                T["Auras"]:Enable()
                T["Auras"]:Expend()
            end

        -- Watcher
            I["Watcher"]:Enable()
        
        -- Skins
            I["Skins"]:Enable()
            
        -- Maps
            I["Minimap"]:Enable()
            I["Worldmap"]:Enable()
            -- T["Maps"]["Minimap"]:Enable()
            -- T["Maps"]["Minimap"]:Expend()
            -- T["Maps"]["Zonemap"]:Enable()
            -- T["Maps"]["Worldmap"]:Enable()

        -- DATATEXTS
            T["DataTexts"]:Enable()

        -- CHAT
            T["Chat"]:Enable()

        -- UNITFRAMES
            T["UnitFrames"]:Enable()
            T["UnitFrames"]:SetUI()

        -- TOOLTIPS
            T["Tooltips"]:Enable()
            T["Tooltips"]:Expend()

        -- NAMEPLATES
            T["NamePlates"]:Enable()

        -- PET BATTLES
            T["PetBattles"]:Enable()
    elseif (event == "PLAYER_ENTERING_WORLD") then
        -- OBJECTIVE TRACKER
            T["Miscellaneous"]["ObjectiveTracker"]:Enable()
    end
end

Loading:SetScript("OnEvent", Loading.OnEvent)