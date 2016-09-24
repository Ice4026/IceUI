local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    for i = 1, 15 do
		select(i, QuestChoiceFrame:GetRegions()):Hide()
	end

	for i = 17, 19 do
		select(i, QuestChoiceFrame:GetRegions()):Hide()
	end

    for i = 1, 2 do
        local option = QuestChoiceFrame["Option"..i]
        local rewards = option.Rewards
        local icon = rewards.Item.Icon
        local currencies = rewards.Currencies

        option.OptionText:SetTextColor(.9, .9, .9)
        rewards.Item.Name:SetTextColor(1, 1, 1)

        icon:SetTexCoord(.08, .92, .08, .92)
        icon:SetDrawLayer("BACKGROUND", 1)
        Skins:CreateBG(icon)

        for j = 1, 3 do
            local cu = currencies["Currency"..j]

            cu.Icon:SetTexCoord(.08, .92, .08, .92)
            Skins:CreateBG(cu.Icon)
        end
    end

    Skins:CreateBD(QuestChoiceFrame)
    Skins:CreateSD(QuestChoiceFrame)
    Skins:Reskin(QuestChoiceFrame.Option1.OptionButton)
    Skins:Reskin(QuestChoiceFrame.Option2.OptionButton)
    Skins:ReskinClose(QuestChoiceFrame.CloseButton)
end

Skins:RegisterSkin("Blizzard_QuestChoice", LoadSkin)
