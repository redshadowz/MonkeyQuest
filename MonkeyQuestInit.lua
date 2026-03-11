function MonkeyQuestInit_LoadConfig()
	MonkeyQuest.m_strPlayer = GetCVar("realmName").."|"..UnitName('player')
	if not MonkeyQuestConfig then MonkeyQuestConfig = {} end
	if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer] then MonkeyQuestConfig[MonkeyQuest.m_strPlayer] = {} end

	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_TOPLEFT" end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha = MONKEYQUEST_DEFAULT_ALPHA end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameAlpha == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameAlpha = MONKEYQUEST_DEFAULT_FRAME_ALPHA end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList = {} end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth = MONKEYQUEST_DEFAULT_WIDTH end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoHeaders == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoHeaders = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAlwaysHeaders == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAlwaysHeaders = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNumQuests == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNumQuests = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLocked == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLocked = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedQuests == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedQuests = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedObjectives == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedObjectives = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAllowRightClick == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAllowRightClick = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowTooltipObjectives == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowTooltipObjectives = true end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitleButtons == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitleButtons = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitle == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitle = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bColourTitle == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bColourTitle = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strQuestTitleColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strQuestTitleColour = MONKEYQUEST_DEFAULT_QUESTTITLECOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strHeaderOpenColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strHeaderOpenColour = MONKEYQUEST_DEFAULT_HEADEROPENCOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strHeaderClosedColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strHeaderClosedColour = MONKEYQUEST_DEFAULT_HEADERCLOSEDCOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strOverviewColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strOverviewColour = MONKEYQUEST_DEFAULT_OVERVIEWCOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strSpecialObjectiveColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strSpecialObjectiveColour = MONKEYQUEST_DEFAULT_SPECIALOBJECTIVECOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strInitialObjectiveColour = MONKEYQUEST_DEFAULT_INITIALOBJECTIVECOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strMidObjectiveColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strMidObjectiveColour = MONKEYQUEST_DEFAULT_MIDOBJECTIVECOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strCompleteObjectiveColour = MONKEYQUEST_DEFAULT_COMPLETEOBJECTIVECOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strZoneHighlightColour == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strZoneHighlightColour = MONKEYQUEST_DEFAULT_ZONEHILIGHTCOLOUR end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight = 12 end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashFont == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashFont = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashBorder == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashBorder = false end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips = MONKEYQUEST_DEFAULT_SHOWNOOBTIPS end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iQuestPadding == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iQuestPadding = MONKEYQUEST_DEFAULT_QUESTPADDING end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowZoneHighlight == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowZoneHighlight = MONKEYQUEST_DEFAULT_SHOWZONEHIGHLIGHT end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowQuestLevel == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowQuestLevel = MONKEYQUEST_DEFAULT_SHOWQUESTLEVEL end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == nil then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB = false end
	if not IsAddOnLoaded("BhaldieInfoBar") and MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB == true then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLockBIB = false
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_TOPLEFT"
	end
	MonkeyQuestInit_ApplySettings()
end
function MonkeyLib_ColourStrToARGB(strColour)
	local i = 3
	local iAlpha = tonumber(string.sub(strColour, i, i+1), 16)
	local iRed = tonumber(string.sub(strColour, i+2, i+3), 16)
	local iGreen = tonumber(string.sub(strColour, i+4, i+5), 16)
	local iBlue = tonumber(string.sub(strColour, i+6, i+7), 16)
	iAlpha = iAlpha/255
	iRed = iRed/255
	iGreen = iGreen/255
	iBlue = iBlue/255
	return iAlpha,iRed,iGreen,iBlue
end
function MonkeyLib_ARGBToColourStr(iAlpha,iRed,iGreen,iBlue)
	iAlpha = floor(iAlpha * 255)
	iRed = floor(iRed * 255)
	iGreen = floor(iGreen * 255)
	iBlue = floor(iBlue * 255)
	return format("|c%2x%2x%2x%2x", iAlpha, iRed, iGreen, iBlue)
end
function MonkeyLib_DebugMsg(strMsg)
	if MONKEYLIB_DEBUG and DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("MonkeyLib: " .. strMsg) end
