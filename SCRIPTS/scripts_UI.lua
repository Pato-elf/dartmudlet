GUI = GUI or {}
local windows = {}
local windows_ByPosition = {}
windows_ByPosition.topRight = {}
windows_ByPosition.topLeft = {}
windows_ByPosition.right = {}

	local StyleButtonPaleGreen = Geyser.StyleSheet:new([[
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

	local StyleButtonPaleBlue = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #9898FB;--#98CFEA;
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
	
	StyleButtonDarkGrey = Geyser.StyleSheet:new([[
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

	StyleButtonLightGrey = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #D3D3D3;
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
	
	local StyleButtonRed = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: red;
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
	
	local StyleTextDefault = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: black;
			margin: 0px 10px 0px 10px;
		}
	]])
	
	local StyleTextBlue = Geyser.StyleSheet:new([[
		QLabel{
			font-size: 11pt;
			font-family: Bitstream Vera Sans Mono;
			background-color: rgb(0,0,70);
			margin: 0px 10px 0px 10px;
		}
	]])

	local StyleCommandLine = Geyser.StyleSheet:new([[
		QPlainTextEdit{
			color: black;
			border: 1px solid silver;
			background-color: #9898FB;
			font: bold 14pt;
			font-family: Bitstream Vera Sans Mono;

		}
	]])



	local StyleDropdown = Geyser.StyleSheet:new([[
		QLabel{
			color: black;
			background-color: #0000C0;
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

	local StyleDropdownChild = Geyser.StyleSheet:new([[
		QLabel{
				color: black;
				background-color: #0000C0;
				border-width: 2px;
				border-style: solid;
				border-color: black;
				font-size: 14pt;
				font-family: Bitstream Vera Sans Mono;
				qproperty-alignment: 'Center';
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
		tabs = {"IMPROVES","CHANNEL","REFRESH","ALLOCS","MESSAGE"},
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

echo("RefreshBox", Info.showInProgress())


-- BLOCK SPOT
	-- CREATE REFRESH BUTTON1 -> REFRESH -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerRefreshButton1 = GUI.containerRefreshButton1 or
		Geyser.Label:new({
			name = "RefreshButton1",
			x = 10, y = 10,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.containerRefreshButton1:setStyleSheet(StyleButtonDarkGrey:getCSS())
	echo("RefreshButton1", "<center>REFRESH OFF</center>")
	GUI.containerRefreshButton1:setToolTip("Turn automatic refresh on/off",Status.tooltipTime)
	GUI.containerRefreshButton1:setClickCallback("RefreshButton1_click")



	function RefreshButton1_click()
		if not Status.statusRefresh then
			Status.statusRefresh = true
			GUI.containerRefreshButton1:setStyleSheet(StyleButtonPaleGreen:getCSS())
			echo("RefreshButton1", "<center>REFRESH ON</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Refresh: On\n"})
			cecho("<yellow>Refresh: On\n")
			send("conc", false)
		else
			Status.statusRefresh = false
			GUI.containerRefreshButton1:setStyleSheet(StyleButtonDarkGrey:getCSS())
			echo("RefreshButton1", "<center>REFRESH OFF</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Refresh: Off\n"})
			cecho("<yellow>Refresh: Off\n")
		end
	end



	-- CREATE COMMANDLINE1 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshCommand1 = GUI.containerRefreshCommand1 or
		Geyser.CommandLine:new({
			name = "RefreshCommand1",
			x = 138, y = 70,
			width = 150, height = 28,
	}, GUI.containerRefreshBox)

	GUI.containerRefreshCommand1:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerRefreshCommand1:print(Status.refreshTarget1)
	
	GUI.containerRefreshCommand1:setAction(
	function(command)
		Events.raiseEvent("setrefreshTargetEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE2 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshCommand2 = GUI.containerRefreshCommand2 or
		Geyser.CommandLine:new({
			name = "RefreshCommand2",
			x = 365, y = 70,
			width = 45, height = 28,
	}, GUI.containerRefreshBox)

	GUI.containerRefreshCommand2:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerRefreshCommand2:print(Status.refreshPower1)
	
	GUI.containerRefreshCommand2:setAction(
	function(command)
		Events.raiseEvent("setrefreshPowerEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE3 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshCommand3 = GUI.containerRefreshCommand3 or
		Geyser.CommandLine:new({
			name = "RefreshCommand3",
			x = 138, y = 100,
			width = 150, height = 28,
	}, GUI.containerRefreshBox)

	GUI.containerRefreshCommand3:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerRefreshCommand3:print(Status.refreshTarget1)
	
	GUI.containerRefreshCommand3:setAction(
	function(command)
		--Events.raiseEvent("setrefreshTargetEvent", {save = true, input = command})
		--GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE4 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshCommand4 = GUI.containerRefreshCommand4 or
		Geyser.CommandLine:new({
			name = "RefreshCommand4",
			x = 365, y = 100,
			width = 45, height = 28,
	}, GUI.containerRefreshBox)

	GUI.containerRefreshCommand4:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerRefreshCommand4:print(Status.refreshPower1)
	
	GUI.containerRefreshCommand4:setAction(
	function(command)
		Events.raiseEvent("setrefreshPowerEvent", {save = true, input = command})
		--GUI.containerChannelButton4:setStyleSheet(StyleButtonPaleBlue:getCSS())
		--tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE TEXTBOX1 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshTextBox1 = GUI.containerRefreshTextBox1 or
		Geyser.Label:new({
			name = "RefreshTextBox1",
			x = 0, y = 76,
			fontSize = 11,
			width = 144,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.containerRefreshTextBox1:setStyleSheet(StyleTextBlue:getCSS())
	cecho("RefreshTextBox1", "<yellow>AUTO TARGET 1")
	GUI.containerRefreshTextBox1:setToolTip("Target to auto refresh",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX2 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshTextBox2 = GUI.containerRefreshTextBox2 or
		Geyser.Label:new({
			name = "RefreshTextBox2",
			x = 298, y = 76,
			fontSize = 11,
			width = 74,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.containerRefreshTextBox2:setStyleSheet(StyleTextBlue:getCSS())
	cecho("RefreshTextBox2", "<yellow>POWER")
	GUI.containerRefreshTextBox2:setToolTip("Aura to use for refresh",Status.tooltipTime)
	
	
	
	-- CREATE TEXTBOX3 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshTextBox3 = GUI.containerRefreshTextBox3 or
		Geyser.Label:new({
			name = "RefreshTextBox3",
			x = 298, y = 106,
			fontSize = 11,
			width = 74,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.containerRefreshTextBox3:setStyleSheet(StyleTextBlue:getCSS())
	cecho("RefreshTextBox3", "<yellow>POWER")
	GUI.containerRefreshTextBox3:setToolTip("Second aura to use for refresh",Status.tooltipTime)



	-- CREATE TEXTBOX4 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerRefreshTextBox4 = GUI.containerRefreshTextBox4 or
		Geyser.Label:new({
			name = "RefreshTextBox4",
			x = 0, y = 106,
			fontSize = 11,
			width = 144,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.containerRefreshTextBox4:setStyleSheet(StyleTextBlue:getCSS())
	cecho("RefreshTextBox4", "<yellow>AUTO TARGET 2")
	GUI.containerRefreshTextBox4:setToolTip("Second target to auto refresh",Status.tooltipTime)
	
	

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

--echo("ChannelBox", Info.showUnderConstruction())

-- BLOCK SPOT

	-- CREATE CHANNEL BUTTON1 -> CHANNEL -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerChannelButton1 = GUI.containerChannelButton1 or
		Geyser.Label:new({
			name = "ChannelButton1",
			x = 10, y = 10,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelButton1:setStyleSheet(StyleButtonDarkGrey:getCSS())
	echo("ChannelButton1", "<center>CHANNEL OFF</center>")
	GUI.containerChannelButton1:setToolTip("Turn automatic channelling on/off",Status.tooltipTime)
	GUI.containerChannelButton1:setClickCallback("ChannelButton1_click")



	function ChannelButton1_click()
		if not Status.statusChannel then
			Status.statusChannel = true
			GUI.containerChannelButton1:setStyleSheet(StyleButtonPaleGreen:getCSS())
			echo("ChannelButton1", "<center>CHANNEL ON</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Channel: On\n"})
			cecho("<yellow>Channel: On\n")
			Status.powercastPauseisActive = false
			send("conc", false)
		else
			Status.statusChannel = false
			GUI.containerChannelButton1:setStyleSheet(StyleButtonDarkGrey:getCSS())
			echo("ChannelButton1", "<center>CHANNEL OFF</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Channel: Off\n"})
			cecho("<yellow>Channel: Off\n")
		end
	end



	-- CREATE CHANNEL BUTTON2 -> CHANNEL -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerChannelButton2 = GUI.containerChannelButton2 or
		Geyser.Label:new({
			name = "ChannelButton2",
			x = 10, y = 51,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelButton2:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("ChannelButton2", "<center>RESET STATS</center>")
	GUI.containerChannelButton2:setToolTip("Reset the powercast stats",Status.tooltipTime)
	GUI.containerChannelButton2:setClickCallback("ChannelButton2_click")

	function ChannelButton2_click()
		GUI.containerChannelButton2:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton2:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("resetPowercastStatsEvent", {input = ""})
	end
	
	
	
	-- CREATE CHANNEL BUTTON3 -> CHANNEL -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerChannelButton3 = GUI.containerChannelButton3 or
		Geyser.Label:new({
			name = "ChannelButton3",
			x = 10, y = 92,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("ChannelButton3", "<center>SAVE SETTINGS</center>")
	GUI.containerChannelButton3:setToolTip("Save the current channel settings",Status.tooltipTime)
	GUI.containerChannelButton3:setClickCallback("ChannelButton3_click")

	function ChannelButton3_click()
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("saveChannelSettingsEvent", {input = ""})
	end



	-- CREATE CHANNEL BUTTON4 -> CHANNEL -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerChannelButton4 = GUI.containerChannelButton4 or
		Geyser.Label:new({
			name = "ChannelButton4",
			x = -315, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelButton4:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("ChannelButton4", "<center><span style='font-size: 22pt;'>&#128227;</span></center>")
	GUI.containerChannelButton4:setToolTip("Share channel stats OOC with the room",Status.tooltipTime)
	GUI.containerChannelButton4:setClickCallback("ChannelButton4_click")

	function ChannelButton4_click()
		if(Status.statusChanShare ~= "off") then
			GUI.containerChannelButton4:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.containerChannelButton4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		end
		Events.raiseEvent("displayStatsEvent", {detail = "share"})
	end	



	-- CREATE CHANNEL BUTTON5 -> CHANNEL -> TABWINDOW2
	-----------------------------------------------------------
	GUI.containerChannelButton5 = GUI.containerChannelButton5 or
		Geyser.Label:new({
			name = "ChannelButton5",
			x = -315, y = 65,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelButton5:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("ChannelButton5", "<center><span style='font-size: 22pt;'>&#9889;</span></center>")
	GUI.containerChannelButton5:setToolTip("Attempt to force a powercast",Status.tooltipTime)
	GUI.containerChannelButton5:setClickCallback("ChannelButton5_click")

	function ChannelButton5_click()
		GUI.containerChannelButton5:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Status.powercastisForce = true
		cecho("<yellow>FORCE POWERCAST\n")
		Events.raiseEvent("processPowercastEvent", arguments)
	end	



	-- CREATE TEXTBOX1 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox1 = GUI.containerChannelTextBox1 or
		Geyser.Label:new({
			name = "ChannelTextBox1",
			x = -265, y = 33,
			fontSize = 11,
			width = 260,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox1:setStyleSheet(StyleTextBlue:getCSS())



	-- CREATE TEXTBOX2 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox2 = GUI.containerChannelTextBox2 or
		Geyser.Label:new({
			name = "ChannelTextBox2",
			x = -265, y = 50,
			fontSize = 11,
			width = 240,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox2:setStyleSheet(StyleTextBlue:getCSS())



	-- CREATE TEXTBOX3 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox3 = GUI.containerChannelTextBox3 or
		Geyser.Label:new({
			name = "ChannelTextBox3",
			x = -265, y = 67,
			fontSize = 11,
			width = 240,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox3:setStyleSheet(StyleTextBlue:getCSS())
	
	
	
	-- CREATE TEXTBOX4 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox4 = GUI.containerChannelTextBox4 or
		Geyser.Label:new({
			name = "ChannelTextBox4",
			x = -265, y = 84,
			fontSize = 11,
			width = 240,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox4:setStyleSheet(StyleTextBlue:getCSS())



	-- CREATE TEXTBOX5 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox5 = GUI.containerChannelTextBox5 or
		Geyser.Label:new({
			name = "ChannelTextBox5",
			x = 0, y = 206,
			fontSize = 11,
			width = 166,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox5:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox5", "<yellow>POWERCAST VALUE")
	GUI.containerChannelTextBox5:setToolTip("Amount of aura needed to trigger a powercast",Status.tooltipTime)



	-- CREATE TEXTBOX6 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox6 = GUI.containerChannelTextBox6 or
		Geyser.Label:new({
			name = "ChannelTextBox6",
			x = 0, y = 236,
			fontSize = 11,
			width = 166,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox6:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox6", "<yellow>POWERCAST MOD")
	GUI.containerChannelTextBox6:setToolTip("Value to add to spell casting\nwhen computing powercast number",Status.tooltipTime)



	-- CREATE TEXTBOX7 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox7 = GUI.containerChannelTextBox7 or
		Geyser.Label:new({
			name = "ChannelTextBox7",
			x = 0, y = 266,
			fontSize = 11,
			width = 166,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox7:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox7", "<yellow>CHANNEL DEFAULT")
	GUI.containerChannelTextBox7:setToolTip("Default amount to channel",Status.tooltipTime)	



	-- CREATE TEXTBOX8 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox8 = GUI.containerChannelTextBox8 or
		Geyser.Label:new({
			name = "ChannelTextBox8",
			x = 0, y = 296,
			fontSize = 11,
			width = 166,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox8:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox8", "<yellow>CHANNEL TEACH")
	GUI.containerChannelTextBox8:setToolTip("Amount to channel while teaching",Status.tooltipTime)



	-- CREATE TEXTBOX9 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox9 = GUI.containerChannelTextBox9 or
		Geyser.Label:new({
			name = "ChannelTextBox9",
			x = 0, y = 326,
			fontSize = 11,
			width = 166,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox9:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox9", "<yellow>CHANNEL FEED")
	GUI.containerChannelTextBox9:setToolTip("Amount to channel while feeding aura\nWILL ONLY CHANNEL ON SCINT AURA",Status.tooltipTime)



	-- CREATE TEXTBOX10 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox10 = GUI.containerChannelTextBox10 or
		Geyser.Label:new({
			name = "ChannelTextBox10",
			x = -332, y = 206,
			fontSize = 11,
			width = 140,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox10:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox10", "<yellow>FOCUS TARGET")
	GUI.containerChannelTextBox10:setToolTip("Object you are channelling to (e.g. necklace)",Status.tooltipTime)



	-- CREATE TEXTBOX11 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox11 = GUI.containerChannelTextBox11 or
		Geyser.Label:new({
			name = "ChannelTextBox11",
			x = -332, y = 236,
			fontSize = 11,
			width = 140,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox11:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox11", "<yellow>FOCUS SOURCE")
	GUI.containerChannelTextBox11:setToolTip("Location of focus (e.g. (held) scrip)\nLeave blank if not needed",Status.tooltipTime)



	-- CREATE TEXTBOX12 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox12 = GUI.containerChannelTextBox12 or
		Geyser.Label:new({
			name = "ChannelTextBox12",
			x = -332, y = 266,
			fontSize = 11,
			width = 140,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox12:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox12", "<yellow>TEACH TARGET")
	GUI.containerChannelTextBox12:setToolTip("Creature that you are teaching",Status.tooltipTime)



	-- CREATE TEXTBOX13 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox13 = GUI.containerChannelTextBox13 or
		Geyser.Label:new({
			name = "ChannelTextBox13",
			x = -332, y = 296,
			fontSize = 11,
			width = 140,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox13:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox13", "<yellow>FEED TARGET")
	GUI.containerChannelTextBox13:setToolTip("Creature that you are feeding aura\nWILL ONLY CHANNEL ON SCINT AURA",Status.tooltipTime)	



	-- CREATE TEXTBOX14 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelTextBox14 = GUI.containerChannelTextBox14 or
		Geyser.Label:new({
			name = "ChannelTextBox14",
			x = -332, y = 326,
			fontSize = 11,
			width = 140,
			height = 17,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox14:setStyleSheet(StyleTextBlue:getCSS())
	cecho("ChannelTextBox14", "<yellow>MISC ADD CMD")
	GUI.containerChannelTextBox14:setToolTip("Send a command of your choice after each channel\nLeave blank if not needed",Status.tooltipTime)
	


	-- CREATE COMMANDLINE1 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand1 = GUI.containerChannelCommand1 or
		Geyser.CommandLine:new({
			name = "ChannelCommand1",
			x = 160, y = 260,
			width = 45, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand1:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand1:print(Status.focusAmountDefault)
	
	GUI.containerChannelCommand1:setAction(
	function(command)
		Events.raiseEvent("setfocusAmountDefaultEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE2 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand2 = GUI.containerChannelCommand2 or
		Geyser.CommandLine:new({
			name = "ChannelCommand2",
			x = -200, y = 200,
			width = 180, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand2:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand2:print(Status.focusTarget)
	
	GUI.containerChannelCommand2:setAction(
	function(command)
		Events.raiseEvent("setfocusTargetEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE3 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand3 = GUI.containerChannelCommand3 or
		Geyser.CommandLine:new({
			name = "ChannelCommand3",
			x = -200, y = 230,
			width = 180, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand3:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand3:print(Status.focusTargetSource)
	
	GUI.containerChannelCommand3:setAction(
	function(command)
		Events.raiseEvent("setfocusTargetSourceEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE4 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand4 = GUI.containerChannelCommand4 or
		Geyser.CommandLine:new({
			name = "ChannelCommand4",
			x = 160, y = 200,
			width = 45, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand4:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand4:print(Status.powercastAmount)
	
	GUI.containerChannelCommand4:setAction(
	function(command)
		Events.raiseEvent("setpowercastAmountEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE5 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand5 = GUI.containerChannelCommand5 or
		Geyser.CommandLine:new({
			name = "ChannelCommand5",
			x = -200, y = 260,
			width = 180, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand5:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand5:print(Status.teachTarget)
	
	GUI.containerChannelCommand5:setAction(
	function(command)
		Events.raiseEvent("setteachTargetEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE6 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand6 = GUI.containerChannelCommand6 or
		Geyser.CommandLine:new({
			name = "ChannelCommand6",
			x = 160, y = 290,
			width = 45, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand6:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand6:print(Status.focusAmountTeach)
	
	GUI.containerChannelCommand6:setAction(
	function(command)
		Events.raiseEvent("setfocusAmountTeachEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE7 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand7 = GUI.containerChannelCommand7 or
		Geyser.CommandLine:new({
			name = "ChannelCommand7",
			x = 160, y = 230,
			width = 45, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand7:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand7:print(Status.powercastAddon)
	
	GUI.containerChannelCommand7:setAction(
	function(command)
		Events.raiseEvent("setpowercastAddonEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE8 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand8 = GUI.containerChannelCommand8 or
		Geyser.CommandLine:new({
			name = "ChannelCommand8",
			x = 160, y = 320,
			width = 45, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand8:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand8:print(Status.focusAmountFeed)
	
	GUI.containerChannelCommand8:setAction(
	function(command)
		Events.raiseEvent("setfocusAmountFeedEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)
	
	
	
	-- CREATE COMMANDLINE9 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand9 = GUI.containerChannelCommand9 or
		Geyser.CommandLine:new({
			name = "ChannelCommand9",
			x = -200, y = 290,
			width = 180, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand9:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand9:print(Status.feedTarget)
	
	GUI.containerChannelCommand9:setAction(
	function(command)
		Events.raiseEvent("setfeedTargetEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE COMMANDLINE10 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand10 = GUI.containerChannelCommand10 or
		Geyser.CommandLine:new({
			name = "ChannelCommand10",
			x = -200, y = 320,
			width = 180, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand10:setStyleSheet(StyleCommandLine:getCSS())
	--GUI.containerChannelCommand10:print(Status.cmdAddon)
	
	GUI.containerChannelCommand10:setAction(
	function(command)
		Events.raiseEvent("setchannelAddonCommandEvent", {save = true, input = command})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



	-- CREATE DROPDOWN1 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelDropdown1 = GUI.containerChannelDropdown1 or
		Geyser.Label:new({
			name="Dropdown1", 
			x = 10, y = 133,
			width = 190, height = 46,
			fontSize = 14,
			nestable=true, 
			message="<center>CHANNEL MODE</center>"
		},GUI.containerChannelBox)

	GUI.containerChannelDropdown1:setStyleSheet(StyleDropdown:getCSS())
	GUI.containerChannelDropdown1:setToolTip("Click to select a channelling mode",Status.tooltipTime)
 

	label1 = GUI.containerChannelDropdown1:addChild({name="label1",height=46,width=190, fontSize = 14, layoutDir="BV",  flyOut=true, message="CHANNEL ONLY"})
	label1:setStyleSheet(StyleDropdownChild:getCSS())
	label1:setClickCallback("label1Function",label1.name)
	function label1Function(name)
		closeAllLevels(GUI.containerChannelDropdown1)
		echo("Dropdown1", "<center><span style='color: white;'>CHANNEL ONLY</span></center>")
		Events.raiseEvent("setchannelModeEvent", {input = "CHANNEL ONLY"})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end

	label2 = GUI.containerChannelDropdown1:addChild({name="label2",height=46,width=190, fontSize = 14, layoutDir="BV", flyOut=true, message="POWERCAST"}) 
	label2:setStyleSheet(StyleDropdownChild:getCSS())
	label2:setClickCallback("label2Function",label2.name)
	function label2Function(name)
		closeAllLevels(GUI.containerChannelDropdown1)
		echo("Dropdown1", "<center><span style='color: white;'>POWERCAST</span></center>")
		Events.raiseEvent("setchannelModeEvent", {input = "POWERCAST"})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	
	label3 = GUI.containerChannelDropdown1:addChild({name="label3",height=46,width=190, fontSize = 14, layoutDir="BV", flyOut=true, message="PC + TEACH"})
	label3:setStyleSheet(StyleDropdownChild:getCSS())
	label3:setClickCallback("label3Function",label3.name)
	function label3Function(name)
		closeAllLevels(GUI.containerChannelDropdown1)
		echo("Dropdown1", "<center><span style='color: white;'>PC + TEACH</span></center>")
		Events.raiseEvent("setchannelModeEvent", {input = "PC + TEACH"})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end

	label4 = GUI.containerChannelDropdown1:addChild({name="label4",height=46,width=190, fontSize = 14, layoutDir="BV", flyOut=true, message="FEED AURA"})
	label4:setStyleSheet(StyleDropdownChild:getCSS())
	label4:setClickCallback("label4Function",label4.name)
	function label4Function(name)
		closeAllLevels(GUI.containerChannelDropdown1)
		echo("Dropdown1", "<center><span style='color: white;'>FEED AURA</span></center>")
		Events.raiseEvent("setchannelModeEvent", {input = "FEED AURA"})
		GUI.containerChannelButton3:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.containerChannelButton3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end



-- --END BLOCK SPOT

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
		
	GUI.containerNameBox:setStyleSheet(StyleTextDefault:getCSS())



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

	GUI.containerAgeBox:setStyleSheet(StyleTextDefault:getCSS())



	-- CREATE HUNGER BOX -> INFO -> TABWINDOW3
	-------------------------------------------------------
	GUI.containerHungerBox = GUI.containerHungerBox or
		Geyser.Label:new({
			name = "HungerBox",
			x = 0, y = 42,
			fontSize = 11,
			width = "100%",
			height = 17,
			color = "black"
		}, GUI.containerInfoBox)
		
	GUI.containerHungerBox:setStyleSheet(StyleTextDefault:getCSS())



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

	GUI.containerThirstBox:setStyleSheet(StyleTextDefault:getCSS())
	


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

	GUI.containerEncumbranceBox:setStyleSheet(StyleTextDefault:getCSS())



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

	GUI.containerMovementBox:setStyleSheet(StyleTextDefault:getCSS())
	
	

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

	GUI.containerDateBox:setStyleSheet(StyleTextDefault:getCSS())



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

	GUI.containerLanguageBox:setStyleSheet(StyleTextDefault:getCSS())



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



	-- CREATE CHAT BOX -> CHATHOLDER -> TABWINDOW4
	-----------------------------------------------------------
	GUI.containerChatBox = GUI.containerChatBox or
		Geyser.MiniConsole:new({
			name = "ChatBox",
			x = 9, y = 9,
			fontSize = Status.chatboxFontSize,
			width = -9,
			height = -9,
			color = "black"
		}, GUI.containerChatholderBox)

  

--GUI.top:load()
--GUI.right:load()
--GUI.tabwindow1:load()

end --createUIConsole



-- UPDATE FUNCTIONS -------------------------------------------------



-- update chat box
-----------------------------------------------------------
local function onChat(args)
	local text = args["message"]
	local timestamp = getTime(true, "hh:mm:ss")
	echo("ChatBox", timestamp.." ")
	-- even though we get the text passed into the event we will get the text
	-- from buffer to preserve colors/formatting
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end



-- update who box
-----------------------------------------------------------
local function onWho(args)
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	deleteLine()
end

local function onStartWho(args)
	clearWindow("WhoBox")
	selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
	Events.addListener("whoEvent", sourceName, onWho)
	deleteLine()
end

local function onWhoEnd(args)
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
	local count = 0
	local output = ''

	if args["text"] ~= nil then
		output = timestamp.." "..args["text"]
	else
	
		local skillVar = Skills.getSkill({who = who, skill_name = skill_name})

		if skillVar ~= -1 then
			count = tonumber(skillVar.count)
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
	
	echo("ImproveBox", " "..output.."\n")
	
	if skill_name == "spell casting" then
		cecho("ChannelTextBox1", Info.showSpellCasting())
		cecho("ChannelTextBox3", "<yellow>POWERCAST TOTAL: "..Status.powercastTotal.." ("..Status.powercastSuccess..")")
		cecho("ChannelTextBox4", Info.showPowercastPercentage())
	end
	
end

local function onSkillMistake(args)
	selectCurrentLine("ImproveBox")
	deleteLine("ImproveBox")
	echo("ImproveBox", "")
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
	local full = args["full"]
	local concBoxTextColor = "white"
	local concBoxBGColor = "black"
	conc = args["conc"]


	if (Status.statusConc == "off") or (string.match(full, "^".."Concentration")) then
		deleteLine()
		moveCursorEnd()
	elseif (Status.statusConc == "on") and (conc ~= "You're bright-eyed and bushy-tailed.") then
		deleteLine()
		moveCursorEnd()
	end

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

  Events.addListener("chatEvent", sourceName, onChat)
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
  Events.removeListener("chatEvent", sourceName)
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
