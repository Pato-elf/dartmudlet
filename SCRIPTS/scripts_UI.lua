GUI = GUI or {}
local windows = {}
local windows_ByPosition = {}
windows_ByPosition.topRight = {}
windows_ByPosition.topLeft = {}
windows_ByPosition.right = {}

	local StyleButtonOn = Geyser.StyleSheet:new([[
		QLabel{
				color: black;
				background-color: palegreen;
				margin: 5px;
				border-width: 2px;
				border-style: solid;
				border-color: black;
				border-radius: 10px;
				font-size: 14pt;
				font-family: Bitstream Vera Sans Mono;
				qproperty-alignment: 'Center';
			}
	]])
	
	local StyleButtonOff = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #696969;
			margin: 5px;
			border-width: 2px;
			border-style: solid;
			border-color: black;
			border-radius: 10px;
			font-size: 14pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	local StyleBoxBlue = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: rgb(0,0,70);
			margin: 5px;
			border-radius: 10px;
			padding: 10px;
			font-size: 20pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'Center';
		}
	]])

	local StyleBoxLevels = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: rgb(0,0,70);
			margin: 5px;
			border-radius: 10px;
			padding: 10px;
			font-size: 10pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'AlignTop | AlignLeft';
		}
	]])

	local StyleBoxHelp = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: rgb(0,0,70);
			margin: 5px;
			border-radius: 10px;
			padding: 10px;
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			qproperty-alignment: 'AlignTop | AlignLeft';
		}
	]])


aura = "unknown"

-- CREATE GUI
---------------------------------------------------------------------
local function createUIConsole()
GUI.top = Adjustable.Container:new({name = "top",x=0, y=0, height=188})
GUI.right = Adjustable.Container:new({name = "right", x=-600, y=0, width=600, height="100%"})


GUI.top:attachToBorder("top")
GUI.right:attachToBorder("right")
GUI.top:connectToBorder("right")


GUI.top:setTitle("")
GUI.right:setTitle("")


GUI.top:setBorderMargin(0)
GUI.top:setPadding(2)
GUI.right:setBorderMargin(0)
GUI.right:setPadding(2)


GUI.tabwindow1 = GUI.tabwindow1 or
	Adjustable.TabWindow:new({
		name = "tabwindow1",
		x = 0, y = 0,
		width = "100%",
		height = "30%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"WHO","LEVELS"},
	},GUI.right)


GUI.tabwindow2 = GUI.tabwindow2 or
	Adjustable.TabWindow:new({
		name = "tabwindow2",
		x = 0, y = "30%",
		width = "100%",
		height = "40%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"IMPROVES","MESSAGE","CHANNEL","REFRESH","ALLOCS"},
	},GUI.right)

 
GUI.tabwindow3 = GUI.tabwindow3 or
	Adjustable.TabWindow:new({
		name = "tabwindow3",
		x = 0, y = "70%",
		width = "100%",
		height = "30%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"INFO","HELP"},
	},GUI.right)


GUI.tabwindow4 = GUI.tabwindow4 or
	Adjustable.TabWindow:new({
		name = "tabwindow4",
		x = 0, y = 0,
		width = "100%",
		height = "100%",
		tabBarHeight = 20,
		activeTabBGColor = "rgb(0,0,192)",
		color1 = "rgb(0,0,192)",
		centerStyle = "background-color: black; border-radius: 10px; margin: 5px;",
		tabs = {"CHAT"},
	},GUI.top)
  


-------------------------------------------------------------------------------
-- TABWINDOW1 -----------------------------------------------------------------
-------------------------------------------------------------------------------



