refreshbox = {}



function createRefreshBox()


    local x1    = -351
    local x2    = -276
    local x3    = -60
    local x4    = -127
    local x5    = 85
    local x6    = -165
    local x7    = -138
    local x8    = -250

    local y1    = 166
    local y2    = 145
    local y3    = 24
    local y4    = 54
    local y5    = 203
    local y6    = 233
    local y7    = 263
    local y8    = 293
    local y9    = 323
    local y10   = 173


    local tooltip_refresh1  = "Turn automatic refresh on/off"
    local tooltip_refresh2  = "Target to auto refresh"
    local tooltip_refresh3  = "Power to use for auto refresh 1"
    local tooltip_refresh4  = "Power to use for auto refresh 2"
    local tooltip_refresh5  = "Second target to auto refresh\nLEAVE BLANK IF NOT NEEDED"
    local tooltip_refresh6  = "Refresh on Request - Automatically refresh someone who nudges you"
    local tooltip_refresh7  = "Turn refresh on request system (nudge) on/off"
    local tooltip_refresh8  = "Target to refresh on nudge"
    local tooltip_refresh9  = "Save the current refresh settings"
    local tooltip_refresh10 = "Activate refresh on nudge system"
    local tooltip_refresh11 = "Refresh anyone who nudges you. This overrides the nudge list"
    local tooltip_refresh12 = "Power to use for nudge refresh"



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

--echo("RefreshBox", Info.showInProgress())





