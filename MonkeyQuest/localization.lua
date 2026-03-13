MONKEYQUEST_TITLE					= "MonkeyQuest"
MONKEYQUEST_VERSION					= "2.4"
MONKEYQUEST_TITLE_VERSION			= MONKEYQUEST_TITLE .. " v" .. MONKEYQUEST_VERSION
MONKEYQUEST_DESCRIPTION				= "Displays your quests for quick viewing."
MONKEYQUEST_INFO_COLOUR				= "|cffffff00"
MONKEYQUEST_LOADED_MSG				= MONKEYQUEST_INFO_COLOUR .. MONKEYQUEST_TITLE .. " v" .. MONKEYQUEST_VERSION .. " loaded"

MONKEYQUEST_QUEST_DONE				= "done"
MONKEYQUEST_QUEST_FAILED			= "failed"
MONKEYQUEST_CONFIRM_RESET			= "Okay to reset " .. MONKEYQUEST_TITLE .. " settings to default values?"

MONKEYQUEST_CHAT_COLOUR				= "|cff00ff00"
MONKEYQUEST_SET_WIDTH_MSG			= MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": You may need to '/console reloadui' to see the changes in width."
MONKEYQUEST_RESET_MSG				= MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": Settings reset."

MONKEYQUEST_HELP_MSG				= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest help <command>\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Where <command> is any of the following: \n" ..
									  "reset, open, close, showhidden, hidehidden, useoverviews, nooverviews, " ..
									  "tipanchor, alpha, width, hideheaders, showheaders, hideborder, showborder, " ..
									  "growup, growdown, hidenumquests, shownumquests, lock, unlock, colourtitleon, " ..
									  "colourtitleoff, hidecompletedquests, showcompletedquests, hidecompletedobjectives, " ..
									  "showcompletedobjectives, fontheight, showtooltipobjectives, hidetootipobjectives, " ..
									  "allowrightclick, disallowrightclick, hidetitlebuttons, showtitlebuttons."
MONKEYQUEST_HELP_RESET_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest reset\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Displays the reset config variables dialog.\n"
MONKEYQUEST_HELP_OPEN_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest open\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Shows the main " .. MONKEYQUEST_TITLE .. " frame.\n"
MONKEYQUEST_HELP_CLOSE_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest close\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hides the main " .. MONKEYQUEST_TITLE .. " frame.\n"
MONKEYQUEST_HELP_SHOWHIDDEN_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showhidden\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Shows collapsed zone headers and hidden quests.\n"
MONKEYQUEST_HELP_HIDEHIDDEN_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidehidden\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hides collapsed zone headers and hidden quests.\n"
MONKEYQUEST_HELP_USEOVERVIEWS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest useoverviews\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Displays the quest overview for quests without objectives.\n"
MONKEYQUEST_HELP_NOOVERVIEWS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest nooverviews\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Don't display the quest overview for quests without objectives.\n"
MONKEYQUEST_HELP_TIPANCHOR_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest tipanchor=<anchor position>\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Sets the anchor point of the tooltip where <anchor position> " .. 
									  "can be any of the following:\nANCHOR_TOPLEFT, ANCHOR_TOPRIGHT, ANCHOR_TOP, ANCHOR_LEFT, " ..
									  "ANCHOR_RIGHT, ANCHOR_BOTTOMLEFT, ANCHOR_BOTTOMRIGHT, ANCHOR_BOTTOM, ANCHOR_CURSOR, " .. 
									  "DEFAULT, NONE"
MONKEYQUEST_HELP_ALPHA_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest alpha=<0 - 255>\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Sets the backdrop alpha to the specified value.\n"
MONKEYQUEST_HELP_WIDTH_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest width=<positive integer>\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Sets the width to the specified value, the default is 255.\n"
MONKEYQUEST_HELP_HIDEHEADERS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hideheaders\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Never display any zone headers.\n"
MONKEYQUEST_HELP_SHOWHEADERS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showheaders\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Display zone headers.\n"
MONKEYQUEST_HELP_HIDEBORDER_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hideborder\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hide the border around the main " .. MONKEYQUEST_TITLE .. " frame.\n"
MONKEYQUEST_HELP_SHOWBORDER_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showborder\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Show the border around the main " .. MONKEYQUEST_TITLE .. " frame.\n"
MONKEYQUEST_HELP_GROWUP_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest growup\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Makes the main " .. MONKEYQUEST_TITLE .. " frame expand upwards.\n"
MONKEYQUEST_HELP_GROWDOWN_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest growdown\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Makes the main " .. MONKEYQUEST_TITLE .. " frame expand downwards.\n"
MONKEYQUEST_HELP_HIDENUMQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidenumquests\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hide the number of quests next to the title.\n"
MONKEYQUEST_HELP_SHOWNUMQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest shownumquests\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Show the number of quests next to the title.\n"
MONKEYQUEST_HELP_LOCK_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest lock\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Locks the " .. MONKEYQUEST_TITLE .. " frame in place.\n"
MONKEYQUEST_HELP_UNLOCK_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest unlock\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Unlocks the " .. MONKEYQUEST_TITLE .. " frame, making it movable.\n"
MONKEYQUEST_HELP_COLOURTITLEON_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest colourtitleon\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Uses the difficulty to colour the entier quest title.\n"
MONKEYQUEST_HELP_COLOURTITLEOFF_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest colourtitleoff\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Doesn't colour the entier quest title by difficulty.\n"
MONKEYQUEST_HELP_HIDECOMPLETEDQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidecompletedquests\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hides completed quests.\n"
MONKEYQUEST_HELP_SHOWCOMPLETEDQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showcompletedquests\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Shows completed quests.\n"
MONKEYQUEST_HELP_HIDECOMPLETEDOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidecompletedobjectives\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hides completed objectives.\n"
MONKEYQUEST_HELP_SHOWCOMPLETEDOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showcompletedobjectives\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Shows completed objectives.\n"
MONKEYQUEST_HELP_FONTHEIGHT_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest fontheight=<positive integer>\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Sets the font height to the specified value, the default is 12.\n"
MONKEYQUEST_HELP_SHOWTOOLTIPOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showtooltipobjectives\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Adds a line to the tooltip which shows the completeness of that quest objective.\n"
MONKEYQUEST_HELP_HIDETOOLTIPOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidetooltipobjectives\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Does not add a line to the tooltip about the completeness of that quest objective.\n"
MONKEYQUEST_HELP_ALLOWRIGHTCLICK_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest allowrightclick\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Allows you to right-click to open MonkeyBuddy.\n"
MONKEYQUEST_HELP_DISALLOWRIGHTCLICK_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest disallowrightclick\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Disallows you from right-clicking to open MonkeyBuddy.\n"
MONKEYQUEST_HELP_HIDETITLEBUTTONS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidetitlebuttons\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Hides the title buttons.\n"
MONKEYQUEST_HELP_SHOWTITLEBUTTONS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showtitlebuttons\n" ..
									  MONKEYQUEST_CHAT_COLOUR .. "Shows the title buttons.\n"
-- tooltip strings
MONKEYQUEST_TOOLTIP_QUESTITEM		= "Quest Item";		-- as it appears in the tooltip of unique quest items
MONKEYQUEST_TOOLTIP_QUEST			= "Quest"
MONKEYQUEST_TOOLTIP_SLAIN			= "slain";			-- as it appears in the objective text