-- CREATE WHO BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerWhoBox = GUI.containerWhoBox or
	Geyser.MiniConsole:new({
		name = "WhoBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow1.WHOcenter)

local window								= {border = GUI.tabwindow1.WHOcenter, container = GUI.containerWhoBox}
windows["WhoBox"]							= window
windows_ByPosition["topLeft"]["WhoBox"]		= window



-- CREATE LEVELS BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerLevelsBox = GUI.containerLevelsBox or
	Geyser.Label:new({
		name = "LevelsBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow1.LEVELScenter)

GUI.containerLevelsBox:setStyleSheet(StyleBoxLevels:getCSS())

echo("LevelsBox", Info.showQuickLevels())

local window								= {border = GUI.tabwindow1.LEVELScenter, container = GUI.containerLevelsBox}
windows["LevelsBox"]						= window
windows_ByPosition["topLeft"]["LevelsBox"]	= window



-------------------------------------------------------------------------------
-- TABWINDOW2 -----------------------------------------------------------------
-------------------------------------------------------------------------------



-- CREATE IMPROVE BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerImproveBox = GUI.containerImproveBox or
	Geyser.MiniConsole:new({
		name = "ImproveBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow2.IMPROVEScenter)

local window								= {border = GUI.tabwindow2.IMPROVEScenter, container = GUI.containerImproveBox}
windows["ImproveBox"]						= window
windows_ByPosition["topLeft"]["ImproveBox"]	= window



-- CREATE MESSAGE BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerMessageBox = GUI.containerMessageBox or
	Geyser.MiniConsole:new({
		name = "MessageBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow2.MESSAGEcenter)

local window								= {border = GUI.tabwindow2.MESSAGEcenter, container = GUI.containerMessageBox}
windows["MessageBox"]						= window
windows_ByPosition["topLeft"]["MessageBox"]	= window



-- CREATE REFRESH BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerRefreshBox = GUI.containerRefreshBox or
	Geyser.Label:new({
		name = "RefreshBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow2.REFRESHcenter)

GUI.containerRefreshBox:setStyleSheet(StyleBoxBlue:getCSS())

echo("RefreshBox", Info.showUnderConstruction())

local window								= {border = GUI.tabwindow2.REFRESHcenter, container = GUI.containerRefreshBox}
windows["RefreshBox"]						= window
windows_ByPosition["topLeft"]["RefreshBox"]	= window



	-- CREATE REFRESH BUTTON1 -> REFRESH -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerRefreshButton1 = GUI.containerRefreshButton1 or
		Geyser.Label:new({
			name = "RefreshButton1",
			x = 50, y = 50,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.containerRefreshButton1:setStyleSheet(StyleButtonOff:getCSS())
	echo("RefreshButton1", "<center>REFRESH OFF</center>")

	GUI.containerRefreshButton1:setClickCallback("RefreshButton1_click")

	local window									= {border = GUI.containerRefreshBox, container = GUI.containerRefreshButton1}
	windows["RefreshButton1"]						= window
	windows_ByPosition["topLeft"]["RefreshButton1"]	= window


	function RefreshButton1_click()
		if not Status.statusRefresh then
			Status.statusRefresh = true
			GUI.containerRefreshButton1:setStyleSheet(StyleButtonOn:getCSS())
			echo("RefreshButton1", "<center>REFRESH ON</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Refresh: On\n"})
			cecho("<yellow>Refresh: On\n")
		else
			Status.statusRefresh = false
			GUI.containerRefreshButton1:setStyleSheet(StyleButtonOff:getCSS())
			echo("RefreshButton1", "<center>REFRESH OFF</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Refresh: Off\n"})
			cecho("<yellow>Refresh: Off\n")
		end
	end



-- CREATE CHANNEL BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerChannelBox = GUI.containerChannelBox or
	Geyser.Label:new({
		name = "ChannelBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow2.CHANNELcenter)

GUI.containerChannelBox:setStyleSheet(StyleBoxBlue:getCSS())

echo("ChannelBox", Info.showUnderConstruction())

local window								= {border = GUI.tabwindow2.CHANNELcenter, container = GUI.containerChannelBox}
windows["ChannelBox"]						= window
windows_ByPosition["topLeft"]["ChannelBox"]	= window



	-- CREATE CHANNEL BUTTON1 -> CHANNEL -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerChannelButton1 = GUI.containerChannelButton1 or
		Geyser.Label:new({
			name = "ChannelButton1",
			x = 50, y = 50,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelButton1:setStyleSheet(StyleButtonOff:getCSS())
	echo("ChannelButton1", "<center>CHANNEL OFF</center>")

	GUI.containerChannelButton1:setClickCallback("ChannelButton1_click")

	local window									= {border = GUI.containerChannelBox, container = GUI.containerChannelButton1}
	windows["ChannelButton1"]						= window
	windows_ByPosition["topLeft"]["ChannelButton1"]	= window


	function ChannelButton1_click()
		if not Status.statusChannel then
			Status.statusChannel = true
			GUI.containerChannelButton1:setStyleSheet(StyleButtonOn:getCSS())
			echo("ChannelButton1", "<center>CHANNEL ON</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Channel: On\n"})
			cecho("<yellow>Channel: On\n")
			send("conc", false)
		else
			Status.statusChannel = false
			GUI.containerChannelButton1:setStyleSheet(StyleButtonOff:getCSS())
			echo("ChannelButton1", "<center>CHANNEL OFF</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Channel: Off\n"})
			cecho("<yellow>Channel: Off\n")
			send("conc", false)
		end
	end



-- CREATE ALLOCS BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerAllocsBox = GUI.containerAllocsBox or
	Geyser.Label:new({
		name = "AllocsBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow2.ALLOCScenter)

GUI.containerAllocsBox:setStyleSheet(StyleBoxBlue:getCSS())

echo("AllocsBox", Info.showUnderConstruction())

local window								= {border = GUI.tabwindow2.ALLOCScenter, container = GUI.containerAllocsBox}
windows["AllocsBox"]						= window
windows_ByPosition["topLeft"]["AllocsBox"]	= window



-------------------------------------------------------------------------------
-- TABWINDOW3 -----------------------------------------------------------------
-------------------------------------------------------------------------------



-- CREATE HELP BOX -> TABWINDOW3
-----------------------------------------------------------
GUI.containerHelpBox = GUI.containerHelpBox or
	Geyser.Label:new({
		name = "HelpBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow3.HELPcenter)

GUI.containerHelpBox:setStyleSheet(StyleBoxHelp:getCSS())

echo("HelpBox", Info.showQuickHelp())

local window								= {border = GUI.tabwindow3.HELPcenter, container = GUI.containerHelpBox}
windows["HelpBox"]							= window
windows_ByPosition["topLeft"]["HelpBox"]	= window



-- CREATE INFO BOX -> TABWINDOW3
-----------------------------------------------------------
GUI.containerInfoBox = GUI.containerInfoBox or
	Geyser.Label:new({
		name = "InfoBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow3.INFOcenter)


GUI.containerInfoBox:setStyleSheet([[
		QLabel{
			color: black;
			background-color: black;
			margin: 10px;
		}
]])

local window								= {border = GUI.tabwindow3.INFOcenter, container = GUI.containerInfoBox}
windows["InfoBox"]							= window
windows_ByPosition["topLeft"]["InfoBox"]	= window



	-- CREATE NAME BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerNameBox = GUI.containerNameBox or
		Geyser.Label:new({
			name = "NameBox",
			x = 0, y = 8,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerNameBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])

	local window								= {border = GUI.containerInfoBox, container = GUI.containerNameBox}
	windows["NameBox"]							= window
	windows_ByPosition["topLeft"]["NameBox"]	= window



	-- CREATE AGE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerAgeBox = GUI.containerAgeBox or
		Geyser.Label:new({
			name = "AgeBox",
			x = 0, y = 25,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerAgeBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])

	local window								= {border = GUI.containerInfoBox, container = GUI.containerAgeBox}
	windows["AgeBox"]							= window
	windows_ByPosition["topLeft"]["AgeBox"]		= window



	-- CREATE HUNGER BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerHungerBox = GUI.containerHungerBox or
		Geyser.Label:new({
			name = "HungerBox",
			x = 0, y = 43,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerHungerBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])

	local window								= {border = GUI.containerInfoBox, container = GUI.containerHungerBox}
	windows["HungerBox"]						= window
	windows_ByPosition["topLeft"]["HungerBox"]	= window



	-- CREATE THIRST BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerThirstBox = GUI.containerThirstBox or
		Geyser.Label:new({
			name = "ThirstBox",
			x = 0, y = 59,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerThirstBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])
	
	local window								= {border = GUI.containerInfoBox, container = GUI.containerThirstBox}
	windows["ThirstBox"]						= window
	windows_ByPosition["topLeft"]["ThirstBox"]	= window



	-- CREATE ENCUMBRANCE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerEncumbranceBox = GUI.containerEncumbranceBox or
		Geyser.Label:new({
			name = "EncumbranceBox",
			x = 0, y = 76,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerEncumbranceBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])

	local window									= {border = GUI.containerInfoBox, container = GUI.containerEncumbranceBox}
	windows["EncumbranceBox"]						= window
	windows_ByPosition["topLeft"]["EncumbranceBox"]	= window



	-- CREATE MOVEMENT BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerMovementBox = GUI.containerMovementBox or
		Geyser.Label:new({
			name = "MovementBox",
			x = 0, y = 93,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerMovementBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])

	local window									= {border = GUI.containerInfoBox, container = GUI.containerMovementBox}
	windows["MovementBox"]							= window
	windows_ByPosition["topLeft"]["MovementBox"]	= window
	
	

	-- CREATE DATE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerDateBox = GUI.containerDateBox or
		Geyser.Label:new({
			name = "DateBox",
			x = 0, y = 110,
			fontSize = 11,
			width = 360,
			height = 34,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerDateBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])
	
	local window								= {border = GUI.containerInfoBox, container = GUI.containerDateBox}
	windows["DateBox"]							= window
	windows_ByPosition["topLeft"]["DateBox"]	= window



	-- CREATE LANGUAGE BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerLanguageBox = GUI.containerLanguageBox or
		Geyser.Label:new({
			name = "LanguageBox",
			x = -235, y = 127,
			fontSize = 11,
			width = 235,
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerLanguageBox:setStyleSheet([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])
	
	local window									= {border = GUI.containerInfoBox, container = GUI.containerLanguageBox}
	windows["LanguageBox"]							= window
	windows_ByPosition["topLeft"]["LanguageBox"]	= window



	-- CREATE HOLDER BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerHolderBox = GUI.containerHolderBox or
		Geyser.Label:new({
			name = "HolderBox",
			x = 0, y = -133,
			fontSize = 24,
			width = "100%",
			height = 133,
			color = "black"
		}, GUI.containerInfoBox)

	GUI.containerHolderBox:setStyleSheet([[
			QLabel{
				color: black;
				background-color: black;
				margin: 0 10px 11px 10px;
				border: 2px solid white;
			}
	]])

	local window									= {border = GUI.containerInfoBox, container = GUI.containerHolderBox}
	windows["HolderBox"]							= window
	windows_ByPosition["topLeft"]["HolderBox"]	= window



		-- CREATE AURA BOX -> HOLDER -> INFO -> TABWINDOW3
		-------------------------------------------------------
		GUI.containerAuraBox = GUI.containerAuraBox or
			Geyser.Label:new({
				name = "AuraBox",
				message = [[<center>no aura</center>]],
				x = 0, y = 2,
				fontSize = 24,
				width = "100%",
				height = 58,
				color = "black"
			}, GUI.containerHolderBox)

		GUI.containerAuraBox:setStyleSheet([[
			QLabel{
				font-size: 30px;
				font-weight: bold;
				font-family: verdana, tahoma;
				background-color: black;
				margin: 0px 12px 0px 12px;
			}
		]])

		local window								= {border = GUI.containerHolderBox, container = GUI.containerAuraBox}
		windows["AuraBox"]							= window
		windows_ByPosition["topLeft"]["AuraBox"]	= window



		-- CREATE CONC BOX -> HOLDER -> INFO -> TABWINDOW3
		-------------------------------------------------------
		GUI.containerConcBox = GUI.containerConcBox or
			Geyser.Label:new({
				name = "ConcBox",
				message = [[<center>unknown concentration</center>]],
				x = 0, y = 60,
				fontSize = 22,
				width = "100%",
				height = 62,
				color = "black"
			}, GUI.containerHolderBox)

		GUI.containerConcBox:setStyleSheet([[
			QLabel{
				font-size: 22px;
				font-weight: bold;
				font-family: verdana, tahoma;
				background-color: black;
				margin: 0px 10px 0px 10px;
				border: 2px solid white;
			}
		]])

		local window								= {border = GUI.containerHolderBox, container = GUI.containerConcBox}
		windows["ConcBox"]							= window
		windows_ByPosition["topLeft"]["ConcBox"]	= window



-------------------------------------------------------------------------------
-- TABWINDOW4 -----------------------------------------------------------------
-------------------------------------------------------------------------------



-- CREATE CHATHOLDER BOX -> TABWINDOW4
-----------------------------------------------------------
GUI.containerChatholderBox = GUI.containerChatholderBox or
	Geyser.Label:new({
		name = "ChatholderBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow4.CHATcenter)


GUI.containerChatholderBox:setStyleSheet([[
		QLabel{
			color: black;
			background-color: black;
			margin: 9px;
		}
]])

local window									= {border = GUI.tabwindow4.CHATcenter, container = GUI.containerChatholderBox}
windows["ChatholderBox"]						= window
windows_ByPosition["topLeft"]["ChatholderBox"]	= window



	-- CREATE CHAT BOX -> CHATHOLDER -> TABWINDOW4
	-----------------------------------------------------------
	GUI.containerChatBox = GUI.containerChatBox or
		Geyser.MiniConsole:new({
			name = "ChatBox",
			x = 9, y = 9,
			fontSize = 8,
			width = -9,
			height = -9,
			color = "black"
		}, GUI.containerChatholderBox)

	local window								= {border = GUI.containerChatholderBox, container = GUI.containerChatBox}
	windows["ChatBox"]							= window
	windows_ByPosition["topLeft"]["ChatBox"]	= window




  

--GUI.top:load()
--GUI.right:load()
--GUI.tabwindow1:load()



end --createUIConsole



-- UPDATES ----------------------------------------------------------



-- update chat box
-----------------------------------------------------------
local function onChat(args)
	local text = args["message"]
	local ts = getTime(true, "hh:mm:ss")
	local container = windows["ChatBox"]["container"]
	container:echo(ts.." ")

	-- even though we get the text passed into the event we will get the text
	-- from buffer to preserve colors/formatting
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end



-- update who box
-----------------------------------------------------------
local function onWho(args)
	local container = windows["WhoBox"]["container"]
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	deleteLine()
end

local function onStartWho(args)
	local container = windows["WhoBox"]["container"]
	clearWindow("WhoBox")
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	Events.addListener("whoEvent", sourceName, onWho)
	deleteLine()
end

local function onWhoEnd(args)
	local container = windows["WhoBox"]["container"]
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	Events.removeListener("whoEvent", sourceName)
	deleteLine()
end



-- update message box
-----------------------------------------------------------
local function onMessage(args)
	message = args["message"]
	cecho("MessageBox", " "..message)
end



-- update improves box
-----------------------------------------------------------
local function onImprove(args)
	local who = args["name"]
	local skill_name = args["skill_name"]
	local timestamp = getTime(true, "hh:mm:ss")
	local container = windows["ImproveBox"]["container"]
	local count = 0
	local output = ''

	if args["text"] ~= nil then
		output = timestamp.." "..args["text"]
	else
	
		local skillVar = Skills.getSkill({who = who, skill_name = skill_name})

		if skillVar ~= -1 then
			count = tonumber(skillVar.count)-- + 1
		else
			count = 1
		end

		local level = Skills.imp2lvl(count)
		local nextLevel = level.next_level
		if nextLevel == nil then
			if(who ~= Status.name) then
				output = timestamp.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..")"
			else
				output = timestamp.." "..skill_name.." - "..count.." ("..level.abbr..")"
			end
		else
			local tilNext = nextLevel.min - count
			if(who ~= Status.name) then
				output = timestamp.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
			else
				output = timestamp.." "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
			end
		end
	end
	
	container:echo(" "..output.."\n")
end

local function onSkillMistake(args)
	local container = windows["ImproveBox"]["container"]
	selectCurrentLine("ImproveBox")
	deleteLine("ImproveBox")
	container:echo("")
end



-- update name box
-----------------------------------------------------------
local function onName(args)
	showname = args["fullname"]
	name_table = showname:split("are ")
	showname = name_table[2]
	name_table2 = showname:split("%. ")
	showname = name_table2[1]

	cecho("\n"..showname)
	clearWindow("NameBox")
	cecho("NameBox", "Name: "..showname)
	deleteLine()
end



-- update age box
-----------------------------------------------------------
local function onAge(args)
	years = args["years"]
	months = args["months"]
	clearWindow("AgeBox")
	if months == "" then months = "0" end
	cecho("AgeBox", "Age: "..years.." years, "..months.." months")
	deleteLine()
end



-- update hunger box
-----------------------------------------------------------
local function onHunger(args)
	hunger = args["hunger"]

	if hunger == "well fed" then hunger = "<pale_green>"..hunger
	elseif hunger == "not hungry" then hunger = "<pale_green>"..hunger
	elseif hunger == "slightly hungry" then hunger = "<yellow>"..hunger
	elseif hunger == "hungry" then hunger = "<yellow>"..hunger
	elseif hunger == "famished" then hunger = "<red>"..hunger
	elseif hunger == "faint from hunger" then hunger = "<red>"..hunger
	elseif hunger == "starving" then hunger = "<red>"..hunger
	elseif hunger == "starving to death" then hunger = "<red>"..hunger
	end
	
	clearWindow("HungerBox")
	cecho("HungerBox", "Hunger: "..hunger)
	moveCursorEnd()
end



-- update thirst box
-----------------------------------------------------------
local function onThirst(args)
	thirst = args["thirst"]
	
	if thirst == "well slaked" then thirst = "<pale_green>"..thirst
	elseif thirst == "not thirsty" then thirst = "<pale_green>"..thirst
	elseif thirst == "slightly thirsty" then thirst = "<yellow>"..thirst
	elseif thirst == "thirsty" then thirst = "<yellow>"..thirst
	elseif thirst == "parched" then thirst = "<red>"..thirst
	elseif thirst == "faint from thirst" then thirst = "<red>"..thirst
	elseif thirst == "completely dehydrated" then thirst = "<red>"..thirst
	elseif thirst == "dying of thirst" then thirst = "<red>"..thirst
	end
	
	clearWindow("ThirstBox")
	cecho("ThirstBox", "Thirst: "..thirst)
	deleteLine()
	moveCursorEnd()
end



-- update encumbrance box
-----------------------------------------------------------
local function onEncumbrance(args)
	encumbrance = args["encumbrance"]

	clearWindow("EncumbranceBox")
	cecho("EncumbranceBox", "Encumbrance: "..encumbrance)
	deleteLine()
	moveCursorEnd()
end



-- update movement box
-----------------------------------------------------------
local function onMovement(args)
	movement = args["movement"]

	clearWindow("MovementBox")
	cecho("MovementBox", " Movement: "..movement)
	deleteLine()
	moveCursorEnd()
end



-- update date box
-----------------------------------------------------------
local function refreshUI(args)
--  for key,window in pairs(windows) do
--    local container = window["container"]

--    insertText(container["name"], "")
--  end

	clearWindow("DateBox")
	cecho("DateBox", "Date(common): "..date.format(os.time(), 3, "common").."\nDate(Thorpian): "..date.format(os.time(), 3, "thorpian"))
end



-- update language box
-----------------------------------------------------------
local function onLanguage(args)
	local language = args["detail"]
	local language_table = language:split("now ")
	language = language_table[2]
	local language_table2 = language:split("%.")
	language = language_table2[1]
	clearWindow("LanguageBox")
	cecho("LanguageBox", "<cyan><b>"..language.."</b>")
end



-- update aura box
-----------------------------------------------------------
local function onAura(args)
	aura = args["aura"]
	auraBoxTextColor = "white"
	auraBoxBGColor = "black"
	scintBackground = packageFolder.."MEDIA/rainbow_small.png"

	deleteLine()
	moveCursorEnd()

	if aura == "scintillating" then auraBoxTextColor = "mediumblue" auraBoxBGColor = "crimson"
	elseif aura == "intense octarine" then auraBoxTextColor = "indigo" auraBoxBGColor = "aquamarine"
	elseif aura == "octarine" then auraBoxTextColor = "mediumvioletred" auraBoxBGColor = "aquamarine"
	elseif aura == "dim octarine" then auraBoxTextColor = "black" auraBoxBGColor = "aquamarine"  
	elseif aura == "intense violet" then auraBoxTextColor = "white" auraBoxBGColor = "darkmagenta"
	elseif aura == "violet" then auraBoxTextColor = "lightgrey" auraBoxBGColor = "darkmagenta"
	elseif aura == "dim violet" then auraBoxTextColor = "darkgrey" auraBoxBGColor = "darkmagenta"
	elseif aura == "intense indigo" then auraBoxTextColor = "white" auraBoxBGColor = "midnightblue"
	elseif aura == "indigo" then auraBoxTextColor = "lightgrey" auraBoxBGColor = "midnightblue"
	elseif aura == "dim indigo" then auraBoxTextColor = "dimgrey" auraBoxBGColor = "midnightblue"
	elseif aura == "intense blue" then auraBoxTextColor = "white" auraBoxBGColor = "blue"
	elseif aura == "blue" then auraBoxTextColor = "lightgrey" auraBoxBGColor = "blue"
	elseif aura == "greenish-blue" then auraBoxTextColor = "green" auraBoxBGColor = "blue"
	elseif aura == "bluish-green" then auraBoxTextColor = "blue" auraBoxBGColor = "darkgreen"
	elseif aura == "green" then auraBoxTextColor = "lightgreen" auraBoxBGColor = "darkgreen"
	elseif aura == "yellowish-green" then auraBoxTextColor = "yellow" auraBoxBGColor = "darkgreen"
	elseif aura == "greenish-yellow" then auraBoxTextColor = "darkgreen" auraBoxBGColor = "yellow"
	elseif aura == "yellow" then auraBoxTextColor = "darkgoldenrod" auraBoxBGColor = "yellow"
	elseif aura == "orangish-yellow" then auraBoxTextColor = "orangered" auraBoxBGColor = "yellow"
	elseif aura == "yellowish-orange" then auraBoxTextColor = "yellow" auraBoxBGColor = "orangered"
	elseif aura == "orange" then auraBoxTextColor = "white" auraBoxBGColor = "orangered"
	elseif aura == "reddish-orange" then auraBoxTextColor = "darkred" auraBoxBGColor = "orangered"
	elseif aura == "orangish-red" then auraBoxTextColor = "orangered" auraBoxBGColor = "darkred"
	elseif aura == "red" then auraBoxTextColor = "white" auraBoxBGColor = "darkred"
	elseif aura == "dim red" then auraBoxTextColor = "darkgrey" auraBoxBGColor = "darkred"
	elseif aura == "very dim red" then auraBoxTextColor = "black" auraBoxBGColor = "darkred"
	else aura = "no aura" auraBoxTextColor = "white" auraBoxBGColor = "black"
	end

	if aura == "scintillating" then
	setLabelStyleSheet("AuraBox",[[
		QLabel{
			font-size: 30px;
			font-weight: bold;
			font-family: verdana, tahoma;
			border-image: url("]]..scintBackground..[[");
			background-color: ]]..auraBoxBGColor..[[;
			margin: 0px 12px 0px 12px;
			border: 2px solid white;
		}
	]])
	else
	setLabelStyleSheet("AuraBox",[[
		QLabel{
			font-size: 30px;
			font-weight: bold;
			font-family: verdana, tahoma;
			background-color: ]]..auraBoxBGColor..[[;
			margin: 0px 12px 0px 12px;
		}
	]])
	end
	
	echo("AuraBox", [[<center style="color:]]..auraBoxTextColor..[[;">]]..aura.."</center>")

end



-- update concentration box
-----------------------------------------------------------
local function onConc(args)
	conc = args["conc"]
	concBoxTextColor = "white"
	concBoxBGColor = "black"

	deleteLine()
	moveCursorEnd()

	if conc == "You're bright-eyed and bushy-tailed." then concBoxTextColor = "white" concBoxBGColor = "darkgreen"
	elseif conc == "You're a bit off balance." then concBoxTextColor = "lightgrey" concBoxBGColor = "green"
	elseif conc == "You're somewhat distracted." then concBoxTextColor = "black" concBoxBGColor = "green"
	elseif conc == "You're off balance." then concBoxTextColor = "grey" concBoxBGColor = "yellow"
	elseif conc == "You're quite distracted." then concBoxTextColor = "black" concBoxBGColor = "goldenrod"
	elseif conc == "You're distracted and off balance." then concBoxTextColor = "white" concBoxBGColor = "red"
	elseif conc == "Your concentration is shot to hell." then concBoxTextColor = "white" concBoxBGColor = "darkred"
	elseif conc == "You're too confused to remember your name." then concBoxTextColor = "black" concBoxBGColor = "darkred"
	end

	setLabelStyleSheet("ConcBox",[[
		QLabel{
			font-size: 22px;
			font-weight: bold;
			font-family: verdana, tahoma;
			background-color: ]]..concBoxBGColor..[[;
			margin: 0px 10px 0px 10px;
			border: 2px solid white;
		}
	]])
 
	if conc == "You're too confused to remember your name." then
		displayConc = "Too confused to remember your name."
	else
		displayConc = conc
	end
	
	echo("ConcBox", [[<center style="color:]]..concBoxTextColor..[[;">]]..displayConc.."</center>")

end





local function setup(args)
  createUIConsole()

--  Events.addListener("sysWindowResizeEvent", sourceName, updateDisplay)
  Events.addListener("chatEvent", sourceName, onChat)
  --Events.addListener("skillImproveEvent", sourceName, onImprove)
  Events.addListener("skillMistakeEvent", sourceName, onSkillMistake)
  Events.addListener("startWhoEvent", sourceName, onStartWho)
  Events.addListener("endWhoEvent", sourceName, onWhoEnd)
  Events.addListener("refreshUIEvent", sourceName, refreshUI)
  Events.addListener("nameEvent", sourceName, onName)
  Events.addListener("SoulAgeEvent", sourceName, onAge)
  Events.addListener("hungerEvent", sourceName, onHunger)
  Events.addListener("thirstEvent", sourceName, onThirst)
  Events.addListener("encumbranceEvent", sourceName, onEncumbrance)
  Events.addListener("movementEvent", sourceName, onMovement)
  Events.addListener("messageEvent", sourceName, onMessage)
  Events.addListener("concEvent", sourceName, onConc)
  Events.addListener("auraEvent", sourceName, onAura)
  Events.addListener("languageEvent", sourceName, onLanguage)
end

local function unsetup(args)
--  Events.removeListener("sysWindowResizeEvent", sourceName)
  Events.removeListener("chatEvent", sourceName)
  --Events.removeListener("skillImproveEvent", sourceName)
  Events.removeListener("skillMistakeEvent", sourceName)
  Events.removeListener("startWhoEvent", sourceName)
  Events.removeListener("whoEvent", sourceName)
  Events.removeListener("endWhoEvent", sourceName)
  Events.removeListener("nameEvent", sourceName)
  Events.removeListener("SoulAgeEvent", sourceName)
  Events.removeListener("hungerEvent", sourceName)
  Events.removeListener("thirstEvent", sourceName)
  Events.removeListener("encumbranceEvent", sourceName)
  Events.removeListener("movementEvent", sourceName)
  Events.removeListener("messageEvent", sourceName)
  Events.removeListener("concEvent", sourceName)
  Events.removeListener("auraEvent", sourceName)
  Events.removeListener("languageEvent", sourceName)


  for key,window in pairs(windows) do
    local container = window["container"]
    local border = window["border"]

    Geyser:remove(container)
    Geyser:remove(border)
  end

  windows = {}
  windows_ByPosition = {}
end

local function resetup(args)
  unsetup(args)
  resetup(args)
end


UI = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,onImprove = onImprove
}

return UI
