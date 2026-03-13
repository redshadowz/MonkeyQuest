MonkeySpeed = {}
MonkeySpeed.m_bLoaded = false
MonkeySpeed.m_strPlayer = ""
MonkeySpeed.m_bCalibrate = false

local MS_UpdateTicker = 0
local MS_DeltaTime = 0
local MS_Speed,MS_SpeedDist = 0,0
local MS_CurPosX,MS_CurPosY,MS_LastPosX,MS_LastPosY,MS_CurContinentID,MS_CurMapZone,MS_CurZoneText
local ZoneNames = {}

local self = CreateFrame'Frame'
self:SetScript('OnEvent', function() this[event](this) end)
self:RegisterEvent("PLAYER_ENTERING_WORLD")
function MonkeySpeed_OnLoad()
	SlashCmdList["MONKEYSPEED_DISPLAY"] = MonkeySpeed_ToggleDisplay
	SLASH_MONKEYSPEED_DISPLAY1 = "/monkeyspeed"
	SLASH_MONKEYSPEED_DISPLAY2 = "/mspeed"

	SlashCmdList["MONKEYSPEED_DEBUG"] = MonkeySpeed_ToggleDebug
	SLASH_MONKEYSPEED_DEBUG1 = "/monkeyspeeddebug"
	SLASH_MONKEYSPEED_DEBUG2 = "/msdebug"
	
	SlashCmdList["MONKEYSPEED_CALIBRATE"] = MonkeySpeedSlash_CmdCalibrate
	SLASH_MONKEYSPEED_CALIBRATE1 = "/monkeyspeedcalibrate"
	SLASH_MONKEYSPEED_CALIBRATE2 = "/mscalibrate"
	
	MonkeySpeedFrame:SetBackdropBorderColor(1.0, 0.6901960784313725, 0.0, 1.0)
end
function self:PLAYER_ENTERING_WORLD()
	if not MonkeySpeed.m_bLoaded then
		MonkeySpeed.m_bLoaded = true
		MS_LastPosX,MS_LastPosY = GetPlayerMapPosition("player")
		MonkeySpeed_Init()
		self:SetScript('OnUpdate', function() MonkeySpeed_OnUpdate() end)
		for _,event in {'ZONE_CHANGED','ZONE_CHANGED_INDOORS','ZONE_CHANGED_NEW_AREA', } do self:RegisterEvent(event) end
		MS_LoadZones(GetMapZones(GetCurrentMapContinent()))
		local old_WorldMapFrame = WorldMapFrame:GetScript("OnHide")
		WorldMapFrame:SetScript("OnHide", function() SetMapToCurrentZone() old_WorldMapFrame() end)
	else
		MS_LoadZones(GetMapZones(GetCurrentMapContinent()))
	end
end
function self:ZONE_CHANGED()
	MS_LoadZones(GetMapZones(GetCurrentMapContinent()))
end
function self:ZONE_CHANGED_INDOORS()
	MS_LoadZones(GetMapZones(GetCurrentMapContinent()))
end
function self:ZONE_CHANGED_NEW_AREA()
	MS_LoadZones(GetMapZones(GetCurrentMapContinent()))
