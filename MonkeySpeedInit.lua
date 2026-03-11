StaticPopupDialogs["MONKEYSPEED_RESET"] = {
	text = TEXT(MONKEYSPEED_CONFIRM_RESET),
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function() MonkeySpeed_ResetConfig() end,
	timeout = 0,
	exclusive = 1
}
local MS_TURTLE_SERVERS_LIST = { ["Nordanaar"] = true, ["Tel'Abim"] = true, ["Ambershire"] = true }
function MonkeySpeed_Init()
	MonkeySpeed.m_strPlayer = GetCVar("realmName").."|"..UnitName("player")
	if not MonkeySpeedConfig then MonkeySpeedConfig = {} end
	if not MonkeySpeedConfig[MonkeySpeed.m_strPlayer] then MonkeySpeedConfig[MonkeySpeed.m_strPlayer] = {} end

	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay = false end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent = true end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar = true end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_fUpdateRate == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_fUpdateRate = 0.5 end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDebugMode == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDebugMode = false end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bLocked == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bLocked = false end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_iFrameWidth == nil then MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_iFrameWidth = 60 end

	if MonkeySpeedConfig.Baseline == nil then
		if not MS_TURTLE_SERVERS_LIST[GetRealmName()] then
MonkeySpeedConfig.Baseline = {
{
	{zid=1, rate=0.00182}, -- Ashenvale
	{zid=2, rate=0.00207}, -- Azshara
	{zid=3, rate=0.00160}, -- Darkshore
	{zid=4, rate=0.00992}, -- Darnassus
	{zid=5, rate=0.00234}, -- Desolace
	{zid=6, rate=0.00199}, -- Durotar
	{zid=7, rate=0.00200}, -- Dustwallow Marsh
	{zid=8, rate=0.00183}, -- Felwood
	{zid=9, rate=0.00151}, -- Feralas
	{zid=10, rate=0.00455}, -- Moonglade
	{zid=11, rate=0.00204}, -- Mulgore
	{zid=12, rate=0.00748}, -- Orgrimmar
	{zid=13, rate=0.00151}, -- Silithus
	{zid=14, rate=0.00215}, -- Stonetalon Mtns
	{zid=15, rate=0.00152}, -- Tanaris
	{zid=16, rate=0.00206}, -- Rut'theran Village
	{zid=17, rate=0.00104}, -- The Barrens
	{zid=18, rate=0.00239}, -- Thousand Needles
	{zid=19, rate=0.01006}, -- Thunderbluff
	{zid=20, rate=0.00284}, -- Un'Goro Crater
	{zid=21, rate=0.00148}, -- Winterspring
	{zid=22, rate=0.0001}, --
	{zid=23, rate=0.0001}, --
	{zid=24, rate=0.0001}, --
	{zid=25, rate=0.0001}, --
},
{
	{zid=1, rate=0.00375}, -- Alterac Mtns
	{zid=2, rate=0.00292}, -- Arathi Highlands
	{zid=3, rate=0.0042}, -- Badlands
	{zid=4, rate=0.00313}, -- Blasted Lands
	{zid=5, rate=0.00359}, -- Burning Steppes
	{zid=6, rate=0.00420}, -- Deadwind Pass
	{zid=7, rate=0.00213}, -- Dun Morogh
	{zid=8, rate=0.00389}, -- Duskwood
	{zid=9, rate=0.00271}, -- Eastern Plaguelands
	{zid=10, rate=0.00302}, -- Elwynn Forest
	{zid=11, rate=0.00328}, -- Hillsbrad
	{zid=12, rate=0.01327}, -- Ironforge
	{zid=13, rate=0.00381}, -- Loch Modan
	{zid=14, rate=0.00484}, -- Redridge Mtns
	{zid=15, rate=0.00471}, -- Searing Gorge
	{zid=16, rate=0.00250}, -- Silverpine Forest
	{zid=17, rate=0.00781}, -- Stormwind
	{zid=18, rate=0.00165}, -- Stranglethorn Vale
	{zid=19, rate=0.00458}, -- Swamp of Sorrows
	{zid=20, rate=0.00273}, -- Hinterlands
	{zid=21, rate=0.00232}, -- Tirisfal Glades
	{zid=22, rate=0.01094}, -- Undercity
	{zid=23, rate=0.00244}, -- Western Plaguelands
	{zid=24, rate=0.00300}, -- Westfall
	{zid=25, rate=0.00254}, -- Wetlands
 }, }
		else
