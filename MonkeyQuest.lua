MonkeyQuest = {}
MonkeyQuest.m_bLoaded = false				-- true when the config variables are loaded
MonkeyQuest.m_iNumQuestButtons = 40		-- 40 is the max possible entries in the quest log (20 quests and 20 different locations)
MonkeyQuest.m_iMaxTextWidth = 229			-- wraps the text if it gets too long, mostly needed for objectives
MonkeyQuest.m_strPlayer = ""
MonkeyQuest.m_aQuestList = {}
MonkeyQuest.m_aQuestItemList = {}
MQ_NeedRefresh = false
MQ_UpdateTicker = 0
MonkeyQuest.m_colourBorder = { r = TOOLTIP_DEFAULT_COLOR.r, g = TOOLTIP_DEFAULT_COLOR.g, b = TOOLTIP_DEFAULT_COLOR.b }

local self = CreateFrame'Frame'
self:SetScript('OnEvent', function() this[event](this) end)
self:RegisterEvent("PLAYER_ENTERING_WORLD")
function MonkeyQuest_OnLoad()
	MonkeyQuestTitleText:SetTextColor(MONKEYLIB_TITLE_COLOUR.r, MONKEYLIB_TITLE_COLOUR.g, MONKEYLIB_TITLE_COLOUR.b)
	MonkeyQuestSlash_Init()

	MonkeyQuest_OLD_aftt_setName = aftt_setName
	aftt_setName = MonkeyQuest_NEW_aftt_setName

	MonkeyQuest_OLD_ContainerFrameItemButton_OnEnter = ContainerFrameItemButton_OnEnter
	ContainerFrameItemButton_OnEnter = MonkeyQuest_NEW_ContainerFrameItemButton_OnEnter
end
function self:QUEST_LOG_UPDATE()
	MQ_NeedRefresh = true MQ_UpdateTicker = GetTime() + MONKEYQUEST_DELAY 
end
function self:PLAYER_ENTERING_WORLD()
	MonkeyQuest.m_bLoaded = true
	MonkeyQuestInit_LoadConfig()
	this:UnregisterEvent('PLAYER_ENTERING_WORLD')
	for _,event in {'QUEST_LOG_UPDATE','PLAYER_LEVEL_UP','ZONE_CHANGED','ZONE_CHANGED_INDOORS','ZONE_CHANGED_NEW_AREA','UPDATE_MOUSEOVER_UNIT', } do self:RegisterEvent(event) end
	self:SetScript('OnUpdate', function() MonkeyQuest_OnUpdate() end)
end
function self:PLAYER_LEVEL_UP()
	MonkeyQuest_Refresh()
end
function self:ZONE_CHANGED()
	MonkeyQuest_Refresh()
end
function self:ZONE_CHANGED_INDOORS()
	MonkeyQuest_Refresh()
end
function self:ZONE_CHANGED_NEW_AREA()
	MonkeyQuest_Refresh()
end
function self:UPDATE_MOUSEOVER_UNIT()
	MonkeyQuest_SearchTooltip()
end

function MonkeyQuest_OnUpdate()
	if MQ_NeedRefresh and MQ_UpdateTicker < GetTime() then MonkeyQuest_Refresh() MQ_NeedRefresh = false end
end
function MonkeyQuest_OnMouseDown(arg1)
	if arg1 == "LeftButton" then
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLocked == false then MonkeyQuestFrame:StartMoving() end
	else
		if IsShiftKeyDown() then
			if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay then
				MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = false
				MonkeySpeedFrame:Hide()
			else
				MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = true
				MonkeySpeedFrame:Show()
			end
		elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAllowRightClick == true then
			if MonkeyBuddyFrame then
				ShowUIPanel(MonkeyBuddyFrame)
				MonkeyBuddyQuestTab_OnClick()
			end
		end
	end
end
function MonkeyQuest_OnMouseUp(arg1)
	if arg1 == "LeftButton" then
		MonkeyQuestFrame:StopMovingOrSizing()
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft = MonkeyQuestFrame:GetLeft()
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameTop = MonkeyQuestFrame:GetTop()
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameBottom = MonkeyQuestFrame:GetBottom()
	end
end
function MonkeyQuest_OnEnter()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == true then MonkeyQuestFrame:Show() end
end
function MonkeyQuest_OnLeave()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == true then MonkeyQuest_Hide() end
end
function MonkeyQuestCloseButton_OnClick()
	--MonkeyQuest_Hide()
	MonkeyQuestMinimizeButton_OnClick()
