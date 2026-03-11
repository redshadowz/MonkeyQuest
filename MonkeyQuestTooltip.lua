function MonkeyQuest_NEW_aftt_setName(unit)
	MonkeyQuest_OLD_aftt_setName(unit) -- call the original aftt setName function
	MonkeyQuest_SearchTooltip() -- Overwrite the aftt text with the quest objective completeness, if needed
end
function MonkeyQuest_NEW_ContainerFrameItemButton_OnEnter()
	MonkeyQuest_OLD_ContainerFrameItemButton_OnEnter() -- call the old (probably blizzard's) GameTooltip_OnEvent()
	MonkeyQuest_SearchTooltip()
	MonkeyQuest_SearchTooltipForRelevantQuest()
end
function MonkeyQuest_SearchTooltip()
	local ii,jj
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowTooltipObjectives == false then return false end
	if not GameTooltip then return false end
	if not getglobal('GameTooltipTextLeft1'):IsVisible() then return false end
	
	if getglobal('GameTooltipTextLeft1'):GetText() then if MonkeyQuest_SearchQuestListItem(getglobal('GameTooltipTextLeft1'):GetText()) == true then return true end end
end
function MonkeyQuest_SearchQuestListItem(strSearch)
	if not strSearch then return false end

	local i,j,length,iStrKeySize,iStrSearchSize
	for key,value in MonkeyQuest.m_aQuestItemList do
		i,j = string.find(strSearch, key)
		iStrKeySize = string.len(key)
		iStrSearchSize = string.len(strSearch)
		if string.find(strSearch, "|c") then iStrSearchSize = iStrSearchSize - 10 end
		if i and i ~= j and iStrSearchSize == iStrKeySize then
			if aftt_textline1 then aftt_textline1:SetText(strSearch .. " " .. MONKEYQUEST_TOOLTIP_QUESTITEM .. " " .. value.m_iNumItems .. "/" .. value.m_iNumNeeded) end

			local colourTip = {a = 1.0, r = 1.0, g = 1.0, b = 1.0}
			colourTip.a, colourTip.r, colourTip.g, colourTip.b = MonkeyQuest_GetCompletenessColorStr(value.m_iNumItems, value.m_iNumNeeded)
			GameTooltip:AddLine(MONKEYQUEST_TOOLTIP_QUESTITEM .. " " .. value.m_iNumItems .. "/" .. value.m_iNumNeeded, colourTip.r, colourTip.g, colourTip.b, 1)
			length = getglobal(GameTooltip:GetName() .. "TextLeft" .. GameTooltip:NumLines()):GetStringWidth()
			length = length + 22
			GameTooltip:SetHeight(GameTooltip:GetHeight() + 14)
			if length > GameTooltip:GetWidth() then GameTooltip:SetWidth(length) end
			return true
		end
	end
end
function MonkeyQuest_SearchTooltipForRelevantQuest()
	if not GameTooltip or not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowTooltipObjectives or  not GameTooltipTextLeft1:IsVisible() then return end
	local ii,jj
	if getglobal('GameTooltipTextLeft1'):GetText() then
	   	strRelevantQuest = MonkeyQuest_SearchQuestDetails(getglobal('GameTooltipTextLeft1'):GetText())
		if strRelevantQuest then
		   	GameTooltip:AddLine(MONKEYQUEST_TOOLTIP_QUEST .. ": " .. strRelevantQuest, MONKEYQUEST_DEFAULT_CRASHCOLOUR.r, MONKEYQUEST_DEFAULT_CRASHCOLOUR.g, MONKEYQUEST_DEFAULT_CRASHCOLOUR.b, 1)
			length = getglobal(GameTooltip:GetName() .. "TextLeft" .. GameTooltip:NumLines()):GetStringWidth()
			length = length + 22
			GameTooltip:SetHeight(GameTooltip:GetHeight() + 14)
			if length > GameTooltip:GetWidth() then GameTooltip:SetWidth(length) end
			return true
		end
	end
end
function MonkeyQuest_SearchQuestDetails(strSearch)
	if not strSearch then return end
	
	local strQuestLogTitleText,strQuestLevel,strQuestTag,isHeader,isCollapsed,isComplete
	local i,j,k
	local iNumEntries, iNumQuests = GetNumQuestLogEntries()
	local strQuestDescription, strQuestObjectives
	for i=1, iNumEntries, 1 do
		-- strQuestLogTitleText		the title text of the quest, may be a header (ex. Wetlands)
		-- strQuestLevel			the level of the quest
		-- strQuestTag				the tag on the quest (ex. COMPLETED)
		strQuestLogTitleText, strQuestLevel, strQuestTag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
		if not isHeader then
			SelectQuestLogEntry(i)
			strQuestDescription, strQuestObjectives = GetQuestLogQuestText()
			if string.find(strQuestDescription, strSearch) or string.find(strQuestObjectives, strSearch) then return strQuestLogTitleText end
		end
	end
end