MonkeySpeedConfig.Baseline = {
{ -- [1]
	{zid=1, rate=0.00184}, -- Ashenvale
	{zid=2, rate=0.00210}, -- Azshara
	{zid=3, rate=0.00160}, -- Blackstone Island ?
	{zid=4, rate=0.00992}, -- Caverns of Time ?
	{zid=5, rate=0.00162}, -- Darkshore
	{zid=6, rate=0.01001}, -- Darnassus
	{zid=7, rate=0.00236}, -- Desolace
	{zid=8, rate=0.00234}, -- Dire Maul ?
	{zid=9, rate=0.00201}, -- Durotar
	{zid=10, rate=0.00202}, -- Dustwallow Marsh
	{zid=11, rate=0.00184}, -- Felwood
	{zid=12, rate=0.00152}, -- Feralas
	{zid=13, rate=0.00151}, -- GM Island ?
	{zid=14, rate=0.00151}, -- Gates of Ahn'Qiraj ?
	{zid=15, rate=0.00151}, -- Hyjal ?
	{zid=16, rate=0.00151}, -- Icepoint Rock ?
	{zid=17, rate=0.00151}, -- Maraudon ?
	{zid=18, rate=0.00459}, -- Moonglade
	{zid=19, rate=0.00204}, -- Mulgore
	{zid=20, rate=0.00748}, -- Orgrimmar
	{zid=21, rate=0.00304}, -- Silithus
	{zid=22, rate=0.00176}, -- Stonetalon Mountains
	{zid=23, rate=0.00154}, -- Tanaris
	{zid=24, rate=0.00328}, -- Tel'Abim ?
	{zid=25, rate=0.00208}, -- Teldrassil
	{zid=26, rate=0.00105}, -- The Barrens
	{zid=27, rate=0.00241}, -- Thousand Needles
	{zid=28, rate=0.01006}, -- Thunderbluff
	{zid=29, rate=0.00286}, -- Un'Goro Crater
	{zid=30, rate=0.00284}, -- Wailing Caverns ?
	{zid=31, rate=0.00149}, -- Winterspring
},
{ -- [2]
	{zid=1, rate=0.00375}, -- Alah'Thalas ?
	{zid=2, rate=0.00375}, -- Alterac Mountains
	{zid=3, rate=0.00292}, -- Arathi Highlands
	{zid=4, rate=0.00425}, -- Badlands
	{zid=5, rate=0.00343}, -- Balor
	{zid=6, rate=0.00420}, -- Blackrock Mountain ?
	{zid=7, rate=0.00317}, -- Blasted Lands
	{zid=8, rate=0.00362}, -- Burning Steppes
	{zid=9, rate=0.00424}, -- Deadwind Pass
	{zid=10, rate=0.00215}, -- Dun Morogh
	{zid=11, rate=0.00393}, -- Duskwood
	{zid=12, rate=0.00271}, -- Eastern Plaguelands
	{zid=13, rate=0.00305}, -- Elywnn Forest
	{zid=14, rate=0.00343}, -- Gillijim's Isle
	{zid=15, rate=0.00471}, -- Gilneas ?
	{zid=16, rate=0.00250}, -- Gnomeregan ?
	{zid=17, rate=0.00197}, -- Grim Reaches
	{zid=18, rate=0.00330}, -- Hillsbrad Foothills
	{zid=19, rate=0.01341}, -- Ironforge
	{zid=20, rate=0.00368}, -- Lapidis Isle
	{zid=21, rate=0.00384}, -- Loch Modan
	{zid=22, rate=0.01094}, -- Northwind ?
	{zid=23, rate=0.00489}, -- Redridge Mountains
	{zid=24, rate=0.00300}, -- Scarlet Enclave?
	{zid=25, rate=0.00254}, -- Scarlet Monastery ?
	{zid=26, rate=0.00474}, -- Searing Gorge
	{zid=27, rate=0.00253}, -- Silverpine Forest
	{zid=28, rate=0.00610}, -- Stormwind City
	{zid=29, rate=0.00166}, -- Stranglethorn Vale
	{zid=30, rate=0.00461}, -- Swamp of Sorrows
	{zid=31, rate=0.00254}, -- Thalassian Highlands ?
	{zid=32, rate=0.00254}, -- The Deadmines?
	{zid=33, rate=0.00274}, -- The Hinterlands
	{zid=34, rate=0.00233}, -- Tirisfal Glades
	{zid=35, rate=0.00254}, -- Uldaman ?
	{zid=36, rate=0.01094}, -- Undercity
	{zid=37, rate=0.00244}, -- Western Plaguelands
	{zid=38, rate=0.00302}, -- Westfall
	{zid=39, rate=0.00254}, -- Wetlands
},
{ -- [3]
},
{ -- [4]
},
{ -- [5]
},
{ -- [6]
},
{ -- [7]
},
{ -- [8]
	{zid=1, rate=0.02804}, -- Stockades
}, }
		end
	end
	if MonkeySpeedConfig.m_SpecialZoneBaseline == nil then
		MonkeySpeedConfig.m_SpecialZoneBaseline = {
			[MONKEYSPEED_BLACKROCK] = 0.0002983199214410154,
			[MONKEYSPEED_WARSONG] = 0.009159138767039199,
			[MONKEYSPEED_ALTERAC] = 0.002477872662261515,
			[MONKEYSPEED_ARATHI] = 0.005978692329518227
		}
	end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplay then MonkeySpeedFrame:Show() else MonkeySpeedFrame:Hide() end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayPercent then MonkeySpeedText:Show() else MonkeySpeedText:Hide() end
	if MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_bDisplayBar then MonkeySpeedBar:Show() else MonkeySpeedBar:Hide() end
	MonkeySpeedSlash_CmdSetWidth(MonkeySpeedConfig[MonkeySpeed.m_strPlayer].m_iFrameWidth)

	if not MonkeySpeedConfig[MonkeySpeed.m_strPlayer].xpos or not MonkeySpeedConfig[MonkeySpeed.m_strPlayer].xpos then 
		MonkeySpeedFrame:ClearAllPoints()
		MonkeySpeedFrame:SetPoint("BOTTOMLEFT", "MonkeyQuestTitleButton", "TOPLEFT", 5, 0)
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].xpos = MonkeySpeedFrame:GetLeft()
		MonkeySpeedConfig[MonkeySpeed.m_strPlayer].ypos = MonkeySpeedFrame:GetTop()
	else
		MonkeySpeedFrame:ClearAllPoints()
		MonkeySpeedFrame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", MonkeySpeedConfig[MonkeySpeed.m_strPlayer].xpos, MonkeySpeedConfig[MonkeySpeed.m_strPlayer].ypos)
	end
end
function MonkeySpeed_ResetConfig()
	MonkeySpeedConfig = {}
	MonkeySpeed_Init()
	if MonkeyBuddySpeedFrame_Refresh then MonkeyBuddySpeedFrame_Refresh() end
end