end
function MonkeyQuestCloseButton_OnEnter()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips == false then return end
	GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
	GameTooltip:SetText(MONKEYQUEST_NOOBTIP_HEADER, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
	GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_CLOSE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	GameTooltip:AddLine(MONKEYQUEST_HELP_OPEN_MSG, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	GameTooltip:Show()
end
function MonkeyQuestMinimizeButton_OnClick()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized = not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized == true then
		MonkeyQuestMinimizeButton:SetNormalTexture("Interface\\AddOns\\MonkeyQuest\\Textures\\MinimizeButton-Down")
	else
		MonkeyQuestMinimizeButton:SetNormalTexture("Interface\\AddOns\\MonkeyQuest\\Textures\\MinimizeButton-Up")
	end
	MonkeyQuest_Refresh()
end
function MonkeyQuestMinimizeButton_OnEnter()
	if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips then return end
	GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
	GameTooltip:SetText(MONKEYQUEST_NOOBTIP_HEADER, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized then
		GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_RESTORE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	else
		GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_MINIMIZE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	end
	GameTooltip:Show()
end
function MonkeyQuestShowHiddenCheckButton_OnClick()
	if this:GetChecked() then
		PlaySound("igMainMenuOptionCheckBoxOff")
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden = true
	else
		PlaySound("igMainMenuOptionCheckBoxOn")
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden = false
	end
	MonkeyQuest_Refresh()
end
function MonkeyQuestShowHiddenCheckButton_OnEnter()
	if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips then return end
	GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT")
	GameTooltip:SetText(MONKEYQUEST_NOOBTIP_HEADER, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
	if this:GetChecked() then
		GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_HIDEALLHIDDEN, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	else
		GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_SHOWALLHIDDEN, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	end
	GameTooltip:Show()
end
function MonkeyQuest_Show()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay = true
	MonkeyQuestFrame:Show()
end
function MonkeyQuest_Hide()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay = false
	MonkeyQuestFrame:Hide()
end
function MonkeyQuest_SetAlpha(iAlpha)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha = iAlpha
	MonkeyQuestFrame:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b, iAlpha)
end
function MonkeyQuest_SetFrameAlpha(iAlpha)
	MonkeyQuestFrame:SetAlpha(iAlpha)
end
function MonkeyQuest_Refresh() -- Refresh .3 seconds after 'QUEST_LOG_UPDATE'
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == true then
		if BIB_MonkeyQuestButton then
			if not BIB_MonkeyQuestButton:IsShown() then
				MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB = false
				MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_TOPLEFT"
				MonkeyQuest_Show()
			end
		else
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB = false
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_TOPLEFT"
			MonkeyQuest_Show()
		end
	end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden == true then
		MonkeyQuestShowHiddenCheckButton:SetChecked(1)
	else
		MonkeyQuestShowHiddenCheckButton:SetChecked(0)
	end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized == true then
		MonkeyQuestMinimizeButton:SetNormalTexture("Interface\\AddOns\\MonkeyQuest\\Textures\\MinimizeButton-Down")
	else
		MonkeyQuestMinimizeButton:SetNormalTexture("Interface\\AddOns\\MonkeyQuest\\Textures\\MinimizeButton-Up")
	end
	local strMonkeyQuestBody = ""
	local colour,strTitleColor
	local iButtonId = 1
	local bNextHeader = false
	local tmpQuestLogSelection = GetQuestLogSelection()
	local iNumEntries, iNumQuests = GetNumQuestLogEntries()
	MonkeyQuestTitleText:SetTextHeight(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight + 2)
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNumQuests == true then
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitle == false then
			MonkeyQuestTitleText:SetText(MONKEYQUEST_TITLE.." "..iNumQuests.."/"..MAX_QUESTLOG_QUESTS)
		else
			MonkeyQuestTitleText:SetText(iNumQuests.."/"..MAX_QUESTLOG_QUESTS)
		end
	elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitle == false then
		MonkeyQuestTitleText:SetText(MONKEYQUEST_TITLE)
	else
		MonkeyQuestTitleText:SetText("")
	end
	if BIB_MonkeyQuestButton_GetButtonText then
		BIB_MonkeyQuestButton_GetButtonText()
	end
	MonkeyQuest.m_iNumEntries = iNumEntries
	for i=1, MonkeyQuest.m_iNumQuestButtons, 1 do
		getglobal("MonkeyQuestButton"..i.."Text"):SetText("")
		getglobal("MonkeyQuestButton"..i.."Text"):Hide()
		getglobal("MonkeyQuestButton"..i):Hide()
		getglobal("MonkeyQuestHideButton"..i):Hide()
		getglobal("MonkeyQuestButton"..i.."Text"):SetWidth(MonkeyQuestFrame:GetWidth() - MONKEYQUEST_PADDING - 8)
		getglobal("MonkeyQuestButton"..i.."Text"):SetTextHeight(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight)
	end
	MonkeyQuest_RefreshQuestItemList()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized == false then
		for i=1, iNumEntries, 1 do
			-- strQuestLogTitleText		the title text of the quest, may be a header (ex. Wetlands)
			-- strQuestLevel			the level of the quest
			-- strQuestTag				the tag on the quest (ex. COMPLETED)
			local strQuestLogTitleText,strQuestLevel,strQuestTag,isHeader,isCollapsed,isComplete = GetQuestLogTitle(i)
			if bNextHeader == true and isHeader then bNextHeader = false end
			if bNextHeader == false then
				SelectQuestLogEntry(i)
				if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText] then
					MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText] = {}
					MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked = true
				end
				if isHeader then
					if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked == true then
						if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoHeaders == false or MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden == true or MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAlwaysHeaders == true then
							strMonkeyQuestBody = strMonkeyQuestBody..format(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strHeaderOpenColour.."%s|r", "- "..strQuestLogTitleText).."\n"
							getglobal("MonkeyQuestButton"..iButtonId.."Text"):SetText(strMonkeyQuestBody)
							getglobal("MonkeyQuestButton"..iButtonId.."Text"):Show()
							getglobal("MonkeyQuestButton"..iButtonId):Show()
							getglobal("MonkeyQuestButton"..iButtonId.."Texture"):SetVertexColor(0.0, 0.0, 0.0, 0.0)
							getglobal("MonkeyQuestButton"..iButtonId).m_iQuestIndex = i
							getglobal("MonkeyQuestButton"..iButtonId).id = iButtonId
							getglobal("MonkeyQuestHideButton"..iButtonId):Hide()
							getglobal("MonkeyQuestHideButton"..iButtonId).m_strQuestLogTitleText = strQuestLogTitleText
							iButtonId = iButtonId + 1
							strMonkeyQuestBody = ""
						end
					else
						if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden == true or MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAlwaysHeaders == true then
							strMonkeyQuestBody = strMonkeyQuestBody..format(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strHeaderClosedColour.."%s|r", "+ "..strQuestLogTitleText).."\n"
							getglobal("MonkeyQuestButton"..iButtonId.."Text"):SetText(strMonkeyQuestBody)
							getglobal("MonkeyQuestButton"..iButtonId.."Text"):Show()
							getglobal("MonkeyQuestButton"..iButtonId):Show()
							getglobal("MonkeyQuestButton"..iButtonId.."Texture"):SetVertexColor(0.0, 0.0, 0.0, 0.0)
							getglobal("MonkeyQuestButton"..iButtonId).m_iQuestIndex = i
							getglobal("MonkeyQuestButton"..iButtonId).id = iButtonId
							getglobal("MonkeyQuestHideButton"..iButtonId):Hide()
							getglobal("MonkeyQuestHideButton"..iButtonId).m_strQuestLogTitleText = strQuestLogTitleText
							iButtonId = iButtonId + 1
							strMonkeyQuestBody = ""
						end
						bNextHeader = true
					end
				else
					if (MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked == true or MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden)
					and (MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedQuests == false or (MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedQuests == true and not isComplete) or MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden) then
						getglobal("MonkeyQuestHideButton"..iButtonId):Show()
						if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked == true then
							getglobal("MonkeyQuestHideButton"..iButtonId):SetChecked(1)
						else
							getglobal("MonkeyQuestHideButton"..iButtonId):SetChecked(0)
						end
						getglobal("MonkeyQuestHideButton"..iButtonId).m_strQuestLogTitleText = strQuestLogTitleText
						colour = GetDifficultyColor(strQuestLevel)
						if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bColourTitle then
							strTitleColor = format("|c%02X%02X%02X%02X", 255, colour.r * 255, colour.g * 255, colour.b * 255)
						else
							strTitleColor = MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strQuestTitleColour
						end
						strMonkeyQuestBody = strMonkeyQuestBody.."  "
						if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowQuestLevel == true then
							if strQuestTag == ELITE then
								strMonkeyQuestBody = strMonkeyQuestBody..format("|c%02X%02X%02X%02X%s|r", 255, colour.r * 255, colour.g * 255, colour.b * 255, "["..strQuestLevel.."+] ")
							elseif strQuestTag == MONKEYQUEST_DUNGEON then
								strMonkeyQuestBody = strMonkeyQuestBody..format("|c%02X%02X%02X%02X%s|r", 255, colour.r * 255, colour.g * 255, colour.b * 255, "["..strQuestLevel.. "d] ")
							elseif strQuestTag == RAID then
								strMonkeyQuestBody = strMonkeyQuestBody..format("|c%02X%02X%02X%02X%s|r", 255, colour.r * 255, colour.g * 255, colour.b * 255, "["..strQuestLevel.. "r] ")
							elseif strQuestTag == MONKEYQUEST_PVP then
								strMonkeyQuestBody = strMonkeyQuestBody..format("|c%02X%02X%02X%02X%s|r", 255, colour.r * 255, colour.g * 255, colour.b * 255, "["..strQuestLevel.. "p] ")
							else
								strMonkeyQuestBody = strMonkeyQuestBody..format("|c%02X%02X%02X%02X%s|r", 255, colour.r * 255, colour.g * 255, colour.b * 255, "["..strQuestLevel.. "] ")
							end
						end
						if isComplete and isComplete < 0 then
							strMonkeyQuestBody = strMonkeyQuestBody..format(strTitleColor.."%s|r", strQuestLogTitleText).." ("..MONKEYQUEST_QUEST_FAILED..")\n"
						elseif isComplete and isComplete > 0 then
							strMonkeyQuestBody = strMonkeyQuestBody..format(strTitleColor.."%s|r", strQuestLogTitleText).." ("..MONKEYQUEST_QUEST_DONE..")\n"
						else
							strMonkeyQuestBody = strMonkeyQuestBody..format(strTitleColor.."%s|r", strQuestLogTitleText).."\n"
						end
						local strQuestDescription, strQuestObjectives = GetQuestLogQuestText()
						if GetNumQuestLeaderBoards() > 0 then
							for ii=1, GetNumQuestLeaderBoards(), 1 do
								local strLeaderBoardText, strType, iFinished = GetQuestLogLeaderBoard(ii)
								MonkeyQuest_AddQuestItemToList(strLeaderBoardText)
								if strLeaderBoardText then
									if not iFinished then
										strMonkeyQuestBody = strMonkeyQuestBody.."	"..MonkeyQuest_GetLeaderboardColorStr(strLeaderBoardText)..strLeaderBoardText.."\n"
									elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedObjectives == false or MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden then
										strMonkeyQuestBody = strMonkeyQuestBody.."	"..MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour..strLeaderBoardText.."\n"
									end
								end
							end
						elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives then
							strMonkeyQuestBody = strMonkeyQuestBody.."	"..format(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strOverviewColour.."%s|r", strQuestObjectives).."\n"
						end
						getglobal("MonkeyQuestButton"..iButtonId.."Text"):SetText(strMonkeyQuestBody)
						getglobal("MonkeyQuestButton"..iButtonId.."Text"):Show()
						getglobal("MonkeyQuestButton"..iButtonId):Show()
						getglobal("MonkeyQuestButton"..iButtonId.."Texture"):SetVertexColor(0.0, 0.0, 0.0, 0.0)
						if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowZoneHighlight then
							local strSubZoneText = string.lower(GetSubZoneText())
							if strSubZoneText ~= "" then
								if string.find(string.lower(strQuestDescription), strSubZoneText, 1, true) or string.find(string.lower(strQuestObjectives), strSubZoneText, 1, true) then
									local a, r, g, b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strZoneHighlightColour)
									getglobal("MonkeyQuestButton"..iButtonId.."Texture"):SetVertexColor(r, g, b, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha)
								end
							end
						end
						getglobal("MonkeyQuestButton"..iButtonId).m_iQuestIndex = i
						getglobal("MonkeyQuestButton"..iButtonId).m_strQuestObjectives = strQuestObjectives
						iButtonId = iButtonId + 1
						strMonkeyQuestBody = ""
					end
				end
			end
		end
	end
	for i=1, MonkeyQuest.m_iNumQuestButtons, 1 do
		getglobal("MonkeyQuestButton"..i.."Text"):SetWidth(MonkeyQuestFrame:GetWidth() - MONKEYQUEST_PADDING - 8)
	end
	SelectQuestLogEntry(tmpQuestLogSelection)
	MonkeyQuest_Resize()
	MonkeyQuest.m_fTimeSinceRefresh = 0.0