end
function MonkeySpeed_OnUpdate()
	if MS_UpdateTicker < GetTime() then -- Triggers once per second
		MS_DeltaTime = GetTime() - MS_UpdateTicker + .5
		MS_UpdateTicker = GetTime() + .5
		MS_CurPosX,MS_CurPosY = GetPlayerMapPosition("player")
		if MS_CurPosX then
			MS_CurContinentID,MS_CurMapZone,MS_CurZoneText,baserate = GetCurrentMapContinent(),ZoneNames[GetRealZoneText()] or 0,GetZoneText(),0
			local dist = math.sqrt(
				((MS_LastPosX - MS_CurPosX) * (MS_LastPosX - MS_CurPosX) * 2.25 ) +
				((MS_LastPosY - MS_CurPosY) * (MS_LastPosY - MS_CurPosY)))
			MS_SpeedDist = MS_SpeedDist + dist
			if MS_CurMapZone ~= 0 then -- Not in a dungeon
				if not MonkeySpeedConfig.Baseline[MS_CurContinentID] then MonkeySpeedConfig.Baseline[MS_CurContinentID] = {} end
				if not MonkeySpeedConfig.Baseline[MS_CurContinentID][MS_CurMapZone] then MonkeySpeedConfig.Baseline[MS_CurContinentID][MS_CurMapZone] = {zid=MS_CurMapZone, rate=0} end
				if MonkeySpeed.m_bCalibrate == true then
					MonkeySpeedConfig.Baseline[MS_CurContinentID][MS_CurMapZone].rate = MS_SpeedDist / MS_DeltaTime
					if DEFAULT_CHAT_FRAME and dist ~= 0 then DEFAULT_CHAT_FRAME:AddMessage(format("ZoneBaseline"..MS_CurContinentID.."  zid="..MS_CurMapZone.."  rate=%.5f",  (MS_SpeedDist / MS_DeltaTime))) end
					MonkeySpeed.m_bCalibrate = false
				end
				baserate = MonkeySpeedConfig.Baseline[MS_CurContinentID][MS_CurMapZone].rate
				if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDebugMode == true then
					if DEFAULT_CHAT_FRAME and dist ~= 0 then DEFAULT_CHAT_FRAME:AddMessage(format("ZoneBaseline"..MS_CurContinentID.."  zid="..MS_CurMapZone.."  rate=%.5f",  (MS_SpeedDist / MS_DeltaTime))) end
				end
			else
				if not MonkeySpeedConfig.m_SpecialZoneBaseline[MS_CurZoneText] then MonkeySpeedConfig.m_SpecialZoneBaseline[MS_CurZoneText] = 0 end
				if MonkeySpeed.m_bCalibrate == true then
					MonkeySpeedConfig.m_SpecialZoneBaseline[MS_CurZoneText] = MS_SpeedDist / MS_DeltaTime
					if DEFAULT_CHAT_FRAME and dist ~= 0 then DEFAULT_CHAT_FRAME:AddMessage(format("SpecialZoneBaseline  name=" .. MS_CurZoneText .. "  rate=%.5f", (MS_SpeedDist / MS_DeltaTime))) end
					MonkeySpeed.m_bCalibrate = false
				end
				baserate = MonkeySpeedConfig.m_SpecialZoneBaseline[MS_CurZoneText]
				if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDebugMode == true then
					if DEFAULT_CHAT_FRAME and dist ~= 0 then DEFAULT_CHAT_FRAME:AddMessage(format("SpecialZoneBaseline  name=" .. MS_CurZoneText .. "  rate=%.5f", (MS_SpeedDist / MS_DeltaTime))) end
				end
			end
			if baserate ~= 0 then
				MS_Speed = MonkeySpeed_Round(((MS_SpeedDist / MS_DeltaTime) / baserate) * 100)
				MS_SpeedDist = 0.0
				MS_DeltaTime = 0.0
				if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent then
					MonkeySpeedText:SetText(format("%d%%", MS_Speed))
				end
				if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar then
					if MS_Speed == 0.0 then
						MonkeySpeedBar:SetVertexColor(1,0,0)
					elseif MS_Speed < 100.0 then
						MonkeySpeedBar:SetVertexColor(1,0.25,0)
					elseif MS_Speed == 100.0 then
						MonkeySpeedBar:SetVertexColor(1,0.5,0)
					elseif MS_Speed > 100.0 and MS_Speed < 140.0 then
						MonkeySpeedBar:SetVertexColor(0,1,0)
					elseif MS_Speed >= 140.0 and MS_Speed < 200.0 then
						MonkeySpeedBar:SetVertexColor(1,0,1)
					elseif MS_Speed >= 200.0 and MS_Speed < 550.0 then
						MonkeySpeedBar:SetVertexColor(0.5,0,1)
					elseif MS_Speed >= 550.0 then
						MonkeySpeedBar:SetVertexColor(0,0,1)
					end
				end
			else
				if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent then
					MonkeySpeedText:SetText("???%")
				end
				if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar then
					MonkeySpeedBar:SetVertexColor(0,0,0)
				end
			end
		end
		MS_LastPosX = MS_CurPosX
		MS_LastPosY = MS_CurPosY
	end
end
function MonkeySpeed_OnEnter()
	GameTooltip_SetDefaultAnchor(GameTooltip, this)
	GameTooltip:SetText(MONKEYSPEED_TITLE_VERSION, MONKEYLIB_TITLE_COLOUR.r, MONKEYLIB_TITLE_COLOUR.g, MONKEYLIB_TITLE_COLOUR.b, 1)
	GameTooltip:AddLine(MONKEYSPEED_DESCRIPTION, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b, 1)
	GameTooltip:AddLine(MONKEYSPEED_DESCRIPTION2, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b, 1)
	GameTooltip:Show()
end
function MonkeySpeed_OnMouseDown(arg1)
	if arg1 == "LeftButton" then
		if IsShiftKeyDown() then
			MonkeySpeed.m_bCalibrate = true
		elseif MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bLocked == false then
			MonkeySpeedFrame:StartMoving()
		end
	elseif arg1 == "RightButton" then
		if IsShiftKeyDown() then
			MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = false
			MonkeySpeedFrame:Hide()
		elseif MonkeyBuddyFrame then
			ShowUIPanel(MonkeyBuddyFrame)
			MonkeyBuddySpeedTab_OnClick()
		end
	end
end
function MonkeySpeed_OnMouseUp(arg1)
	if arg1 == "LeftButton" then
		MonkeySpeedFrame:StopMovingOrSizing()
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].xpos = MonkeySpeedFrame:GetLeft()
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].ypos = MonkeySpeedFrame:GetTop()
	end
end
function MonkeySpeed_ParsePosition(position)
	local x,y,iStart,iEnd
	iStart,iEnd,x,y = string.find(position, "^(.-), (.-)$")
	if x then return x + 0.0, y + 0.0 end
end
function MonkeySpeed_Round(x)
	if x - floor(x) > 0.5 then x = x + 0.5 end
	return floor(x)
end
function MS_LoadZones(...)
	if ZoneNames[arg[1]] ~= arg[1] then
		for i=1, arg.n, 1 do
			ZoneNames[arg[i]] = i
		end
	end
end