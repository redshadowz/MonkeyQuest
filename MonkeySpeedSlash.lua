function MonkeySpeed_TogglePercent()
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent = false
		MonkeySpeedText:Hide()
	else
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent = true
		MonkeySpeedText:Show()
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeed_ToggleBar()
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar = false
		MonkeySpeedBar:Hide()
	else
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar = true
		MonkeySpeedBar:Show()
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeed_ToggleDisplay()
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = false
		MonkeySpeedFrame:Hide()
	else
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = true
		MonkeySpeedFrame:Show()
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeed_ToggleDebug()
	MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDebugMode = not MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDebugMode
end
function MonkeySpeed_ToggleLock()
	MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bLocked = not MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bLocked
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeedSlash_CmdShowPercent(bShow)
	if bShow == true then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent = true
		MonkeySpeedText:Show()
	else
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent = false
		MonkeySpeedText:Hide()
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeedSlash_CmdShowBar(bShow)
	if bShow == true then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar = true
		MonkeySpeedBar:Show()
	else
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar = false
		MonkeySpeedBar:Hide()
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeedSlash_CmdOpen(bOpen)
	if bOpen == true then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = true
		MonkeySpeedFrame:Show()
	else
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = false
		MonkeySpeedFrame:Hide()
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end

function MonkeySpeedSlash_CmdLock(bLock)
	MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bLocked = bLock
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeedSlash_CmdCalibrate()
	MonkeySpeed.m_bCalibrate = true
end
function MonkeySpeedSlash_CmdSetWidth(iWidth)
	if iWidth >= 48 and iWidth <= 256 then
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_iFrameWidth = iWidth
		MonkeySpeedFrame:SetWidth(MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_iFrameWidth)
		MonkeySpeedBar:SetWidth(MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_iFrameWidth - 10)
	end
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
function MonkeySpeedSlash_CmdReset()
	StaticPopup_Show("MONKEYSPEED_RESET")
end