end
function MonkeyQuest_RefreshQuestItemList()
	local strQuestLogTitleText,strQuestLevel,strQuestTag,isHeader,isCollapsed,isComplete
	local iNumEntries,iNumQuests = GetNumQuestLogEntries()
	MonkeyQuest.m_aQuestItemList = {}
	for i=1, iNumEntries, 1 do
		-- strQuestLogTitleText		the title text of the quest, may be a header (ex. Wetlands)
		-- strQuestLevel			the level of the quest
		-- strQuestTag				the tag on the quest (ex. COMPLETED)
		strQuestLogTitleText,strQuestLevel,strQuestTag,isHeader,isCollapsed,isComplete = GetQuestLogTitle(i)
		if not isHeader then
			SelectQuestLogEntry(i)
			if GetNumQuestLeaderBoards() > 0 then
				for ii=1, GetNumQuestLeaderBoards(), 1 do
					local strLeaderBoardText, strType, iFinished = GetQuestLogLeaderBoard(ii)
					MonkeyQuest_AddQuestItemToList(strLeaderBoardText)
				end
			end
		end
	end
end
function MonkeyQuest_AddQuestItemToList(strLeaderBoardText)
	local i,j,strItemName,iNumItems,iNumNeeded = string.find(strLeaderBoardText, "(.*):%s*([-%d]+)%s*/%s*([-%d]+)%s*$")
	if not iNumItems then return end
	i,j = string.find(strItemName, MONKEYQUEST_TOOLTIP_SLAIN)
	if i then strItemName = string.sub(strItemName, 1, i - 2) end
	if not MonkeyQuest.m_aQuestItemList[strItemName] then
		MonkeyQuest.m_aQuestItemList[strItemName] = {}
	end
	MonkeyQuest.m_aQuestItemList[strItemName].m_iNumItems = iNumItems
	MonkeyQuest.m_aQuestItemList[strItemName].m_iNumNeeded = iNumNeeded