-- misc quest strings
MONKEYQUEST_DUNGEON					= "Dungeon"
MONKEYQUEST_PVP						= "PvP"

-- noob tips
MONKEYQUEST_NOOBTIP_HEADER			= "Noob Tip:"

MONKEYQUEST_NOOBTIP_CLOSE			= "Click here to close the main frame. To get it back try:"
MONKEYQUEST_NOOBTIP_MINIMIZE		= "Click here to minimize the main frame"
MONKEYQUEST_NOOBTIP_RESTORE			= "Click here to restore the main frame"
MONKEYQUEST_NOOBTIP_SHOWALLHIDDEN	= "Click here to show all hidden items"
MONKEYQUEST_NOOBTIP_HIDEALLHIDDEN	= "Click here to hide all hidden items"
MONKEYQUEST_NOOBTIP_HIDEBUTTON		= "Click here to hide this quest. Activate 'Show all hidden items' to see this quest again"
MONKEYQUEST_NOOBTIP_TITLE			= "Right Click to configure " .. MONKEYQUEST_TITLE
MONKEYQUEST_NOOBTIP_TITLE2			= "Shift-Right Click to toggle Monkeyspeed"
MONKEYQUEST_NOOBTIP_QUESTHEADER		= "Click here to hide/show all the quests under this zone. Activate 'Show all hidden items' to show zone headers you've hidden."

-- bindings
BINDING_HEADER_MONKEYQUEST 			= MONKEYQUEST_TITLE
BINDING_NAME_MONKEYQUEST_CLOSE 		= "Close/Open"
BINDING_NAME_MONKEYQUEST_MINIMIZE 	= "Minimize/Restore"
BINDING_NAME_MONKEYQUEST_HIDDEN		= "Hide/Show all hidden items"
BINDING_NAME_MONKEYQUEST_NOHEADERS	= "Toggle No Headers"


if GetLocale() == "frFR" then
    -- Traduit par Juki <Unskilled>
    MONKEYQUEST_DESCRIPTION             = "Affiche vos quêtes pour un aperçu rapide."
    MONKEYQUEST_LOADED_MSG              = MONKEYQUEST_INFO_COLOUR .. MONKEYQUEST_TITLE .. " v" .. MONKEYQUEST_VERSION .. " chargé"
    
    MONKEYQUEST_CLOSE_TOOLTIP           = "Fermer"
    MONKEYQUEST_MINIMIZE_TOOLTIP        = "Réduire"
    MONKEYQUEST_HIDDEN_TOOLTIP          = "Montrer les quêtes cachées"
    
    MONKEYQUEST_QUEST_DONE              = "Terminée"
    MONKEYQUEST_CONFIRM_RESET           = "Ok pour remettre les options " .. MONKEYQUEST_TITLE .. " à leurs valeurs par défaut ?"
    
    MONKEYQUEST_SET_WIDTH_MSG           = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. " : Vous aurez peut être besoin de '/console reloadui' pour voir les changements de la largeur."
    MONKEYQUEST_ALLOW_CLICKS_ON_MSG     = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. " : Autorise les clics sur les quêtes."
    MONKEYQUEST_ALLOW_CLICKS_OFF_MSG    = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. " : N'autorise pas les clics sur les quêtes."
    MONKEYQUEST_RESET_MSG               = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. " : Options remises à zero."
    
    MONKEYQUEST_HELP_MSG                = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest help <command>\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Où <command> est une des suivantes : \n" ..
                                          "reset, open, close, showhidden, hidehidden, useoverviews, nooverviews, " ..
                                          "tipanchor, alpha, width, hideheaders, showheaders, hideborder, showborder, " ..
                                          "growup, growdown, hidenumquests, shownumquests, lock, unlock, colourtitleon, " ..
                                          "colourtitleoff, hidecompletedquests, showcompletedquests, hidecompletedobjectives, " ..
                                          "showcompletedobjectives."
    MONKEYQUEST_HELP_RESET_MSG          = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest reset\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Affiche le dialogue de remise à zero des options.\n"
    MONKEYQUEST_HELP_OPEN_MSG           = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest open\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Ouvre la fenêtre " .. MONKEYQUEST_TITLE .. ".\n"
    MONKEYQUEST_HELP_CLOSE_MSG          = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest close\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Ferme la fenêtre " .. MONKEYQUEST_TITLE .. ".\n"
    MONKEYQUEST_HELP_SHOWHIDDEN_MSG     = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showhidden\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer les noms de zone et les quêtes cachées.\n"
    MONKEYQUEST_HELP_HIDEHIDDEN_MSG     = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hidehidden\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Cacher les noms de zone et les quêtes cachées.\n"
    MONKEYQUEST_HELP_USEOVERVIEWS_MSG   = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest useoverviews\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer la description quand il n'y a pas d'objectifs.\n"
    MONKEYQUEST_HELP_NOOVERVIEWS_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest nooverviews\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Ne pas montrer la description quand il n'y a pas d'objectifs.\n"
    MONKEYQUEST_HELP_TIPANCHOR_MSG      = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest tipanchor=<anchor position>\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Fixer le point d'ancrage du tooltip où <anchor position> " .. 
                                          "peut être un des suivants :\nANCHOR_TOPLEFT, ANCHOR_TOPRIGHT, ANCHOR_TOP, ANCHOR_LEFT, " ..
                                          "ANCHOR_RIGHT, ANCHOR_BOTTOMLEFT, ANCHOR_BOTTOMRIGHT, ANCHOR_BOTTOM, ANCHOR_CURSOR, " .. 
                                          "DEFAULT, NONE"
    MONKEYQUEST_HELP_ALPHA_MSG          = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest alpha=<0 - 255>\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Fixer l'Alpha à la valeur spécifiée.\n"
    MONKEYQUEST_HELP_WIDTH_MSG          = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest width=<positive integer>\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Fixer la largeur à la valeur spécifiée, 255 par défaut. " .. 
                                          "Nécessite de '/console reloadui' pour prendre effet.\n"
    MONKEYQUEST_HELP_HIDEHEADERS_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hideheaders\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Cacher les noms de zone.\n"
    MONKEYQUEST_HELP_SHOWHEADERS_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showheaders\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer les noms de zone.\n"
    MONKEYQUEST_HELP_HIDEBORDER_MSG     = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hideborder\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Cacher les bords de la fenêtre " .. MONKEYQUEST_TITLE .. ".\n"
    MONKEYQUEST_HELP_SHOWBORDER_MSG     = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showborder\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer les bords de la fenêtre " .. MONKEYQUEST_TITLE .. ".\n"
    MONKEYQUEST_HELP_GROWUP_MSG         = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest growup\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Augmenter la fenêtre " .. MONKEYQUEST_TITLE .. " vers le haut.\n"
    MONKEYQUEST_HELP_GROWDOWN_MSG       = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest growdown\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Augmenter la fenêtre " .. MONKEYQUEST_TITLE .. " vers le bas.\n"
    MONKEYQUEST_HELP_HIDENUMQUESTS_MSG  = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hidenumquests\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Cacher le nombre de quêtes.\n"
    MONKEYQUEST_HELP_SHOWNUMQUESTS_MSG  = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest shownumquests\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer le nombre de quêtes.\n"
    MONKEYQUEST_HELP_LOCK_MSG           = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest lock\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Bloquer la fenêtre " .. MONKEYQUEST_TITLE .. ".\n"
    MONKEYQUEST_HELP_UNLOCK_MSG         = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest unlock\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Débloquer la fenêtre " .. MONKEYQUEST_TITLE .. ", la rend mobile.\n"
    MONKEYQUEST_HELP_COLOURTITLEON_MSG  = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest colourtitleon\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Colorer les titres de quêtes selon la difficulté.\n"
    MONKEYQUEST_HELP_COLOURTITLEOFF_MSG = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest colourtitleoff\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Ne pas colorer les titres de quêtes selon la difficulté.\n"
    MONKEYQUEST_HELP_HIDECOMPLETEDQUESTS_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hidecompletedquests\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Cacher les quêtes terminées.\n"
    MONKEYQUEST_HELP_SHOWCOMPLETEDQUESTS_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showcompletedquests\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer les quêtes terminées.\n"
    MONKEYQUEST_HELP_HIDECOMPLETEDOBJECTIVES_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hidecompletedobjectives\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Cacher les objectifs terminés.\n"
    MONKEYQUEST_HELP_SHOWCOMPLETEDOBJECTIVES_MSG    = MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showcompletedobjectives\n" ..
                                          MONKEYQUEST_CHAT_COLOUR .. "Montrer les objectifs terminés.\n"
                                          
    MONKEYQUEST_HELP_FONTHEIGHT_MSG		= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest fontheight=<entier positif>\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Fixe la taille de la police de caractères, 12 par défaut.\n"
    MONKEYQUEST_HELP_SHOWTOOLTIPOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showtooltipobjectives\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Ajoute une ligne au tooltip qui montre l'avancement de cet objectif de quête.\n"
    MONKEYQUEST_HELP_HIDETOOLTIPOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hidetooltipobjectives\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Retire la ligne du tooltip qui montre l'avancement de cet objectif de quête.\n"
    MONKEYQUEST_HELP_ALLOWRIGHTCLICK_MSG	= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest allowrightclick\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Vous permet de faire un clic droit pour ouvrir MonkeyBuddy.\n"
    MONKEYQUEST_HELP_DISALLOWRIGHTCLICK_MSG	= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest disallowrightclick\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Désactive le clic droit pour ouvrir MonkeyBuddy.\n"
    MONKEYQUEST_HELP_HIDETITLEBUTTONS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest hidetitlebuttons\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Cacher les boutons de titre.\n"
    MONKEYQUEST_HELP_SHOWTITLEBUTTONS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Utilisation : /mquest showtitlebuttons\n" ..
    									  MONKEYQUEST_CHAT_COLOUR .. "Montrer les boutons de titre.\n";                                          

    -- tooltip strings
    MONKEYQUEST_TOOLTIP_QUESTITEM		= "Objet de quête";		-- as it appears in the tooltip of unique quest items
    MONKEYQUEST_TOOLTIP_SLAIN			= "morts";			        -- as it appears in the objective text                                          

	-- misc quest strings
	MONKEYQUEST_DUNGEON					= "Donjon"
	MONKEYQUEST_PVP						= "JcJ"

    -- bindings
    BINDING_HEADER_MONKEYQUEST          = MONKEYQUEST_TITLE
    BINDING_NAME_MONKEYQUEST_CLOSE      = MONKEYQUEST_CLOSE_TOOLTIP.."/Open"
    BINDING_NAME_MONKEYQUEST_MINIMIZE   = MONKEYQUEST_MINIMIZE_TOOLTIP.."/Restore"
    BINDING_NAME_MONKEYQUEST_HIDDEN     = "Hide/"..MONKEYQUEST_HIDDEN_TOOLTIP
    BINDING_NAME_MONKEYQUEST_NOHEADERS  = "Afficher/Masquer Headers"