end
function MonkeyQuestInit_CleanQuestList()
	local iNumEntries, iNumQuests = GetNumQuestLogEntries()
	local tmpQuestLogSelection = GetQuestLogSelection();	
	MonkeyQuest.m_iNumEntries = iNumEntries
	for i = 1, iNumEntries, 1 do
		-- strQuestLogTitleText		the title text of the quest, may be a header (ex. Wetlands)
		-- strQuestLevel			the level of the quest
		-- strQuestTag				the tag on the quest (ex. COMPLETED)
		local strQuestLogTitleText, strQuestLevel, strQuestTag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
		MonkeyQuest.m_aQuestList[strQuestLogTitleText] = {}
		if not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText] then
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText] = {}
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked = true
		end
		MonkeyQuest.m_aQuestList[strQuestLogTitleText].m_bChecked =  MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked
	end
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList = {}
	MonkeyQuest.m_aQuestItemList = {}
	for i = 1, iNumEntries, 1 do
		-- strQuestLogTitleText		the title text of the quest, may be a header (ex. Wetlands)
		-- strQuestLevel			the level of the quest
		-- strQuestTag				the tag on the quest (ex. COMPLETED)
		local strQuestLogTitleText, strQuestLevel, strQuestTag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText] = {}
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_aQuestList[strQuestLogTitleText].m_bChecked = MonkeyQuest.m_aQuestList[strQuestLogTitleText].m_bChecked
		SelectQuestLogEntry(i)
		if GetNumQuestLeaderBoards() > 0 then
			for ii = 1, GetNumQuestLeaderBoards(), 1 do
				MonkeyQuest_AddQuestItemToList(GetQuestLogLeaderBoard(ii))
			end
		end
	end
	SelectQuestLogEntry(tmpQuestLogSelection)
	MonkeyQuest.m_aQuestList = nil
end
function MonkeyQuestInit_ResetConfig()
	MonkeyQuestConfig = {}
	MonkeyQuestInit_LoadConfig()
end
function MonkeyQuestInit_Font(bCrashFont)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashFont = bCrashFont
	if bCrashFont then
		MonkeyQuestInit_SetButtonFonts("Interface\\AddOns\\MonkeyQuest\\Fonts\\myriapsc.ttf", MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight)
	else
		MonkeyQuestInit_SetButtonFonts("Interface\\AddOns\\MonkeyQuest\\Fonts\\framd.ttf", MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight)
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestInit_Border(bCrashBorder)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashBorder = bCrashBorder
	if bCrashBorder then
		MonkeyQuest.m_colourBorder.r = MONKEYQUEST_DEFAULT_CRASHCOLOUR.r
		MonkeyQuest.m_colourBorder.g = MONKEYQUEST_DEFAULT_CRASHCOLOUR.g
		MonkeyQuest.m_colourBorder.b = MONKEYQUEST_DEFAULT_CRASHCOLOUR.b
	else
		MonkeyQuest.m_colourBorder.r = TOOLTIP_DEFAULT_COLOR.r
		MonkeyQuest.m_colourBorder.g = TOOLTIP_DEFAULT_COLOR.g
		MonkeyQuest.m_colourBorder.b = TOOLTIP_DEFAULT_COLOR.b
	end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder == true then
		MonkeyQuestFrame:SetBackdropBorderColor(0.0, 0.0, 0.0, 0.0)
	else
		MonkeyQuestFrame:SetBackdropBorderColor(MonkeyQuest.m_colourBorder.r, MonkeyQuest.m_colourBorder.g, MonkeyQuest.m_colourBorder.b, 1.0)
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestInit_SetButtonFonts(strFontName, iFontHeight)
	for i = 1, MonkeyQuest.m_iNumQuestButtons, 1 do getglobal("MonkeyQuestButton" .. i .. "Text"):SetFont(strFontName, iFontHeight) end
end
function MonkeyQuestInit_ApplySettings()
	MonkeyQuestInit_Font(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashFont)
	MonkeyQuestInit_Border(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashBorder)
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay == true then
		MonkeyQuestFrame:Show()
	else
		MonkeyQuestFrame:Hide()
	end
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bMinimized == true then
		MonkeyQuestMinimizeButton:SetNormalTexture("Interface\\AddOns\\MonkeyQuest\\Textures\\MinimizeButton-Down")
	else
		MonkeyQuestMinimizeButton:SetNormalTexture("Interface\\AddOns\\MonkeyQuest\\Textures\\MinimizeButton-Up")
	end
	MonkeyQuestSlash_CmdHideTitleButtons(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitleButtons)
	MonkeyQuest_SetAlpha(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha)
	MonkeyQuest_SetFrameAlpha(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameAlpha)
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder == true then
		MonkeyQuestFrame:SetBackdropBorderColor(0.0, 0.0, 0.0, 0.0)
	else
		MonkeyQuestFrame:SetBackdropBorderColor(MonkeyQuest.m_colourBorder.r, MonkeyQuest.m_colourBorder.g, MonkeyQuest.m_colourBorder.b, 1.0)
	end
	MonkeyQuestFrame:SetWidth(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth)
	MonkeyQuestSlash_CmdSetQuestPadding(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iQuestPadding)
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end