end
function MonkeyQuest_Resize()
	local iHeight = 0
	local text,button
	local iTextWidth = 0
	local iPadding = MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iQuestPadding
	iTextWidth = MonkeyQuestFrame:GetWidth() - MONKEYQUEST_PADDING - 8
	MonkeyQuestTitleButton:SetWidth(MonkeyQuestTitleText:GetWidth())
	MonkeyQuestTitleButton:SetHeight(MonkeyQuestTitleText:GetHeight())
	for i = 1, MonkeyQuest.m_iNumQuestButtons, 1 do
		text = getglobal("MonkeyQuestButton"..i.."Text")
		button = getglobal("MonkeyQuestButton"..i)
		if text:IsVisible() then
			text:SetWidth(iTextWidth)
			iHeight = iHeight + text:GetHeight() + iPadding
			button:SetWidth(text:GetWidth())
			button:SetHeight(text:GetHeight())
		end
	end
	iHeight = iHeight + MonkeyQuestTitleText:GetHeight() + MONKEYQUEST_PADDING
	MonkeyQuestFrame:SetHeight(iHeight)
	if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft or not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameTop or not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameBottom then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft = 15
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameTop = -180
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameBottom = 250
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == false then
			if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp == false then
				MonkeyQuestFrame:ClearAllPoints()
				MonkeyQuestFrame:SetPoint("TOPRIGHT","UIParent","TOPRIGHT", MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameTop)
			else
				MonkeyQuestFrame:ClearAllPoints()
				MonkeyQuestFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameBottom)
			end
		end
	else
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == false then
			if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp == false then
				MonkeyQuestFrame:ClearAllPoints()
				MonkeyQuestFrame:SetPoint("TOPLEFT","UIParent","BOTTOMLEFT", MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameTop)
			else
				MonkeyQuestFrame:ClearAllPoints()
				MonkeyQuestFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameBottom)
			end
		end
	end
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameLeft = MonkeyQuestFrame:GetLeft()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameTop = MonkeyQuestFrame:GetTop()
end
function MonkeyQuest_GetLeaderboardColorStr(strText)
	local i,j,strItemName,iNumItems,iNumNeeded = string.find(strText, "(.*):%s*([-%d]+)%s*/%s*([-%d]+)%s*$")
	local colour = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	local colourInitial = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	local colourMid = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	local colourComplete = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}

	colourInitial.a, colourInitial.r, colourInitial.g, colourInitial.b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour)
	colourMid.a, colourMid.r, colourMid.g, colourMid.b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strMidObjectiveColour)
	colourComplete.a, colourComplete.r, colourComplete.g, colourComplete.b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour)

	local colourDelta1 = {
		a = (colourMid.a - colourInitial.a),
		r = (colourMid.r - colourInitial.r),
		g = (colourMid.g - colourInitial.g),
		b = (colourMid.b - colourInitial.b)
		}
	local colourDelta2 = {
		a = (colourComplete.a - colourMid.a),
		r = (colourComplete.r - colourMid.r),
		g = (colourComplete.g - colourMid.g),
		b = (colourComplete.b - colourMid.b)
		}
	if iNumItems then
		if (iNumItems / iNumNeeded) < 0.5 then
			colour.r = colourInitial.r + ((iNumItems / (iNumNeeded / 2)) * colourDelta1.r)
			colour.g = colourInitial.g + ((iNumItems / (iNumNeeded / 2)) * colourDelta1.g)
			colour.b = colourInitial.b + ((iNumItems / (iNumNeeded / 2)) * colourDelta1.b)
		else
			colour.r = colourMid.r + (((iNumItems - (iNumNeeded / 2)) / (iNumNeeded / 2)) * colourDelta2.r)
			colour.g = colourMid.g + (((iNumItems - (iNumNeeded / 2)) / (iNumNeeded / 2)) * colourDelta2.g)
			colour.b = colourMid.b + (((iNumItems - (iNumNeeded / 2)) / (iNumNeeded / 2)) * colourDelta2.b)
		end
	else
		local i,j,strItemName,strItems,strNeeded = string.find(strText, "(.*):%s*([-%a]+)%s*/%s*([-%a]+)%s*$")
		if strItems then
			if strItems == strNeeded then
				return MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour
			else
				return MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour
			end
		else
			return MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strSpecialObjectiveColour
		end
	end
	if colour.r > 1.0 then colour.r = 1.0 end
	if colour.g > 1.0 then colour.g = 1.0 end
	if colour.b > 1.0 then colour.b = 1.0 end
	if colour.r < 0.0 then colour.r = 0.0 end
	if colour.g < 0.0 then colour.g = 0.0 end
	if colour.b < 0.0 then colour.b = 0.0 end

	return MonkeyLib_ARGBToColourStr(colour.a, colour.r, colour.g, colour.b)