elseif GetLocale() == "deDE" then
-- Translation by Maischter (http://www.curse-gaming.com/mod.php?addid=429) & wowpendium.de
--
-- Umlaute sind wie folgt kodiert:
--
-- � - \195\188
-- � - \195\156
-- � - \195\182
-- � - \195\150
-- � - \195\164
-- � - \195\134
-- � - \195\159

--MONKEYQUEST_TITLE = "MonkeyQuest"
--MONKEYQUEST_VERSION = "1.4"
MONKEYQUEST_DESCRIPTION = "Stellt Quests in einer kompakten \195\156bersicht dar."
MONKEYQUEST_INFO_COLOUR = "|cffffff00"
MONKEYQUEST_LOADED_MSG = MONKEYQUEST_INFO_COLOUR .. MONKEYQUEST_TITLE .. " v" .. MONKEYQUEST_VERSION .. " geladen"

MONKEYQUEST_CLOSE_TOOLTIP = "Schlie\195\159en"
MONKEYQUEST_MINIMIZE_TOOLTIP = "Minimieren"
MONKEYQUEST_HIDDEN_TOOLTIP = "Zeige versteckte Elemente"

MONKEYQUEST_QUEST_DONE = "fertig"
MONKEYQUEST_CONFIRM_RESET = "Einstellungen von " .. MONKEYQUEST_TITLE .. " wirklich zur\195\188cksetzen?"

MONKEYQUEST_CHAT_COLOUR = "|cff00ff00"
MONKEYQUEST_SET_WIDTH_MSG = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": Um \195\134nderungen an der Breite wirksam werden zu lassen, m\195\188ssen Sie '/console reloadui' ausf\195\188hren."
MONKEYQUEST_ALLOW_CLICKS_ON_MSG = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": \195\150ffnen des Blizzard Quest Logs durch einen Klick auf eine Quest."
MONKEYQUEST_ALLOW_CLICKS_OFF_MSG = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": Kein \195\150ffnen des Blizzard Quest Logs durch einen Klick auf eine Quest."
MONKEYQUEST_RESET_MSG = MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": Einstellungen zur\195\188cksetzen."

MONKEYQUEST_HELP_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest help <Kommando>\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Anzeigen der Hilfe, wobei <Kommando> eines der folgenden sein kann: \n" ..
"reset, open, close, showhidden, hidehidden, useoverviews, nooverviews, " ..
"tipanchor, alpha, width, hideheaders, showheaders, hideborder, showborder, " ..
"growup, growdown, hidenumquests, shownumquests, lock, unlock, colourtitleon, " ..
"colourtitleoff, hidecompletedquests, showcompletedquests, hidecompletedobjectives, " ..
"showcompletedobjectives, fontheight, showtooltipobjectives, hidetootipobjectives, " ..
"allowrightclick, disallowrightclick, hidetitlebuttons, showtitlebuttons."
MONKEYQUEST_HELP_RESET_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest reset\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Zur\195\188cksetzen der Einstellungen auf die Werkseinstellung\n"
MONKEYQUEST_HELP_OPEN_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest open\n" ..
MONKEYQUEST_CHAT_COLOUR .. "\195\150ffnen des " .. MONKEYQUEST_TITLE .. " Fensters\n"
MONKEYQUEST_HELP_CLOSE_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest close\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Schlie\195\159en des " .. MONKEYQUEST_TITLE .. " Fensters\n"
MONKEYQUEST_HELP_SHOWHIDDEN_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showhidden\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Anzeigen aller, auch ausgeblendeter Quests\n"
MONKEYQUEST_HELP_HIDEHIDDEN_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hidehidden\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Ausblenden entsprechend markierter Quests\n"
MONKEYQUEST_HELP_USEOVERVIEWS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest useoverviews\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Anzeigen der Questzusammenfassung bei Quests, die keine Sammel- oder Killquest sind\n"
MONKEYQUEST_HELP_NOOVERVIEWS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest nooverviews\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Kein Anzeigen der Questzusammenfassung bei Quests, die keine Sammel- oder Killquest sind\n"
MONKEYQUEST_HELP_TIPANCHOR_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest tipanchor=<Ankerposition>\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Festlegen der Tooltip Position. M\195\182gliche Werte f\195\188r <Ankerposition> sind \n" ..
"ANCHOR_TOPLEFT, ANCHOR_TOPRIGHT, ANCHOR_TOP, ANCHOR_LEFT, " ..
"ANCHOR_RIGHT, ANCHOR_BOTTOMLEFT, ANCHOR_BOTTOMRIGHT, ANCHOR_BOTTOM, ANCHOR_CURSOR, " ..
"DEFAULT, NONE"
MONKEYQUEST_HELP_ALPHA_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest alpha=<0 - 255>\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Festlegen der Transparenz des Fensters, mu\195\159 eine positive Ganzzahl sein. 0 ist komplett transparent, 255 komplett undurchsichtig\n"
MONKEYQUEST_HELP_WIDTH_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest width=<positive integer>\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Festlegen der Fensterbreite, Standardwert ist 225, mu\195\159 eine positive Ganzahl sein. Um die \195\134nderung sichtbar zu machen, mu\195\159 die Oberfl\195\164che \195\188ber das Kommando /console reloadui neu geladen werden\n"
MONKEYQUEST_HELP_SHOWHEADERS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showheaders\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Einblenden der Namen der Regionen\n"
MONKEYQUEST_HELP_HIDEHEADERS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hideheaders\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Ausblenden der Namen der Regionen\n"
MONKEYQUEST_HELP_HIDEBORDER_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hideborder\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Kein Zeichnen eines Rahmens um das Fenster\n"
MONKEYQUEST_HELP_SHOWBORDER_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showborder\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Zeichnen eines Rahmens um das Fenster\n"
MONKEYQUEST_HELP_GROWUP_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest growup\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Festlegung, da\195\159 sich das Fenster nach oben hin erweitert, wenn eine neue Quest angenommen wird\n"
MONKEYQUEST_HELP_GROWDOWN_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest growdown\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Festlegung, da\195\159 sich das Fenster nach unten hin erweitert, wenn eine neue Quest angenommen wird\n"
MONKEYQUEST_HELP_HIDENUMQUESTS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hidenumquests\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Keine Anzeige der Anzahl der angenommenen Quests\n"
MONKEYQUEST_HELP_SHOWNUMQUESTS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest shownumquests\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Anzeige der Anzahl der angenommenen Quests\n"
MONKEYQUEST_HELP_LOCK_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest lock\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Fixierung des Fensters\n"
MONKEYQUEST_HELP_UNLOCK_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest unlock\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Aufhebung der Fixierung des Fensters\n"
MONKEYQUEST_HELP_COLOURTITLEON_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest colourtitleon\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Farbliche Kodierung der Quests nach ihrem Schwierigkeitsgrad\n"
MONKEYQUEST_HELP_COLOURTITLEOFF_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest colourtitleoff\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Keine farbliche Kodierung der Quests nach ihrem Schwierigkeitsgrad\n"
MONKEYQUEST_HELP_HIDECOMPLETEDQUESTS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hidecompletedquests\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Versteckt alle Quests.\n"
MONKEYQUEST_HELP_SHOWCOMPLETEDQUESTS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showcompletedquests\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Zeigt alle Quests.\n"
MONKEYQUEST_HELP_HIDECOMPLETEDOBJECTIVES_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hidecompletedobjectives\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Versteckt alle Questziele.\n"
MONKEYQUEST_HELP_SHOWCOMPLETEDOBJECTIVES_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showcompletedobjectives\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Zeigt alle Questsziele.\n"
MONKEYQUEST_HELP_FONTHEIGHT_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest fontheight=<positive integer>\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Stellt die Schriftgr\195\182sse ein, Standart ist 12.\n"
MONKEYQUEST_HELP_SHOWTOOLTIPOBJECTIVES_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showtooltipobjectives\n" ..
MONKEYQUEST_CHAT_COLOUR .. "F\195\188gt den Tooltips eine Linie hinzu, welche die Vollstandigkeit der jeweiligen Questziele anzeigt.\n"
MONKEYQUEST_HELP_HIDETOOLTIPOBJECTIVES_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hidetooltipobjectives\n" ..
MONKEYQUEST_CHAT_COLOUR .. "F\195\188gt den Tooltips keine Linie hinzu, welche die Vollstandigkeit der jeweiligen Questziele anzeigen w\195\188rde.\n"
MONKEYQUEST_HELP_ALLOWRIGHTCLICK_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest allowrightclick\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Erlaubt Rechtsklick um \195\182ffnen von MonkeyBuddy.\n"
MONKEYQUEST_HELP_DISALLOWRIGHTCLICK_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest disallowrightclick\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Erlaubt nicht Rechtsklick zum \195\182ffnen von MonkeyBuddy.\n"
MONKEYQUEST_HELP_HIDETITLEBUTTONS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest hidetitlebuttons\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Versteckt die Titeltasten.\n"
MONKEYQUEST_HELP_SHOWTITLEBUTTONS_MSG = MONKEYQUEST_INFO_COLOUR .. "Verwendung: /mquest showtitlebuttons\n" ..
MONKEYQUEST_CHAT_COLOUR .. "Zeigt die Titeltasten.\n"

-- tooltip strings
MONKEYQUEST_TOOLTIP_QUESTITEM = "Questgegenstand"
MONKEYQUEST_TOOLTIP_SLAIN = "get\195\182tet"

-- bindings
BINDING_HEADER_MONKEYQUEST = MONKEYQUEST_TITLE
BINDING_NAME_MONKEYQUEST_CLOSE = MONKEYQUEST_CLOSE_TOOLTIP.."/Open"
BINDING_NAME_MONKEYQUEST_MINIMIZE = MONKEYQUEST_MINIMIZE_TOOLTIP.."/Restore"
BINDING_NAME_MONKEYQUEST_HIDDEN = "Hide/"..MONKEYQUEST_HIDDEN_TOOLTIP
BINDING_NAME_MONKEYQUEST_NOHEADERS = "Toggle No Headers"

elseif GetLocale() == "esES" then
	MONKEYQUEST_QUEST_DONE				= "hecho"
	MONKEYQUEST_CONFIRM_RESET			= "Vale para reset " .. MONKEYQUEST_TITLE .. " settings to default values?"
	
	MONKEYQUEST_CHAT_COLOUR				= "|cff00ff00"
	MONKEYQUEST_SET_WIDTH_MSG			= MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": Tu puedes necesitar de '/console reloadui' para ver los cambios."
	MONKEYQUEST_RESET_MSG				= MONKEYQUEST_CHAT_COLOUR .. MONKEYQUEST_TITLE .. ": Opciones reseteadas."
	
	MONKEYQUEST_HELP_MSG				= MONKEYQUEST_INFO_COLOUR .. "Comando: /mquest help <command>\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Cuando <command> is any of the following: \n" ..
										  "reset, open, close, showhidden, hidehidden, useoverviews, nooverviews, " ..
										  "tipanchor, alpha, width, hideheaders, showheaders, hideborder, showborder, " ..
										  "growup, growdown, hidenumquests, shownumquests, lock, unlock, colourtitleon, " ..
										  "colourtitleoff, hidecompletedquests, showcompletedquests, hidecompletedobjectives, " ..
										  "showcompletedobjectives, fontheight, showtooltipobjectives, hidetootipobjectives, " ..
										  "allowrightclick, disallowrightclick, hidetitlebuttons, showtitlebuttons."
	MONKEYQUEST_HELP_RESET_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest reset\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Displays the reset config variables dialog.\n"
	MONKEYQUEST_HELP_OPEN_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest open\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Shows the main " .. MONKEYQUEST_TITLE .. " frame.\n"
	MONKEYQUEST_HELP_CLOSE_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest close\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hides the main " .. MONKEYQUEST_TITLE .. " frame.\n"
	MONKEYQUEST_HELP_SHOWHIDDEN_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showhidden\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Shows collapsed zone headers and hidden quests.\n"
	MONKEYQUEST_HELP_HIDEHIDDEN_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidehidden\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hides collapsed zone headers and hidden quests.\n"
	MONKEYQUEST_HELP_USEOVERVIEWS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest useoverviews\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Displays the quest overview for quests without objectives.\n"
	MONKEYQUEST_HELP_NOOVERVIEWS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest nooverviews\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Don't display the quest overview for quests without objectives.\n"
	MONKEYQUEST_HELP_TIPANCHOR_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest tipanchor=<anchor position>\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Sets the anchor point of the tooltip where <anchor position> " .. 
										  "can be any of the following:\nANCHOR_TOPLEFT, ANCHOR_TOPRIGHT, ANCHOR_TOP, ANCHOR_LEFT, " ..
										  "ANCHOR_RIGHT, ANCHOR_BOTTOMLEFT, ANCHOR_BOTTOMRIGHT, ANCHOR_BOTTOM, ANCHOR_CURSOR, " .. 
										  "DEFAULT, NONE"
	MONKEYQUEST_HELP_ALPHA_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest alpha=<0 - 255>\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Sets the backdrop alpha to the specified value.\n"
	MONKEYQUEST_HELP_WIDTH_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest width=<positive integer>\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Sets the width to the specified value, the default is 255.\n"
	MONKEYQUEST_HELP_HIDEHEADERS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hideheaders\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Never display any zone headers.\n"
	MONKEYQUEST_HELP_SHOWHEADERS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showheaders\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Display zone headers.\n"
	MONKEYQUEST_HELP_HIDEBORDER_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hideborder\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hide the border around the main " .. MONKEYQUEST_TITLE .. " frame.\n"
	MONKEYQUEST_HELP_SHOWBORDER_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showborder\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Show the border around the main " .. MONKEYQUEST_TITLE .. " frame.\n"
	MONKEYQUEST_HELP_GROWUP_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest growup\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Makes the main " .. MONKEYQUEST_TITLE .. " frame expand upwards.\n"
	MONKEYQUEST_HELP_GROWDOWN_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest growdown\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Makes the main " .. MONKEYQUEST_TITLE .. " frame expand downwards.\n"
	MONKEYQUEST_HELP_HIDENUMQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidenumquests\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hide the number of quests next to the title.\n"
	MONKEYQUEST_HELP_SHOWNUMQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest shownumquests\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Show the number of quests next to the title.\n"
	MONKEYQUEST_HELP_LOCK_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest lock\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Locks the " .. MONKEYQUEST_TITLE .. " frame in place.\n"
	MONKEYQUEST_HELP_UNLOCK_MSG			= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest unlock\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Unlocks the " .. MONKEYQUEST_TITLE .. " frame, making it movable.\n"
	MONKEYQUEST_HELP_COLOURTITLEON_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest colourtitleon\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Uses the difficulty to colour the entier quest title.\n"
	MONKEYQUEST_HELP_COLOURTITLEOFF_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest colourtitleoff\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Doesn't colour the entier quest title by difficulty.\n"
	MONKEYQUEST_HELP_HIDECOMPLETEDQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidecompletedquests\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hides completed quests.\n"
	MONKEYQUEST_HELP_SHOWCOMPLETEDQUESTS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showcompletedquests\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Shows completed quests.\n"
	MONKEYQUEST_HELP_HIDECOMPLETEDOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidecompletedobjectives\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hides completed objectives.\n"
	MONKEYQUEST_HELP_SHOWCOMPLETEDOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showcompletedobjectives\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Shows completed objectives.\n"
	MONKEYQUEST_HELP_FONTHEIGHT_MSG		= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest fontheight=<positive integer>\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Sets the font height to the specified value, the default is 12.\n"
	MONKEYQUEST_HELP_SHOWTOOLTIPOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showtooltipobjectives\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Adds a line to the tooltip which shows the completeness of that quest objective.\n"
	MONKEYQUEST_HELP_HIDETOOLTIPOBJECTIVES_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidetooltipobjectives\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Does not add a line to the tooltip about the completeness of that quest objective.\n"
	MONKEYQUEST_HELP_ALLOWRIGHTCLICK_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest allowrightclick\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Allows you to right-click to open MonkeyBuddy.\n"
	MONKEYQUEST_HELP_DISALLOWRIGHTCLICK_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest disallowrightclick\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Disallows you from right-clicking to open MonkeyBuddy.\n"
	MONKEYQUEST_HELP_HIDETITLEBUTTONS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest hidetitlebuttons\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Hides the title buttons.\n"
	MONKEYQUEST_HELP_SHOWTITLEBUTTONS_MSG	= MONKEYQUEST_INFO_COLOUR .. "Slash Command: /mquest showtitlebuttons\n" ..
										  MONKEYQUEST_CHAT_COLOUR .. "Shows the title buttons.\n"
	
	-- tooltip strings
	MONKEYQUEST_TOOLTIP_QUESTITEM		= "Objeto de Quest";		-- as it appears in the tooltip of unique quest items
	MONKEYQUEST_TOOLTIP_QUEST			= "Quest"
	MONKEYQUEST_TOOLTIP_SLAIN			= "slain";			-- as it appears in the objective text
	
	-- misc quest strings
	MONKEYQUEST_DUNGEON					= "Mazmorra"
	MONKEYQUEST_PVP						= "PvP"
	
	-- noob tips
	MONKEYQUEST_NOOBTIP_HEADER			= "Noob Tip:"
	
	MONKEYQUEST_NOOBTIP_CLOSE			= "Pulsa aqui para cerrar esta ventana. Podras volver:"
	MONKEYQUEST_NOOBTIP_MINIMIZE		= "Pulsa aqui para miminizar esta ventana"
	MONKEYQUEST_NOOBTIP_RESTORE			= "Pulsa aqui para restaurar esta ventana"
	MONKEYQUEST_NOOBTIP_SHOWALLHIDDEN	= "Pulsa aqui para ver todos los objetos ocultos"
	MONKEYQUEST_NOOBTIP_HIDEALLHIDDEN	= "Pulsa aqui para ocultar todos los objetos escondidos"
	MONKEYQUEST_NOOBTIP_HIDEBUTTON		= "Pulsa aqui para ocultar esta quest. Activalo en 'Show all hidden items' para mirar todas las quest"
	MONKEYQUEST_NOOBTIP_TITLE			= "Click derecho para abrir MonkeyBuddy y poder configurarlo " .. MONKEYQUEST_TITLE
	MONKEYQUEST_NOOBTIP_QUESTHEADER		= "Pulsa aqui para ocultar/mostrar todas las quest en esta zona. Activa 'Show all hidden items' para mostrar las de las zonas en que no estas."
	
	-- bindings
	BINDING_HEADER_MONKEYQUEST 			= MONKEYQUEST_TITLE
	BINDING_NAME_MONKEYQUEST_CLOSE 		= "Cerrar/Abrir"
	BINDING_NAME_MONKEYQUEST_MINIMIZE 	= "Minimizar/Restaurar"
	BINDING_NAME_MONKEYQUEST_HIDDEN		= "Ocultar/Mostrar todos los objetos ocultos"
	BINDING_NAME_MONKEYQUEST_NOHEADERS	= "Toggle No Headers"
end

MONKEYBUDDY_TITLE					= "MonkeyBuddy"
MONKEYBUDDY_VERSION					= "2.4.2"
MONKEYBUDDY_FRAME_TITLE				= MONKEYBUDDY_TITLE .. " v" .. MONKEYBUDDY_VERSION
MONKEYBUDDY_DESCRIPTION				= "Helps you configure your MonkeyMods."
MONKEYBUDDY_INFO_COLOUR				= "|cffffff00"
MONKEYBUDDY_LOADED_MSG				= MONKEYBUDDY_INFO_COLOUR .. MONKEYBUDDY_TITLE .. " v" .. MONKEYBUDDY_VERSION .. " loaded"

MONKEYBUDDY_TOOLTIP_CLOSE			= "Close"
MONKEYBUDDY_RESET_ALL				= "Reset All"
MONKEYBUDDY_RESET					= "Reset"

-- defs for MonkeyQuest
MONKEYBUDDY_QUEST_TITLE						= "MonkeyQuest"
MONKEYBUDDY_QUEST_OPEN						= "Open MonkeyQuest"
MONKEYBUDDY_QUEST_SHOWHIDDEN				= "Show hidden items"
MONKEYBUDDY_QUEST_USEOVERVIEWS				= "Use overviews when there's no objectives"
MONKEYBUDDY_QUEST_HIDEHEADERS				= "Hide zone headers if not showing hidden items"
MONKEYBUDDY_QUEST_ALWAYSHEADERS				= "Always show zone headers, always"
MONKEYBUDDY_QUEST_HIDEBORDER				= "Hide the border"
MONKEYBUDDY_QUEST_GROWUP					= "Expand upwards"
MONKEYBUDDY_QUEST_SHOWNUMQUESTS				= "Show the number of quests"
MONKEYBUDDY_QUEST_LOCK						= "Lock the MonkeyQuest frame"
MONKEYBUDDY_QUEST_COLOURTITLEON				= "Colour the quest titles by difficulty"
MONKEYBUDDY_QUEST_HIDECOMPLETEDQUESTS		= "Hide completed quests"
MONKEYBUDDY_QUEST_HIDECOMPLETEDOBJECTIVES	= "Hide completed objectives"
MONKEYBUDDY_QUEST_SHOWTOOLTIPOBJECTIVES		= "Show objective completeness in tooltips"
MONKEYBUDDY_QUEST_ALLOWRIGHTCLICK			= "Allow right click to open MonkeyBuddy"
MONKEYBUDDY_QUEST_HIDETITLEBUTTONS			= "Hide the title buttons"
MONKEYBUDDY_QUEST_HIDETITLE					= "Hide the title (" .. MONKEYBUDDY_QUEST_TITLE .. ") text"
MONKEYBUDDY_QUEST_CRASHFONT					= "Use the skinny font"
MONKEYBUDDY_QUEST_CRASHBORDER				= "Use the golden border colour"
MONKEYBUDDY_QUEST_SHOWNOOBTIPS				= "Show helpful tooltips for Noobs"
MONKEYBUDDY_QUEST_SHOWZONEHIGHLIGHT			= "Show quest zone highlighting"
MONKEYBUDDY_QUEST_SHOWQUESTLEVEL			= "Show the quest levels"


MONKEYBUDDY_QUEST_QUESTTITLECOLOUR			= "Quest Titles"
MONKEYBUDDY_QUEST_HEADEROPENCOLOUR			= "Open Zone Headers"
MONKEYBUDDY_QUEST_HEADERCLOSEDCOLOUR		= "Closed Zone Headers"
MONKEYBUDDY_QUEST_OVERVIEWCOLOUR			= "Quest Overviews"
MONKEYBUDDY_QUEST_SPECIALOBJECTIVECOLOUR	= "Special Objectives"
MONKEYBUDDY_QUEST_INITIALOBJECTIVECOLOUR	= "Objectives at 0%"
MONKEYBUDDY_QUEST_MIDOBJECTIVECOLOUR		= "Objectives at 50%"
MONKEYBUDDY_QUEST_COMPLETEOBJECTIVECOLOUR	= "Objectives at 100%"
MONKEYBUDDY_QUEST_ZONEHIGHLIGHTCOLOUR		= "Current Zone Highlight"

MONKEYBUDDY_QUEST_FRAMEALPHASLIDER			= "Global Alpha"
MONKEYBUDDY_QUEST_ALPHASLIDER				= "Background Alpha"
MONKEYBUDDY_QUEST_WIDTHSLIDER				= "Frame Width"
MONKEYBUDDY_QUEST_FONTSLIDER				= "Font Size"
MONKEYBUDDY_QUEST_PADDINGSLIDER				= "Quest Padding"

-- defs for MonkeySpeed
MONKEYBUDDY_SPEED_TITLE				= "MonkeySpeed"
MONKEYBUDDY_SPEED_OPEN				= "Open MonkeySpeed"
MONKEYBUDDY_SPEED_PERCENT			= "Show speed as a percent"
MONKEYBUDDY_SPEED_BAR				= "Show speed as a background colour"
MONKEYBUDDY_SPEED_LOCK				= "Lock the MonkeySpeed frame"
MONKEYBUDDY_SPEED_ALLOWRIGHTCLICK	= "Allow right click to open MonkeyBuddy"

MONKEYBUDDY_SPEED_WIDTHSLIDER		= "Frame Width"

-- defs for MonkeyClock
MONKEYBUDDY_CLOCK_TITLE				= "MonkeyClock"
MONKEYBUDDY_CLOCK_OPEN				= "Open MonkeyClock"
MONKEYBUDDY_CLOCK_HIDEBORDER		= "Hide the border"
MONKEYBUDDY_CLOCK_USEMILITARYTIME	= "Use 24 hour clock"
MONKEYBUDDY_CLOCK_LOCK				= "Lock the MonkeyClock frame"
MONKEYBUDDY_CLOCK_CHATALARM			= "Use the alarm message in the chat window"
MONKEYBUDDY_CLOCK_DIALOGALARM		= "Use the alarm dialog box with snooze button"
MONKEYBUDDY_CLOCK_ALLOWRIGHTCLICK	= "Allow right click to open MonkeyBuddy"

MONKEYBUDDY_CLOCK_HOURSLIDER		= "Hour Offset"
MONKEYBUDDY_CLOCK_MINUTESLIDER		= "Minute Offset"

MONKEYBUDDY_CLOCK_ALARMHOURSLIDER	= "Alarm Hour"
MONKEYBUDDY_CLOCK_ALARMMINUTESLIDER	= "Alarm Minute"

-- bindings
BINDING_HEADER_MONKEYBUDDY 			= MONKEYBUDDY_TITLE
BINDING_NAME_MONKEYBUDDY_OPEN 		= "Open/Close the config frame"


if GetLocale() == "frFR" then
    -- Traduit par Juki <Unskilled>
	-- Updated 01/04/06 ( Sasmira )
    
    MONKEYBUDDY_DESCRIPTION				= "Vous aide à configurer vos MonkeyMods."
    MONKEYBUDDY_LOADED_MSG				= MONKEYBUDDY_INFO_COLOUR .. MONKEYBUDDY_TITLE .. " v" .. MONKEYBUDDY_VERSION .. " chargé"

    MONKEYBUDDY_TOOLTIP_CLOSE			= "Fermer"
    MONKEYBUDDY_RESET_ALL            = "R.\195\160.Z. Totale"
    MONKEYBUDDY_RESET               = "R.\195\160.Z."
   
    -- defs for MonkeyQuest
    MONKEYBUDDY_QUEST_TITLE            = "MonkeyQuest"
    MONKEYBUDDY_QUEST_OPEN            = "Ouvrir MonkeyQuest"
    MONKEYBUDDY_QUEST_SHOWHIDDEN      = "Montrer toutes les qu\195\170tes"
    MONKEYBUDDY_QUEST_USEOVERVIEWS      = "Utiliser la description lorsqu\'il n\'y a pas d\'objectifs"
    MONKEYBUDDY_QUEST_HIDEHEADERS      = "Cacher les noms de zone"
    MONKEYBUDDY_QUEST_HIDEBORDER      = "Cacher les bords"
    MONKEYBUDDY_QUEST_GROWUP         = "Augmenter la fen\195\170tre vers le haut"
    MONKEYBUDDY_QUEST_SHOWNUMQUESTS      = "Montrer le nombre de qu\195\170tes"
    MONKEYBUDDY_QUEST_LOCK            = "Bloquer la fen\195\170tre MonkeyQuest"
    MONKEYBUDDY_QUEST_COLOURTITLEON      = "Colorer les titres de qu\195\170tes selon la difficult\195\169"
    MONKEYBUDDY_QUEST_HIDECOMPLETEDQUESTS   = "Cacher les qu\195\170tes termin\195\169es"
    MONKEYBUDDY_QUEST_HIDECOMPLETEDOBJECTIVES   = "Cacher les objectifs termin\195\169s"
    MONKEYBUDDY_QUEST_SHOWTOOLTIPOBJECTIVES      = "Afficher les objectifs dans la bulle d\'aide"
    MONKEYBUDDY_QUEST_ALLOWRIGHTCLICK         = "Clic droit pour ouvrir MonkeyBuddy"
    MONKEYBUDDY_QUEST_HIDETITLEBUTTONS         = "Cacher les boutons de titre"
    MONKEYBUDDY_QUEST_HIDETITLE               = "Cacher le texte (" .. MONKEYBUDDY_QUEST_TITLE .. ") dans le titre"
    MONKEYBUDDY_QUEST_CRASHFONT               = "Utiliser la police de Crash"
    MONKEYBUDDY_QUEST_CRASHBORDER            = "Utiliser la couleur de bordure de Crash"
    MONKEYBUDDY_QUEST_SHOWNOOBTIPS            = "Afficher les bulles d\'aide pour les Noobs"

    MONKEYBUDDY_QUEST_QUESTTITLECOLOUR         = "Titre des Qu\195\170tes"
    MONKEYBUDDY_QUEST_HEADEROPENCOLOUR         = "Ouvrir le nom des zones"
    MONKEYBUDDY_QUEST_HEADERCLOSEDCOLOUR      = "Fermer le nom des zones"
    MONKEYBUDDY_QUEST_OVERVIEWCOLOUR         = "Vues d\'ensemble des Qu\195\170tes"
    MONKEYBUDDY_QUEST_SPECIALOBJECTIVECOLOUR   = "Objectifs Sp飩aux"
    MONKEYBUDDY_QUEST_INITIALOBJECTIVECOLOUR   = "Objectifs \195\160 0%"
    MONKEYBUDDY_QUEST_MIDOBJECTIVECOLOUR      = "Objectifs \195\160 50%"
    MONKEYBUDDY_QUEST_COMPLETEOBJECTIVECOLOUR   = "Objectifs \195\160 100%"
    MONKEYBUDDY_QUEST_ZONEHIGHLIGHTCOLOUR      = "Surligner la Zone courrante"

    MONKEYBUDDY_QUEST_FRAMEALPHASLIDER         = "Transparence globale"
    MONKEYBUDDY_QUEST_ALPHASLIDER            = "Transparence du fond"
    MONKEYBUDDY_QUEST_WIDTHSLIDER            = "Largeur de la fen\195\170tre"
    MONKEYBUDDY_QUEST_FONTSLIDER            = "Taille de la Police"
    MONKEYBUDDY_QUEST_PADDINGSLIDER            = "Quest Padding"
    
    -- defs for MonkeySpeed
    MONKEYBUDDY_SPEED_TITLE				= "MonkeySpeed"
    MONKEYBUDDY_SPEED_OPEN				= "Ouvrir MonkeySpeed"
    MONKEYBUDDY_SPEED_PERCENT			= "Montrer la vitesse comme un pourcentage"
    MONKEYBUDDY_SPEED_BAR				= "Montrer la vitesse comme une couleur de fond"
    MONKEYBUDDY_SPEED_ALLOWRIGHTCLICK         = "Clic droit pour ouvrir MonkeyBuddy"
    
    -- defs for MonkeyClock
    MONKEYBUDDY_CLOCK_TITLE				= "MonkeyClock"
    MONKEYBUDDY_CLOCK_OPEN				= "Ouvrir MonkeyClock"
    MONKEYBUDDY_CLOCK_HIDEBORDER		= "Cacher les bords"
    MONKEYBUDDY_CLOCK_USEMILITARYTIME	= "Utiliser le format 24 heures"

    MONKEYBUDDY_CLOCK_MINUTESLIDER		= "Réglage Minute"
    MONKEYBUDDY_CLOCK_HOURSLIDER		= "Réglage Heure"
    MONKEYBUDDY_CLOCK_ALLOWRIGHTCLICK   = "Clic droit pour ouvrir MonkeyBuddy"
    
    -- bindings
    BINDING_HEADER_MONKEYBUDDY 			= MONKEYBUDDY_TITLE
    BINDING_NAME_MONKEYBUDDY_OPEN 		= "Ouvrir/Fermer la fenêtre de configuration"
    
end    

if GetLocale() == "deDE" then

	MONKEYBUDDY_DESCRIPTION				= "Hilft Euch beim Einstellen Euer MonkeyMods."
	MONKEYBUDDY_LOADED_MSG				= MONKEYBUDDY_INFO_COLOUR .. MONKEYBUDDY_TITLE .. " v" .. MONKEYBUDDY_VERSION .. " geladen"
	
	MONKEYBUDDY_TOOLTIP_CLOSE			= "Schlie\195\159en"
	MONKEYBUDDY_RESET_ALL				= "Alles Zur\195\188cksetzen"
	MONKEYBUDDY_RESET					= "Zur\195\188cksetzen"
	
	-- defs for MonkeyQuest
	MONKEYBUDDY_QUEST_OPEN				= "\195\150ffne MonkeyQuest"
	MONKEYBUDDY_QUEST_SHOWHIDDEN			= "Zeige ausgeblendete Elemente"
	MONKEYBUDDY_QUEST_USEOVERVIEWS		= "Benutze Questanweisungen, wenn keine Ziele vorhanden sind"
	MONKEYBUDDY_QUEST_HIDEHEADERS			= "Verberge Questzonen, wenn ausgeblendete Elemente versteckt werden"
	MONKEYBUDDY_QUEST_ALWAYSHEADERS		= "Zeige die Questzonen immer"
	MONKEYBUDDY_QUEST_HIDEBORDER			= "Verberge den Rahmen"
	MONKEYBUDDY_QUEST_GROWUP			= "Erweitere MonkeyQuest nach oben hin"
	MONKEYBUDDY_QUEST_SHOWNUMQUESTS		= "Zeige die Anzahl der Quests"
	MONKEYBUDDY_QUEST_LOCK				= "Fixiere das MonkeyQuest Fenster"
	MONKEYBUDDY_QUEST_COLOURTITLEON		= "F\195\164rbe die Quests der Schwierigkeit ensprechend ein"
	MONKEYBUDDY_QUEST_HIDECOMPLETEDQUESTS	= "Verberge erf\195\188llte Quests"
	MONKEYBUDDY_QUEST_HIDECOMPLETEDOBJECTIVES	= "Verberge erf\195\188llte Ziele"
	MONKEYBUDDY_QUEST_SHOWTOOLTIPOBJECTIVES	= "Zeige Zielfortschritte in Tooltips"
	MONKEYBUDDY_QUEST_ALLOWRIGHTCLICK		= "\195\150ffnen von MonkeyBuddy durch Rechtsklick erm\195\182glichen"
	MONKEYBUDDY_QUEST_HIDETITLEBUTTONS		= "Verberge die Titel-Buttons"
	MONKEYBUDDY_QUEST_HIDETITLE			= "Verberge den Text (" .. MONKEYBUDDY_QUEST_TITLE .. ") im Titel"
	MONKEYBUDDY_QUEST_CRASHFONT			= "Verwende eine d\195\188nne Schriftart"
	MONKEYBUDDY_QUEST_CRASHBORDER			= "Benutze die goldene Rahmen-Farbe"
	MONKEYBUDDY_QUEST_SHOWNOOBTIPS		= "Zeige hilfreiche Kurzinfos f\195\188r Anf\195\164nger"
	MONKEYBUDDY_QUEST_SHOWZONEHIGHLIGHT		= "Hebe die aktuelle Questzone hervor"
	MONKEYBUDDY_QUEST_SHOWQUESTLEVEL		= "Zeige das Questlevel"
	
	
	MONKEYBUDDY_QUEST_QUESTTITLECOLOUR		= "Quest-Titel"
	MONKEYBUDDY_QUEST_HEADEROPENCOLOUR		= "Offene Zonen"
	MONKEYBUDDY_QUEST_HEADERCLOSEDCOLOUR	= "Geschlossene Zonen"
	MONKEYBUDDY_QUEST_OVERVIEWCOLOUR		= "Questanweisungen"
	MONKEYBUDDY_QUEST_SPECIALOBJECTIVECOLOUR	= "Spezielle Ziele"
	MONKEYBUDDY_QUEST_INITIALOBJECTIVECOLOUR	= "Ziele zu 0% erf\195\188llt"
	MONKEYBUDDY_QUEST_MIDOBJECTIVECOLOUR	= "Ziele zu 50% erf\195\188llt"
	MONKEYBUDDY_QUEST_COMPLETEOBJECTIVECOLOUR	= "Ziele zu 100% erf\195\188llt"
	MONKEYBUDDY_QUEST_ZONEHIGHLIGHTCOLOUR	= "Questzonen-Hervorhebung"
	
	MONKEYBUDDY_QUEST_FRAMEALPHASLIDER		= "Global Alpha"
	MONKEYBUDDY_QUEST_ALPHASLIDER			= "Hintergrund Alpha"
	MONKEYBUDDY_QUEST_WIDTHSLIDER			= "Fensterbreite"
	MONKEYBUDDY_QUEST_FONTSLIDER			= "Schriftgr\195\182\195\159e"
	MONKEYBUDDY_QUEST_PADDINGSLIDER		= "Zeilenabstand"
	
	-- defs for MonkeySpeed
	MONKEYBUDDY_SPEED_OPEN				= "\195\150ffne MonkeySpeed"
	MONKEYBUDDY_SPEED_PERCENT			= "Zeige Geschwindigkeit in Prozent"
	MONKEYBUDDY_SPEED_BAR				= "Zeige Geschwindigkeit als farbigen Hintergrund"
	MONKEYBUDDY_SPEED_LOCK				= "Fixiere das MonkeySpeed Fenster"
	
	MONKEYBUDDY_SPEED_WIDTHSLIDER			= "Fensterbreite"
	MONKEYBUDDY_SPEED_ALLOWRIGHTCLICK		= "\195\150ffnen von MonkeyBuddy durch Rechtsklick erm\195\182glichen"
	
	-- defs for MonkeyClock
	MONKEYBUDDY_CLOCK_OPEN				= "\195\150ffne MonkeyClock"
	MONKEYBUDDY_CLOCK_HIDEBORDER			= "Verberge den Rahmen"
	MONKEYBUDDY_CLOCK_USEMILITARYTIME		= "Benutze den 24-Stundentakt"
	MONKEYBUDDY_CLOCK_LOCK				= "Fixiere das MonkeyClock Fenster"
	MONKEYBUDDY_CLOCK_CHATALARM			= "Aktviere die Alarm-Mitteilung im Nachrichtenfenster"
	MONKEYBUDDY_CLOCK_DIALOGALARM			= "Aktiviere die Alarm-Mitteilung als PopUp mit Verl\195\164ngerungsoption"

	MONKEYBUDDY_CLOCK_HOURSLIDER			= "Stundenausgleich"
	MONKEYBUDDY_CLOCK_MINUTESLIDER		= "Minutenausgleich"
	
	MONKEYBUDDY_CLOCK_ALARMHOURSLIDER		= "Alarmstunde"
	MONKEYBUDDY_CLOCK_ALARMMINUTESLIDER		= "Alarmminute"
	MONKEYBUDDY_CLOCK_ALLOWRIGHTCLICK		= "\195\150ffnen von MonkeyBuddy durch Rechtsklick erm\195\182glichen"
	
	-- bindings
	BINDING_NAME_MONKEYBUDDY_OPEN 		= "\195\150ffne/Schlie\195\159e das Optionsfenster"
end

-- English
MONKEYSPEED_TITLE			= "MonkeySpeed"
MONKEYSPEED_VERSION			= "2.4"
MONKEYSPEED_TITLE_VERSION	= MONKEYSPEED_TITLE .. " v" .. MONKEYSPEED_VERSION
MONKEYSPEED_DESCRIPTION		= "Displays your speed as a percentage of run speed."
MONKEYSPEED_DESCRIPTION2	= "Shift-Left Click to Calibrate. Shift-Right Click to hide."
MONKEYSPEED_LOADED			= "|cffffff00" .. MONKEYSPEED_TITLE .. " v" .. MONKEYSPEED_VERSION .. " loaded"

MONKEYSPEED_CONFIRM_RESET	= "Okay to reset " .. MONKEYSPEED_TITLE .. " settings to default values?"


-- Special zone names
MONKEYSPEED_BLACKROCK		= "Blackrock Mountain"
MONKEYSPEED_WARSONG			= "Warsong Gulch"
MONKEYSPEED_ALTERAC			= "Alterac Valley"
MONKEYSPEED_ARATHI			= "Arathi Basin"
