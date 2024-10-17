refreshbox = {}

function createRefreshBox()

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
	
	GUI.containerRefreshCommand1:setAction(
		function(command)
			Events.raiseEvent("setrefreshTargetEvent", {save = true, input = command, version = 1})
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
	
	GUI.containerRefreshCommand2:setAction(
		function(command)
			Events.raiseEvent("setrefreshPowerEvent", {save = true, input = command, version = 1})
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
	
	GUI.containerRefreshCommand3:setAction(
		function(command)
			Events.raiseEvent("setrefreshTargetEvent", {save = true, input = command, version = 2})
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
	
	GUI.containerRefreshCommand4:setAction(
		function(command)
			Events.raiseEvent("setrefreshPowerEvent", {save = true, input = command, version = 2})
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
	GUI.containerRefreshTextBox4:setToolTip("Second target to auto refresh\nLEAVE BLANK IF NOT NEEDED",Status.tooltipTime)

end

return refreshbox