end
function MonkeyQuest_GetCompletenessColorStr(iNumItems, iNumNeeded)
	local colour = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	local colourInitial = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	local colourMid = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	local colourComplete = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
	colourInitial.a, colourInitial.r, colourInitial.g, colourInitial.b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour)
	colourMid.a, colourMid.r, colourMid.g, colourMid.b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strMidObjectiveColour)
	colourComplete.a, colourComplete.r, colourComplete.g, colourComplete.b = MonkeyLib_ColourStrToARGB(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour)
	local colourDelta1 = {
		a = (colourMid.a - colourInitial.a),
		r = (colourMid.r - colourInitial.r),
		g = (colourMid.g - colourInitial.g),
		b = (colourMid.b - colourInitial.b)
		}
	local colourDelta2 = {
		a = (colourComplete.a - colourMid.a),
		r = (colourComplete.r - colourMid.r),
		g = (colourComplete.g - colourMid.g),
		b = (colourComplete.b - colourMid.b)
		}
	if iNumItems then
		if (iNumItems / iNumNeeded) < 0.5 then
			colour.r = colourInitial.r + ((iNumItems / (iNumNeeded / 2)) * colourDelta1.r)
			colour.g = colourInitial.g + ((iNumItems / (iNumNeeded / 2)) * colourDelta1.g)
			colour.b = colourInitial.b + ((iNumItems / (iNumNeeded / 2)) * colourDelta1.b)
		else
			colour.r = colourMid.r + (((iNumItems - (iNumNeeded / 2)) / (iNumNeeded / 2)) * colourDelta2.r)
			colour.g = colourMid.g + (((iNumItems - (iNumNeeded / 2)) / (iNumNeeded / 2)) * colourDelta2.g)
			colour.b = colourMid.b + (((iNumItems - (iNumNeeded / 2)) / (iNumNeeded / 2)) * colourDelta2.b)
		end
	else
		local i,j,strItemName,strItems,strNeeded = string.find(strText, "(.*):%s*([-%a]+)%s*/%s*([-%a]+)%s*$")
		if strItems then
			if strItems == strNeeded then
				return MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour
			else
				return MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour
			end
		else
			return MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strSpecialObjectiveColour
		end
	end
	if colour.r > 1.0 then colour.r = 1.0 end
	if colour.g > 1.0 then colour.g = 1.0 end
	if colour.b > 1.0 then colour.b = 1.0 end
	if colour.r < 0.0 then colour.r = 0.0 end
	if colour.g < 0.0 then colour.g = 0.0 end
	if colour.b < 0.0 then colour.b = 0.0 end

	return colour.a, colour.r, colour.g, colour.b