-------------------------------------------------------------------------------
-- COMMAND LINES
-------------------------------------------------------------------------------




	-- CREATE COMMANDLINE1 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.commandlineRefresh1 = GUI.commandlineRefresh1 or
		Geyser.CommandLine:new({
			name = "commandlineRefresh1",
			x = x2, y = y3,
			width = 150, height = 28,
	}, GUI.containerRefreshBox)

	GUI.commandlineRefresh1:setStyleSheet(StyleCommandLine:getCSS())

	GUI.commandlineRefresh1:setAction(
		function(command)
			Events.raiseEvent("setRefreshTargetEvent", {save = true, input = command, version = 1})
		end
	)



	-- CREATE COMMANDLINE2 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.commandlineRefresh2 = GUI.commandlineRefresh2 or
		Geyser.CommandLine:new({
			name = "commandlineRefresh2",
			x = x3, y = y3,
			width = 45, height = 28,
	}, GUI.containerRefreshBox)

	GUI.commandlineRefresh2:setStyleSheet(StyleCommandLine:getCSS())

	GUI.commandlineRefresh2:setAction(
		function(command)
			Events.raiseEvent("setRefreshPowerEvent", {save = true, input = command, version = 1})
		end
	)



	-- CREATE COMMANDLINE3 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.commandlineRefresh3 = GUI.commandlineRefresh3 or
		Geyser.CommandLine:new({
			name = "commandlineRefresh3",
			x = x2, y = y4,
			width = 150, height = 28,
	}, GUI.containerRefreshBox)

	GUI.commandlineRefresh3:setStyleSheet(StyleCommandLine:getCSS())

	GUI.commandlineRefresh3:setAction(
		function(command)
			Events.raiseEvent("setRefreshTargetEvent", {save = true, input = command, version = 2})
		end
	)



	-- CREATE COMMANDLINE4 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.commandlineRefresh4 = GUI.commandlineRefresh4 or
		Geyser.CommandLine:new({
			name = "commandlineRefresh4",
			x = x3, y = y4,
			width = 45, height = 28,
	}, GUI.containerRefreshBox)

	GUI.commandlineRefresh4:setStyleSheet(StyleCommandLine:getCSS())

	GUI.commandlineRefresh4:setAction(
		function(command)
			Events.raiseEvent("setRefreshPowerEvent", {save = true, input = command, version = 2})
		end
	)















    -- CREATE COMMANDLINE5 -> REFRESH -> TABWINDOW2 (nudge target 1)
	-------------------------------------------------------
	GUI.commandlineRefresh5 = GUI.commandlineRefresh5 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh5",
        x = x5, y = y5,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh5:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh5:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 1})
        end
    )



    -- CREATE COMMANDLINE6 -> REFRESH -> TABWINDOW2 (nudge target 2)
	-------------------------------------------------------
	GUI.commandlineRefresh6 = GUI.commandlineRefresh6 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh6",
        x = x5, y = y6,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh6:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh6:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 2})
        end
    )



    -- CREATE COMMANDLINE7 -> REFRESH -> TABWINDOW2 (nudge target 3)
	-------------------------------------------------------
	GUI.commandlineRefresh7 = GUI.commandlineRefresh7 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh7",
        x = x5, y = y7,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh7:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh7:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 3})
        end
    )



    -- CREATE COMMANDLINE8 -> REFRESH -> TABWINDOW2 (nudge target 4)
	-------------------------------------------------------
	GUI.commandlineRefresh8 = GUI.commandlineRefresh8 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh8",
        x = x5, y = y8,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh8:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh8:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 4})
        end
    )



    -- CREATE COMMANDLINE9 -> REFRESH -> TABWINDOW2 (nudge target 5)
	-------------------------------------------------------
	GUI.commandlineRefresh9 = GUI.commandlineRefresh9 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh9",
        x = x5, y = y9,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh9:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh9:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 5})
        end
    )



    -- CREATE COMMANDLINE10 -> REFRESH -> TABWINDOW2 (nudge target 6)
	-------------------------------------------------------
	GUI.commandlineRefresh10 = GUI.commandlineRefresh10 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh10",
        x = x6, y = y5,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh10:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh10:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 6})
        end
    )



    -- CREATE COMMANDLINE11 -> REFRESH -> TABWINDOW2 (nudge target 7)
	-------------------------------------------------------
	GUI.commandlineRefresh11 = GUI.commandlineRefresh11 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh11",
        x = x6, y = y6,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh11:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh11:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 7})
        end
    )



    -- CREATE COMMANDLINE12 -> REFRESH -> TABWINDOW2 (nudge target 8)
	-------------------------------------------------------
	GUI.commandlineRefresh12 = GUI.commandlineRefresh12 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh12",
        x = x6, y = y7,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh12:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh12:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 8})
        end
    )



    -- CREATE COMMANDLINE13 -> REFRESH -> TABWINDOW2 (nudge target 9)
	-------------------------------------------------------
	GUI.commandlineRefresh13 = GUI.commandlineRefresh13 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh13",
        x = x6, y = y8,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh13:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh13:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 9})
        end
    )



    -- CREATE COMMANDLINE14 -> REFRESH -> TABWINDOW2 (nudge target 10)
	-------------------------------------------------------
	GUI.commandlineRefresh14 = GUI.commandlineRefresh14 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh14",
        x = x6, y = y9,
        width = 150, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh14:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh14:setAction(
        function(command)
            Events.raiseEvent("setRefreshNudgeEvent", {save = true, input = command, version = 10})
        end
    )



    -- CREATE COMMANDLINE15 -> REFRESH -> TABWINDOW2 (nudge power)
	-------------------------------------------------------
	GUI.commandlineRefresh15 = GUI.commandlineRefresh15 or
    Geyser.CommandLine:new({
        name = "commandlineRefresh15",
        x = x3, y = y10,
        width = 45, height = 28,
    }, GUI.containerRefreshBox)

    GUI.commandlineRefresh15:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRefresh15:setAction(
        function(command)
            Events.raiseEvent("setRefreshPowerEvent", {save = true, input = command, version = 3})
        end
    )







