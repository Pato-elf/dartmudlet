channelbox = {}

function createChannelBox()

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
			width = 260,
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
			width = 260,
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
			width = 260,
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



	-- CREATE TEXTBOX15 -> CHANNEL -> TABWINDOW2  (focus total text)
	-------------------------------------------------------
	GUI.containerChannelTextBox15 = GUI.containerChannelTextBox15 or
		Geyser.Label:new({
			name = "ChannelTextBox15",
			x = -265, y = 145,
			fontSize = 14,
			width = 160,
			height = 20,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox15:setStyleSheet(StyleTextMagentaLarge:getCSS())
	cecho("ChannelTextBox15", "<magenta>FOCUS TOTAL:")
	GUI.containerChannelTextBox15:setToolTip("Amount of aura currently stored in your focus",Status.tooltipTime)



	-- CREATE TEXTBOX16 -> CHANNEL -> TABWINDOW2  (focus total number)
	-------------------------------------------------------
	GUI.containerChannelTextBox16 = GUI.containerChannelTextBox16 or
		Geyser.Label:new({
			name = "ChannelTextBox16",
			x = -113, y = 145,
			fontSize = 14,
			width = 100,
			height = 20,
			color = "black"
		}, GUI.containerChannelBox)

	GUI.containerChannelTextBox16:setStyleSheet(StyleTextMagentaLarge:getCSS())



	-- CREATE COMMANDLINE1 -> CHANNEL -> TABWINDOW2
	-------------------------------------------------------
	GUI.containerChannelCommand1 = GUI.containerChannelCommand1 or
		Geyser.CommandLine:new({
			name = "ChannelCommand1",
			x = 160, y = 260,
			width = 45, height = 28,
	}, GUI.containerChannelBox)

	GUI.containerChannelCommand1:setStyleSheet(StyleCommandLine:getCSS())
	
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
			message="<center>SELECT MODE</center>"
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
	
end

return channelbox