end
function MonkeyQuestTitle_OnEnter()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips == true then
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "DEFAULT" then
			GameTooltip_SetDefaultAnchor(GameTooltip, this)
		else
			GameTooltip:SetOwner(MonkeyQuestFrame, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor)
		end
		GameTooltip:SetText(MONKEYQUEST_NOOBTIP_HEADER, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
		GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_TITLE, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
		if MonkeySpeedFrame then GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_TITLE2, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1) end
		GameTooltip:Show()
	else
		GameTooltip_SetDefaultAnchor(GameTooltip, this)
		GameTooltip:SetText(MONKEYQUEST_TITLE_VERSION, MONKEYLIB_TITLE_COLOUR.r, MONKEYLIB_TITLE_COLOUR.g, MONKEYLIB_TITLE_COLOUR.b, 1)
		GameTooltip:AddLine(MONKEYQUEST_DESCRIPTION, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b, 1)
		if MonkeySpeedFrame then GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_TITLE2, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1) end
		GameTooltip:Show()
	end
end
function MonkeyQuestButton_OnLoad()
	this:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end
function MonkeyQuestButton_OnClick(button) -- TODO: Add Click showing quests on map
	local strQuestLogTitleText,strQuestLevel,strQuestTag,isHeader,isCollapsed,isComplete = GetQuestLogTitle(this.m_iQuestIndex)
	if isHeader then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[getglobal("MonkeyQuestHideButton"..this.id).m_strQuestLogTitleText].m_bChecked = 
			not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[getglobal("MonkeyQuestHideButton"..this.id).m_strQuestLogTitleText].m_bChecked
		MonkeyQuestFrame:Show()
		MonkeyQuest_Refresh()
	elseif IsShiftKeyDown() and (ChatFrameEditBox:IsVisible() or IsAddOnLoaded("GroupFinder") and GF_LFGDescriptionEditBoxHasFocus[1]) then -- Shift-Left -- TODO: Add pfQuest/Questie support
		if button == "LeftButton" then
			if IsAddOnLoaded("pfQuest") then
				local data = pfDatabase:GetIDByName(strQuestLogTitleText,"quests")
				for id,_ in data do
					if pfDB["quests"]["data"][id].lvl == strQuestLevel then
						if IsAddOnLoaded("GroupFinder") and GF_LFGDescriptionEditBoxHasFocus[1] then
							GF_LFGDescriptionEditBox:Insert(GF_GetDifficultyColor(strQuestLevel).."|Hquest:"..id..":"..strQuestLevel.."|h["..strQuestLogTitleText.."]|h|r") return
						else
							pfQuestCompat.InsertQuestLink(id, strQuestLogTitleText) return
						end
					end
				end
			elseif IsAddOnLoaded("GroupFinder") then
				local data = GF_WORD_QUEST[table.concat(GetModifiedQuestName(strQuestLogTitleText))]
				if data then
					if GF_LFGDescriptionEditBoxHasFocus[1] then
						GF_LFGDescriptionEditBox:Insert(GF_GetDifficultyColor(strQuestLevel).."|Hquest:"..data[1]..":"..data[2].."|h["..strQuestLogTitleText.."]|h|r") return
					else
						ChatFrameEditBox:Insert(GF_GetDifficultyColor(strQuestLevel).."|Hquest:"..data[1]..":"..data[2].."|h["..strQuestLogTitleText.."]|h|r") return
					end
				end
			end
			ChatFrameEditBox:Insert("|cffffff00|Hquest:0:"..strQuestLevel.."|h["..strQuestLogTitleText.."]|h|r")
		else
			local strChatObjectives = ""
			local tmpQuestLogSelection = GetQuestLogSelection()
			SelectQuestLogEntry(this.m_iQuestIndex)
			if GetNumQuestLeaderBoards() > 0 then
				for i=1, GetNumQuestLeaderBoards(), 1 do
					local strLeaderBoardText, strType, iFinished = GetQuestLogLeaderBoard(i)
					if strLeaderBoardText then strChatObjectives = strChatObjectives.."{"..strLeaderBoardText.."} " end
				end
			elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives then
				local strQuestDescription, strQuestObjectives = GetQuestLogQuestText()
				strChatObjectives = strChatObjectives.."{"..strQuestObjectives.."} "
			end
			ChatFrameEditBox:Insert(strChatObjectives)
			SelectQuestLogEntry(tmpQuestLogSelection)
		end
	elseif IsControlKeyDown() then
		if button == "LeftButton" then -- Ctrl-Left(Share Quest)
			SelectQuestLogEntry(this.m_iQuestIndex)
			if GetQuestLogPushable() and GetNumPartyMembers() > 0 then QuestLogPushQuest() end
		else
			SelectQuestLogEntry(this.m_iQuestIndex) -- Ctrl-Right(Abandon Quest)
			SetAbandonQuest()
			StaticPopup_Show("ABANDON_QUEST", GetAbandonQuestName())
		end
	elseif MkQL_SetQuest then -- Open MonkeyQuest Log if available
		if MkQL_Main_Frame:IsVisible() then
			if MkQL_global_iCurrQuest == this.m_iQuestIndex then
				MkQL_Main_Frame:Hide()
				return
			end
		end
		MkQL_SetQuest(this.m_iQuestIndex)
	else
		ShowUIPanel(QuestLogFrame)
		if MonkeyQuest.m_iNumEntries > QUESTS_DISPLAYED then
			if this.m_iQuestIndex < MonkeyQuest.m_iNumEntries - QUESTS_DISPLAYED then
				FauxScrollFrame_SetOffset(QuestLogListScrollFrame, this.m_iQuestIndex - 1)
				QuestLogListScrollFrameScrollBar:SetValue((this.m_iQuestIndex - 1) * QUESTLOG_QUEST_HEIGHT)
			else
				FauxScrollFrame_SetOffset(QuestLogListScrollFrame, MonkeyQuest.m_iNumEntries - QUESTS_DISPLAYED)
				QuestLogListScrollFrameScrollBar:SetValue((MonkeyQuest.m_iNumEntries - QUESTS_DISPLAYED) * QUESTLOG_QUEST_HEIGHT)
			end
		end
		SelectQuestLogEntry(this.m_iQuestIndex)
		QuestLog_SetSelection(this.m_iQuestIndex)
		QuestLog_Update()

		if pfMap then -- TODO: Add GroupFinder support once I add quest location info
			if button == "LeftButton" then
				local questIndex = GetQuestLogSelection()
				local questids = pfDatabase:GetQuestIDs(questIndex)
				local title = pfQuestCompat.GetQuestLogTitle(questIndex)
				local id = questids and tonumber(questids[1])
				if id and not IsShiftKeyDown() then
					local maps, meta = {}, { ["addon"] = "PFQUEST", ["qlogid"] = questIndex }
					maps = pfDatabase:SearchQuestID(id, meta, maps)
					pfMap:ShowMapID(pfDatabase:GetBestMap(maps))
				end
			else
				local questIndex = GetQuestLogSelection()
				local title = pfQuestCompat.GetQuestLogTitle(questIndex)
				pfMap:DeleteNode("PFQUEST", title)
			end
			if not IsShiftKeyDown() then HideUIPanel(QuestLogFrame) end
		end
	end
