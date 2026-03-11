StaticPopupDialogs["MONKEYQUEST_RESET"] = {
	text = TEXT(MONKEYQUEST_CONFIRM_RESET),
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()
		MonkeyQuestInit_ResetConfig()
		if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_RESET_MSG) end
	end,
	timeout = 0,
	exclusive = 1
}
function MonkeyQuestSlash_Init()
	SlashCmdList["MONKEYQUEST_DISPLAY"] = MonkeyQuestSlash_Parse
	SLASH_MONKEYQUEST_DISPLAY1 = "/monkeyquest"
	SLASH_MONKEYQUEST_DISPLAY2 = "/mquest"
end
function MonkeyQuestSlash_Parse(msg)
	if not msg or msg == "" or string.find(msg, "help") then local i,j = string.find(msg, "help") if i then MonkeyQuestSlash_CmdHelp(string.lower(string.sub(msg, j+2))) else MonkeyQuestSlash_CmdHelp() end return end
	if string.lower(msg) == "reset" then MonkeyQuestSlash_CmdReset()
	elseif string.lower(msg) == "open" then MonkeyQuestSlash_CmdOpen(true)
	elseif string.lower(msg) == "close" then MonkeyQuestSlash_CmdOpen(false)
	elseif string.lower(msg) == "showhidden" then MonkeyQuestSlash_CmdShowHidden(true)
	elseif string.lower(msg) == "hidehidden" then MonkeyQuestSlash_CmdShowHidden(false)
	elseif string.lower(msg) == "useoverviews" then MonkeyQuestSlash_CmdUseOverviews(true)
	elseif string.lower(msg) == "nooverviews" then MonkeyQuestSlash_CmdUseOverviews(false)
	elseif string.lower(msg) == "hideheaders" then MonkeyQuestSlash_CmdHideHeaders(true)
	elseif string.lower(msg) == "showheaders" then MonkeyQuestSlash_CmdHideHeaders(false)
	elseif string.lower(msg) == "hideborder" then MonkeyQuestSlash_CmdHideBorder(true)
	elseif string.lower(msg) == "showborder" then MonkeyQuestSlash_CmdHideBorder(false)
	elseif string.lower(msg) == "growup" then MonkeyQuestSlash_CmdGrowUp(true)
	elseif string.lower(msg) == "growdown" then MonkeyQuestSlash_CmdGrowUp(false)
	elseif string.find(msg, "alpha") then local i,j = string.find(msg, "%d+") if i then MonkeyQuestSlash_CmdAlpha(tonumber(string.sub(msg, i, j), 10)) end
	elseif string.find(msg, "width") then local i,j = string.find(msg, "%d+") if i then MonkeyQuestSlash_CmdWidth(tonumber(string.sub(msg, i, j), 10)) end
	elseif string.find(msg, "fontheight") then local i,j = string.find(msg, "%d+") if i then MonkeyQuestSlash_CmdFontHeight(tonumber(string.sub(msg, i, j), 10)) end
	elseif string.find(msg, "tipanchor") then local i,j = string.find(msg, "=") if i then MonkeyQuestSlash_CmdTipAnchor(string.sub(msg, i + 1)) end
	elseif string.lower(msg) == "shownumquests" then MonkeyQuestSlash_CmdShowNumQuests(true)
	elseif string.lower(msg) == "hidenumquests" then MonkeyQuestSlash_CmdShowNumQuests(false)
	elseif string.lower(msg) == "lock" then MonkeyQuestSlash_CmdLock(true)
	elseif string.lower(msg) == "unlock" then MonkeyQuestSlash_CmdLock(false)
	elseif string.lower(msg) == "colourtitleon" or string.lower(msg) == "colortitleon" then MonkeyQuestSlash_CmdColourTitleOn(true)	
	elseif string.lower(msg) == "colourtitleoff" or string.lower(msg) == "colortitleoff" then MonkeyQuestSlash_CmdColourTitleOn(false)	
	elseif string.lower(msg) == "hidecompletedquests" then MonkeyQuestSlash_CmdHideCompletedQuests(true)
	elseif string.lower(msg) == "showcompletedquests" then MonkeyQuestSlash_CmdHideCompletedQuests(false)
	elseif string.lower(msg) == "hidecompletedobjectives" then MonkeyQuestSlash_CmdHideCompletedObjectives(true)
	elseif string.lower(msg) == "showcompletedobjectives" then MonkeyQuestSlash_CmdHideCompletedObjectives(false)
	elseif string.lower(msg) == "showtooltipobjectives" then MonkeyQuestSlash_CmdShowTooltipObjectives(true)
	elseif string.lower(msg) == "hidetooltipobjectives" then MonkeyQuestSlash_CmdShowTooltipObjectives(false)
	elseif string.lower(msg) == "allowrightclick" then MonkeyQuestSlash_CmdAllowRightClick(true)
	elseif string.lower(msg) == "disallowrightclick" then MonkeyQuestSlash_CmdAllowRightClick(false)
	elseif string.lower(msg) == "hidetitlebuttons" then MonkeyQuestSlash_CmdHideTitleButtons(true)
	elseif string.lower(msg) == "showtitlebuttons" then MonkeyQuestSlash_CmdHideTitleButtons(false)
	elseif string.lower(msg) == "hidetitle" then MonkeyQuestSlash_CmdHideTitle(true)
	elseif string.lower(msg) == "showtitle" then MonkeyQuestSlash_CmdHideTitle(false)
	else MonkeyQuestSlash_CmdHelp() end
