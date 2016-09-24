--World map from RayUI
local I, IC, L = select(2, ...):unpack()
local WM = CreateFrame("Frame", "Worldmap")

-- Ace libs
LibStub:GetLibrary("AceTimer-3.0"):Embed(WM)
LibStub:GetLibrary("AceHook-3.0"):Embed(WM)

function WM:SetLargeWorldMap()
	if InCombatLockdown() then return end

	WorldMapFrame:SetParent(UIParent)
	WorldMapFrame:EnableKeyboard(false)
	WorldMapFrame:SetScale(1)
	WorldMapFrame:EnableMouse(true)
	
	if WorldMapFrame:GetAttribute("UIPanelLayout-area") ~= "center" then
		SetUIPanelAttribute(WorldMapFrame, "area", "center");
	end
	
	if WorldMapFrame:GetAttribute("UIPanelLayout-allowOtherPanels") ~= true then
		SetUIPanelAttribute(WorldMapFrame, "allowOtherPanels", true)	
	end

	WorldMapFrameSizeUpButton:Hide()
	WorldMapFrameSizeDownButton:Show()	

	WorldMapFrame:ClearAllPoints()
	WorldMapFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
	WorldMapFrame:SetSize(1002, 668)
end

function WM:SetSmallWorldMap()
	if InCombatLockdown() then return; end

	WorldMapFrameSizeUpButton:Show()
	WorldMapFrameSizeDownButton:Hide()	
end

function WM:PLAYER_REGEN_ENABLED()
	WorldMapFrameSizeDownButton:Enable()
	WorldMapFrameSizeUpButton:Enable()	
end

function WM:PLAYER_REGEN_DISABLED()
	WorldMapFrameSizeDownButton:Disable()
	WorldMapFrameSizeUpButton:Disable()
end

function WM:UpdateCoords()
	if not WorldMapFrame:IsShown() then return end
	local inInstance, _ = IsInInstance()
	local x, y = GetPlayerMapPosition("player")
	x = I:Round(100 * x, 2)
	y = I:Round(100 * y, 2)
	
	if x ~= 0 and y ~= 0 then
		CoordsHolder.playerCoords:SetText(PLAYER..": "..x..", "..y)
	else
		CoordsHolder.playerCoords:SetText(nil)
	end
	
	local scale = WorldMapDetailFrame:GetEffectiveScale()
	local width = WorldMapDetailFrame:GetWidth()
	local height = WorldMapDetailFrame:GetHeight()
	local centerX, centerY = WorldMapDetailFrame:GetCenter()
	local x, y = GetCursorPosition()
	local adjustedX = (x / scale - (centerX - (width/2))) / width
	local adjustedY = (centerY + (height/2) - y / scale) / height

	if (adjustedX >= 0  and adjustedY >= 0 and adjustedX <= 1 and adjustedY <= 1) then
		adjustedX = I:Round(100 * adjustedX, 2)
		adjustedY = I:Round(100 * adjustedY, 2)
		CoordsHolder.mouseCoords:SetText(MOUSE_LABEL..": "..adjustedX..", "..adjustedY)
	else
		CoordsHolder.mouseCoords:SetText(nil)
	end
end

function WM:ResetDropDownListPosition(frame)
	DropDownList1:ClearAllPoints()
	DropDownList1:Point("TOPRIGHT", frame, "BOTTOMRIGHT", -17, -4)
end

function WM:Enable()
	local CoordsHolder = CreateFrame("Frame", "CoordsHolder", WorldMapFrame)
	CoordsHolder:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel() + 1)
	CoordsHolder:SetFrameStrata(WorldMapDetailFrame:GetFrameStrata())
	CoordsHolder.playerCoords = CoordsHolder:CreateFontString(nil, "OVERLAY")
	CoordsHolder.mouseCoords = CoordsHolder:CreateFontString(nil, "OVERLAY")
	CoordsHolder.playerCoords:SetFontObject(NumberFontNormal)
	CoordsHolder.mouseCoords:SetFontObject(NumberFontNormal)
	CoordsHolder.playerCoords:SetText(PLAYER..":   0, 0")
	CoordsHolder.mouseCoords:SetText(MOUSE_LABEL..":   0, 0")
	CoordsHolder.playerCoords:SetPoint("BOTTOMLEFT", WorldMapFrame.UIElementsFrame, "BOTTOMLEFT", 5, 5)
	CoordsHolder.mouseCoords:SetPoint("BOTTOMLEFT", CoordsHolder.playerCoords, "TOPLEFT")
	
	self:ScheduleRepeatingTimer("UpdateCoords", 0.05)

	BlackoutWorld:SetTexture(nil)
	self:SecureHook("WorldMap_ToggleSizeDown", "SetSmallWorldMap")	
	self:SecureHook("WorldMap_ToggleSizeUp", "SetLargeWorldMap")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")

	if WORLDMAP_SETTINGS.size == WORLDMAP_FULLMAP_SIZE then
		self:SetLargeWorldMap()
	elseif WORLDMAP_SETTINGS.size == WORLDMAP_WINDOWED_SIZE then
		self:SetSmallWorldMap()
	end
end

I["Worldmap"] = WM