end
function MonkeyQuestButton_OnEnter()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "NONE" then return end
	local strQuestLogTitleText, strQuestLevel, strQuestTag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(this.m_iQuestIndex)
	if not strQuestLogTitleText then return end
	if isHeader then
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips == false then return end
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "DEFAULT" then
			GameTooltip_SetDefaultAnchor(GameTooltip, this)
		else
			GameTooltip:SetOwner(MonkeyQuestFrame, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor)
		end
		GameTooltip:SetText(MONKEYQUEST_NOOBTIP_HEADER, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
		GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_QUESTHEADER, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
		GameTooltip:Show()
		return
	end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "DEFAULT" then
		GameTooltip_SetDefaultAnchor(GameTooltip, this)
	else
		GameTooltip:SetOwner(MonkeyQuestFrame, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor)
	end
	GameTooltip:SetText(strQuestLogTitleText, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	GameTooltip:AddLine(this.m_strQuestObjectives, GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b, 1)
	GameTooltip:AddLine(strQuestTag, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
	local iNumPartyMembers = GetNumPartyMembers()
	local isOnQuest
	for i=1, iNumPartyMembers do
		isOnQuest = IsUnitOnQuest(this.m_iQuestIndex, "party"..i)
		if isOnQuest and isOnQuest == 1 then
			GameTooltip:AddLine(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour..UnitName("party"..i))
		else
			GameTooltip:AddLine(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour..UnitName("party"..i))
		end
	end
	GameTooltip:Show()
end
function MonkeyQuestHideButton_OnEnter()
	if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips == false then return end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "DEFAULT" then
		GameTooltip_SetDefaultAnchor(GameTooltip, this)
	else
		GameTooltip:SetOwner(MonkeyQuestFrame, MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor)
	end
	GameTooltip:SetText(MONKEYQUEST_NOOBTIP_HEADER, TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1)
	GameTooltip:AddLine(MONKEYQUEST_NOOBTIP_HIDEBUTTON, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
	GameTooltip:Show()
end
function MonkeyQuestHideButton_OnClick()
	if this:GetChecked() then
		PlaySound("igMainMenuOptionCheckBoxOff")
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[this.m_strQuestLogTitleText].m_bChecked = true
	else
		PlaySound("igMainMenuOptionCheckBoxOn")
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[this.m_strQuestLogTitleText].m_bChecked = false
	end
	MonkeyQuestFrame:Show()
	MonkeyQuest_Refresh()
end