-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------








    -- CREATE TEXTBOX1 -> REFRESH -> TABWINDOW2 (horizontal line)
	-------------------------------------------------------
	GUI.textboxRefresh1 = GUI.textboxRefresh1 or
    Geyser.Label:new({
        name = "textboxRefresh1",
        x = 1, y = y1,
        fontSize = 13,
        width = "100%",
        height = 1,
        color = "white"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh1:setStyleSheet(StyleHorizontalLine:getCSS())



	-- CREATE TEXTBOX2 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRefresh2 = GUI.textboxRefresh2 or
		Geyser.Label:new({
			name = "textboxRefresh2",
			x = x1, y = y3+6,
			fontSize = 11,
			width = 80,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.textboxRefresh2:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxRefresh2", "<yellow>AUTO 1")
	GUI.textboxRefresh2:setToolTip(tooltip_refresh2,Status.tooltipTime)



	-- CREATE TEXTBOX3 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRefresh3 = GUI.textboxRefresh3 or
		Geyser.Label:new({
			name = "textboxRefresh3",
			x = x4, y = y3+6,
			fontSize = 11,
			width = 74,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.textboxRefresh3:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxRefresh3", "<yellow>POWER")
	GUI.textboxRefresh3:setToolTip(tooltip_refresh3,Status.tooltipTime)



	-- CREATE TEXTBOX4 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRefresh4 = GUI.textboxRefresh4 or
		Geyser.Label:new({
			name = "textboxRefresh4",
			x = x4, y = y4+6,
			fontSize = 11,
			width = 74,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.textboxRefresh4:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxRefresh4", "<yellow>POWER")
	GUI.textboxRefresh4:setToolTip(tooltip_refresh4,Status.tooltipTime)



	-- CREATE TEXTBOX5 -> REFRESH -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRefresh5 = GUI.textboxRefresh5 or
		Geyser.Label:new({
			name = "textboxRefresh5",
			x = x1, y = y4+6,
			fontSize = 11,
			width = 80,
			height = 17,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.textboxRefresh5:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxRefresh5", "<yellow>AUTO 2")
	GUI.textboxRefresh5:setToolTip(tooltip_refresh5,Status.tooltipTime)



    -- CREATE TEXTBOX6 -> REFRESH -> TABWINDOW2 (nudge section header)
	-------------------------------------------------------
	GUI.textboxRefresh6 = GUI.textboxRefresh6 or
    Geyser.Label:new({
        name = "textboxRefresh6",
        x = 0, y = y2,
        fontSize = 11,
        width = 190,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh6:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh6:echo("REFRESH ON NUDGE","yellow","l")
    GUI.textboxRefresh6:setToolTip(tooltip_refresh6,Status.tooltipTime)



    -- CREATE TEXTBOX7 -> REFRESH -> TABWINDOW2 (nudge on/off)
	-------------------------------------------------------
	GUI.textboxRefresh7 = GUI.textboxRefresh7 or
    Geyser.Label:new({
        name = "textboxRefresh7",
        x = x7, y = y2,
        fontSize = 11,
        width = 135,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh7:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh7:echo("NUDGE ON/OFF","yellow","l")
    GUI.textboxRefresh7:setToolTip(tooltip_refresh7,Status.tooltipTime)
















    -- CREATE TEXTBOX8 -> REFRESH -> TABWINDOW2 (nudge 1)
	-------------------------------------------------------
	GUI.textboxRefresh8 = GUI.textboxRefresh8 or
    Geyser.Label:new({
        name = "textboxRefresh8",
        x = 0, y = y5+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh8:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh8:echo("NUDGE 1","yellow","l")
    GUI.textboxRefresh8:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX9 -> REFRESH -> TABWINDOW2 (nudge 2)
	-------------------------------------------------------
	GUI.textboxRefresh9 = GUI.textboxRefresh9 or
    Geyser.Label:new({
        name = "textboxRefresh9",
        x = 0, y = y6+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh9:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh9:echo("NUDGE 2","yellow","l")
    GUI.textboxRefresh9:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX10 -> REFRESH -> TABWINDOW2 (nudge 3)
	-------------------------------------------------------
	GUI.textboxRefresh10 = GUI.textboxRefresh10 or
    Geyser.Label:new({
        name = "textboxRefresh10",
        x = 0, y = y7+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh10:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh10:echo("NUDGE 3","yellow","l")
    GUI.textboxRefresh10:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX11 -> REFRESH -> TABWINDOW2 (nudge 4)
	-------------------------------------------------------
	GUI.textboxRefresh11 = GUI.textboxRefresh11 or
    Geyser.Label:new({
        name = "textboxRefresh11",
        x = 0, y = y8+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh11:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh11:echo("NUDGE 4","yellow","l")
    GUI.textboxRefresh11:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX12 -> REFRESH -> TABWINDOW2 (nudge 5)
	-------------------------------------------------------
	GUI.textboxRefresh12 = GUI.textboxRefresh12 or
    Geyser.Label:new({
        name = "textboxRefresh12",
        x = 0, y = y9+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh12:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh12:echo("NUDGE 5","yellow","l")
    GUI.textboxRefresh12:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX13 -> REFRESH -> TABWINDOW2 (nudge 6)
	-------------------------------------------------------
	GUI.textboxRefresh13 = GUI.textboxRefresh13 or
    Geyser.Label:new({
        name = "textboxRefresh13",
        x = x8, y = y5+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh13:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh13:echo("NUDGE 6","yellow","l")
    GUI.textboxRefresh13:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX14 -> REFRESH -> TABWINDOW2 (nudge 7)
	-------------------------------------------------------
	GUI.textboxRefresh14 = GUI.textboxRefresh14 or
    Geyser.Label:new({
        name = "textboxRefresh14",
        x = x8, y = y6+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh14:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh14:echo("NUDGE 7","yellow","l")
    GUI.textboxRefresh14:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX15 -> REFRESH -> TABWINDOW2 (nudge 8)
	-------------------------------------------------------
	GUI.textboxRefresh15 = GUI.textboxRefresh15 or
    Geyser.Label:new({
        name = "textboxRefresh15",
        x = x8, y = y7+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh15:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh15:echo("NUDGE 8","yellow","l")
    GUI.textboxRefresh15:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX16 -> REFRESH -> TABWINDOW2 (nudge 9)
	-------------------------------------------------------
	GUI.textboxRefresh16 = GUI.textboxRefresh16 or
    Geyser.Label:new({
        name = "textboxRefresh16",
        x = x8, y = y8+6,
        fontSize = 11,
        width = 90,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh16:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh16:echo("NUDGE 9","yellow","l")
    GUI.textboxRefresh16:setToolTip(tooltip_refresh8,Status.tooltipTime)



    -- CREATE TEXTBOX17 -> REFRESH -> TABWINDOW2 (nudge 10)
	-------------------------------------------------------
	GUI.textboxRefresh17 = GUI.textboxRefresh17 or
    Geyser.Label:new({
        name = "textboxRefresh17",
        x = x8-9, y = y9+6,
        fontSize = 11,
        width = 100,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh17:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh17:echo("NUDGE 10","yellow","l")
    GUI.textboxRefresh17:setToolTip(tooltip_refresh8,Status.tooltipTime)














    -- CREATE TEXTBOX18 -> REFRESH -> TABWINDOW2 (nudge all text)
	-------------------------------------------------------
	GUI.textboxRefresh18 = GUI.textboxRefresh18 or
    Geyser.Label:new({
        name = "textboxRefresh18",
        x = 105, y = y10+6,
        fontSize = 11,
        width = 110,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh18:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh18:echo("ALLOW ALL","yellow","r")
    GUI.textboxRefresh18:setToolTip(tooltip_refresh11,Status.tooltipTime)



    -- CREATE TEXTBOX19 -> REFRESH -> TABWINDOW2 (nudge power text)
	-------------------------------------------------------
	GUI.textboxRefresh19 = GUI.textboxRefresh19 or
    Geyser.Label:new({
        name = "textboxRefresh19",
        x = x3-127, y = y10+6,
        fontSize = 11,
        width = 130,
        height = 17,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.textboxRefresh19:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxRefresh19:echo("NUDGE POWER","yellow","r")
    GUI.textboxRefresh19:setToolTip(tooltip_refresh12,Status.tooltipTime)







-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------







	-- CREATE REFRESH BUTTON1 -> REFRESH -> TABWINDOW2 (refresh on/off)
	-----------------------------------------------------------
	GUI.buttonRefresh1 = GUI.buttonRefresh1 or
		Geyser.Label:new({
			name = "buttonRefresh1",
			x = 10, y = 10,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerRefreshBox)

	GUI.buttonRefresh1:setStyleSheet(StyleButtonDarkGrey:getCSS())
	echo("buttonRefresh1", "<center>AUTOFRESH OFF</center>")
	GUI.buttonRefresh1:setToolTip(tooltip_refresh1,Status.tooltipTime)
	GUI.buttonRefresh1:setClickCallback("ButtonRefresh1_click")



	function ButtonRefresh1_click()
		if not Status.statusRefresh then
			Status.statusRefresh = true
			GUI.buttonRefresh1:setStyleSheet(StyleButtonPaleGreen:getCSS())

            GUI.tabwindow1:setTabHighlight("REFRESH","REFRESH",true)
            GUI.tabwindow2:setTabHighlight("REFRESH","REFRESH",true)
            GUI.tabwindow3:setTabHighlight("REFRESH","REFRESH",true)
            GUI.tabwindow4:setTabHighlight("REFRESH","REFRESH",true)

			echo("buttonRefresh1", "<center>AUTOFRESH ON</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Autofresh: On\n"})
            systemMessage("Autofresh On")
			send("conc", false)
		else
			Status.statusRefresh = false
			GUI.buttonRefresh1:setStyleSheet(StyleButtonDarkGrey:getCSS())

            GUI.tabwindow1:setTabHighlight("REFRESH","REFRESH",false)
            GUI.tabwindow2:setTabHighlight("REFRESH","REFRESH",false)
            GUI.tabwindow3:setTabHighlight("REFRESH","REFRESH",false)
            GUI.tabwindow4:setTabHighlight("REFRESH","REFRESH",false)

			echo("buttonRefresh1", "<center>AUTOFRESH OFF</center>")
			Events.raiseEvent("messageEvent", {message="<yellow>Autofresh: Off\n"})
            systemMessage("Autofresh Off")
		end
	end



    -- CREATE REFRESH BUTTON2 -> REFRESH -> TABWINDOW2 (save settings)
	-----------------------------------------------------------
	GUI.buttonRefresh2 = GUI.buttonRefresh2 or
    Geyser.Label:new({
        name = "buttonRefresh2",
        x = 10, y = 51,
        fontSize = 14,
        width = 190,
        height = 46,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.buttonRefresh2:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonRefresh2", "<center>SAVE SETTINGS</center>")
    GUI.buttonRefresh2:setToolTip(tooltip_refresh9,Status.tooltipTime)
    GUI.buttonRefresh2:setClickCallback("ButtonRefresh2_click")

    function ButtonRefresh2_click()
		GUI.buttonRefresh2:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonRefresh2:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		Events.raiseEvent("saveRefreshSettingsEvent", {input = ""})
	end



    -- CREATE REFRESH BUTTON3 -> LANGUAGE -> TABWINDOW2  (nudge active flag)
	-----------------------------------------------------------
	GUI.buttonRefresh3 = GUI.buttonRefresh3 or
    Geyser.Label:new({
        name = "buttonRefresh3",
        x = x7-13, y = y2-4,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.buttonRefresh3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonRefresh3:setToolTip(tooltip_refresh10,Status.tooltipTime)
    GUI.buttonRefresh3:setClickCallback("buttonRefresh3_click")

    function buttonRefresh3_click()
        Events.raiseEvent("setRefreshNudgeActiveEvent")
    end



    -- CREATE REFRESH BUTTON4 -> LANGUAGE -> TABWINDOW2  (nudge all flag)
	-----------------------------------------------------------
	GUI.buttonRefresh4 = GUI.buttonRefresh4 or
    Geyser.Label:new({
        name = "buttonRefresh4",
        x = 212, y = y10+3,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerRefreshBox)

    GUI.buttonRefresh4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonRefresh4:setToolTip(tooltip_refresh11,Status.tooltipTime)
    GUI.buttonRefresh4:setClickCallback("buttonRefresh4_click")

    function buttonRefresh4_click()
        Events.raiseEvent("setRefreshNudgeAllEvent")
    end



end

return refreshbox