end
function MonkeyQuestSlash_CmdHelp(strCommand)
	if not DEFAULT_CHAT_FRAME then return end
	if not strCommand then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_MSG)
	elseif strCommand == "reset" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_RESET_MSG)
	elseif strCommand == "open" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_OPEN_MSG)
	elseif strCommand == "close" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_CLOSE_MSG)
	elseif strCommand == "showhidden" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWHIDDEN_MSG)
	elseif strCommand == "hidehidden" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDEHIDDEN_MSG)
	elseif strCommand == "useoverviews" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_USEOVERVIEWS_MSG)
	elseif strCommand == "nooverviews" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_NOOVERVIEWS_MSG)
	elseif strCommand == "tipanchor" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_TIPANCHOR_MSG)
	elseif strCommand == "alpha" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_ALPHA_MSG)
	elseif strCommand == "width" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_WIDTH_MSG)
	elseif strCommand == "fontheight" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_FONTHEIGHT_MSG)
	elseif strCommand == "hideheaders" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDEHEADERS_MSG)
	elseif strCommand == "showheaders" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWHEADERS_MSG)
	elseif strCommand == "hideborder" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDEBORDER_MSG)
	elseif strCommand == "showborder" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWBORDER_MSG)
	elseif strCommand == "growup" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_GROWUP_MSG)
	elseif strCommand == "growdown" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_GROWDOWN_MSG)
	elseif strCommand == "hidenumquests" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDENUMQUESTS_MSG)
	elseif strCommand == "shownumquests" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWNUMQUESTS_MSG)
	elseif strCommand == "lock" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_LOCK_MSG)
	elseif strCommand == "unlock" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_UNLOCK_MSG)
	elseif strCommand == "colourtitleon" or strCommand == "colortitleon" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_COLOURTITLEON_MSG)
	elseif strCommand == "colourtitleoff" or strCommand == "colortitleoff" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_COLOURTITLEOFF_MSG)
	elseif strCommand == "hidecompletedquests" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDECOMPLETEDQUESTS_MSG)
	elseif strCommand == "showcompletedquests" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWCOMPLETEDQUESTS_MSG)
	elseif strCommand == "hidecompletedobjectives" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDECOMPLETEDOBJECTIVES_MSG)
	elseif strCommand == "showcompletedobjectives" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWCOMPLETEDOBJECTIVES_MSG)
	elseif strCommand == "fontheight" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_FONTHEIGHT_MSG)
	elseif strCommand == "showtooltipobjectives" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWTOOLTIPOBJECTIVES_MSG)
	elseif strCommand == "hidetooltipobjectives" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDETOOLTIPOBJECTIVES_MSG)
	elseif strCommand == "allowrightclick" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_ALLOWRIGHTCLICK_MSG)
	elseif strCommand == "disallowrightclick" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_DISALLOWRIGHTCLICK_MSG)
	elseif strCommand == "hidetitlebuttons" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_HIDETITLEBUTTONS_MSG)
	elseif strCommand == "showtitlebuttons" then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_SHOWTITLEBUTTONS_MSG)
	else DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_HELP_MSG) end
end
function MonkeyQuestSlash_CmdReset()
	StaticPopup_Show("MONKEYQUEST_RESET")
end
function MonkeyQuestSlash_CmdOpen(bOpen)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay = bOpen
	if bOpen then MonkeyQuest_Show() else MonkeyQuest_Hide() end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdShowHidden(bShow)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden = bShow
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdUseOverviews(bOverviews)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives = bOverviews
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdHideHeaders(bHide)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoHeaders = bHide
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdAlwaysHeaders(bAlways)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAlwaysHeaders = bAlways
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdHideBorder(bNoBorder)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder = bNoBorder
	if bNoBorder == true then
		MonkeyQuestFrame:SetBackdropBorderColor(0.0, 0.0, 0.0, 0.0)
	elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashBorder == true then
		MonkeyQuestFrame:SetBackdropBorderColor(MONKEYQUEST_DEFAULT_CRASHCOLOUR.r, MONKEYQUEST_DEFAULT_CRASHCOLOUR.g, MONKEYQUEST_DEFAULT_CRASHCOLOUR.b, 1.0)
	else
		MonkeyQuestFrame:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1.0)
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdGrowUp(bGrowUp)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp = bGrowUp
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdAlpha(iAlpha)
	if iAlpha >= 0 and iAlpha <= 255 then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha = iAlpha / 255
		MonkeyQuest_SetAlpha(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha)
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdWidth(iWidth)
	if iWidth >= 200 and iWidth <= 600 then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth = iWidth
		MonkeyQuestFrame:SetWidth(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth)
		MonkeyQuest_Refresh()
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdFontHeight(iHeight)
	if iHeight >= 8 and iHeight <= 48 then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFontHeight = iHeight
		MonkeyQuest_Refresh()
		MonkeyQuestFrame:SetScale(2)
		MonkeyQuestFrame:SetScale(1)
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdTipAnchor(strAnchor)
	if not strAnchor then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "DEFAULT" end
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_TOPLEFT" -- default
	if string.upper(strAnchor) == "ANCHOR_TOPLEFT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_TOPRIGHT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_TOP" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_LEFT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_RIGHT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_BOTTOMLEFT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_BOTTOMRIGHT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_BOTTOM" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "ANCHOR_CURSOR" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "DEFAULT" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor)
	elseif string.upper(strAnchor) == "NONE" then MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = string.upper(strAnchor) end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdShowNumQuests(bShowNumQuests)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNumQuests = bShowNumQuests
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdLock(bLocked)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bLocked = bLocked
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdColourTitleOn(bColourTitle)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bColourTitle = bColourTitle
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdHideCompletedQuests(bHide)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedQuests = bHide
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdHideCompletedObjectives(bHide)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideCompletedObjectives = bHide
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdShowTooltipObjectives(bShow)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowTooltipObjectives = bShow
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdAllowRightClick(bAllow)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bAllowRightClick = bAllow
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdHideTitleButtons(bHide)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitleButtons = bHide
	if bHide then
		MonkeyQuestCloseButton:Hide()
		MonkeyQuestMinimizeButton:Hide()
		MonkeyQuestShowHiddenCheckButton:Hide()
	else
		MonkeyQuestCloseButton:Show()
		MonkeyQuestMinimizeButton:Show()
		MonkeyQuestShowHiddenCheckButton:Show()
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdHideTitle(bHide)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bHideTitle = bHide
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleDisplay()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDisplay then MonkeyQuest_Hide() else MonkeyQuest_Show() end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleShowHidden()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden = not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowHidden
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleObjectives()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives = not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bObjectives
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleAnchor()
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDefaultAnchor then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDefaultAnchor = false
	else
		if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "ANCHOR_BOTTOMRIGHT" then
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_BOTTOMLEFT"
		elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "ANCHOR_BOTTOMLEFT" then
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_TOPLEFT"
		elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "ANCHOR_TOPLEFT" then
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_LEFT"
		elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "ANCHOR_LEFT" then
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_CURSOR"
		elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor == "ANCHOR_CURSOR" then
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bDefaultAnchor = true
			MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_strAnchor = "ANCHOR_BOTTOMRIGHT"
		end
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_Alpha(msg)
	if tonumber(msg, 10) then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha = tonumber(msg, 10)
	else
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha = MONKEYQUEST_DEFAULT_ALPHA
	end
	MonkeyQuest_SetAlpha(MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iAlpha)
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_Width(msg)
	if tonumber(msg, 10) then
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth = tonumber(msg, 10)
	else
		MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iFrameWidth = MONKEYQUEST_DEFAULT_WIDTH
	end
	MonkeyQuest_Refresh()
	if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(MONKEYQUEST_SET_WIDTH_MSG) end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleNoHeaders()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoHeaders = not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoHeaders
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleNoBorder()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder = not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder
	if MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bNoBorder == true then
		MonkeyQuestFrame:SetBackdropBorderColor(0.0, 0.0, 0.0, 0.0)
	elseif MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bCrashBorder == false then
		MonkeyQuestFrame:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, 1.0)
	else
		MonkeyQuestFrame:SetBackdropBorderColor(MONKEYQUEST_DEFAULT_CRASHCOLOUR.r, MONKEYQUEST_DEFAULT_CRASHCOLOUR.g, MONKEYQUEST_DEFAULT_CRASHCOLOUR.b, 1.0)
	end
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_ToggleGrow()
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp = not MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bGrowUp
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdShowNoobTips(bShowNoobTips)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowNoobTips = bShowNoobTips
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdSetQuestPadding(iPadding)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_iQuestPadding = iPadding
	for i=2, MONKEYQUEST_MAX_BUTTONS, 1 do
		getglobal("MonkeyQuestButton" .. i):SetPoint("TOPLEFT", "MonkeyQuestButton" .. (i - 1), "BOTTOMLEFT", 0, -iPadding)
	end
	MonkeyQuest_Resize()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdShowZoneHighlight(bShowZoneHighlight)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowZoneHighlight = bShowZoneHighlight
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
function MonkeyQuestSlash_CmdShowQuestLevel(bShowQuestLevel)
	MonkeyQuestConfig[MonkeyQuest.m_strPlayer].m_bShowQuestLevel = bShowQuestLevel
	MonkeyQuest_Refresh()
	if MonkeyBuddyQuestFrame_Refresh then MonkeyBuddyQuestFrame_Refresh() end
end
