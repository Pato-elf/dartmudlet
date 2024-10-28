repeatbox = {}



function createRepeatBox()


    local x1    = 100
    local x2    = 35
    local x3    = -65


    local y1    = 80
    local y2    = 120
    local y3    = 150
    local y4    = 180
    local y5    = 210
    local y6    = 240
    local y7    = 270
    local y8    = 300
    local y9    = 330

    local width1    = 400



-- CREATE REPEAT BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerRepeatBox = GUI.containerRepeatBox or
Geyser.Label:new({
    name = "RepeatBox",
    x = 0, y = 0,
    fontSize = 10,
    width = "100%",
    height = "100%",
    color = "black"
}, GUI.tabwindow2.REPEATcenter)

GUI.containerRepeatBox:setStyleSheet(StyleBoxBlue:getCSS())

--echo("RepeatBox", Info.showUnderConstruction())



-------------------------------------------------------------------------------
-- COMMAND LINES
-------------------------------------------------------------------------------



	-- CREATE COMMANDLINE1 -> REPEAT -> TABWINDOW2  (repeatName)
	-------------------------------------------------------
	GUI.commandlineRepeat1 = GUI.commandlineRepeat1 or
		Geyser.CommandLine:new({
			name = "commandlineRepeat1",
			x = x1, y = y1,
			width = 205, height = 28,
	}, GUI.containerRepeatBox)

	GUI.commandlineRepeat1:setStyleSheet(StyleCommandLine:getCSS())

	GUI.commandlineRepeat1:setAction(
	function(command)
		Events.raiseEvent("setRepeatNameEvent", {save = true, input = command})
		GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
	end
	)



    -- CREATE COMMANDLINE2 -> REPEAT -> TABWINDOW2  (repeatCommand1)
	-------------------------------------------------------
	GUI.commandlineRepeat2 = GUI.commandlineRepeat2 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat2",
        x = x2, y = y2,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat2:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat2:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 1, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE3 -> REPEAT -> TABWINDOW2  (repeatCommand2)
	-------------------------------------------------------
	GUI.commandlineRepeat3 = GUI.commandlineRepeat3 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat3",
        x = x2, y = y3,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat3:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat3:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 2, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE4 -> REPEAT -> TABWINDOW2  (repeatCommand3)
	-------------------------------------------------------
	GUI.commandlineRepeat4 = GUI.commandlineRepeat4 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat4",
        x = x2, y = y4,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat4:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat4:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 3, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE5 -> REPEAT -> TABWINDOW2  (repeatCommand4)
	-------------------------------------------------------
	GUI.commandlineRepeat5 = GUI.commandlineRepeat5 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat5",
        x = x2, y = y5,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat5:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat5:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 4, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE6 -> REPEAT -> TABWINDOW2  (repeatCommand5)
	-------------------------------------------------------
	GUI.commandlineRepeat6 = GUI.commandlineRepeat6 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat6",
        x = x2, y = y6,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat6:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat6:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 5, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE7 -> REPEAT -> TABWINDOW2  (repeatCommand6)
	-------------------------------------------------------
	GUI.commandlineRepeat7 = GUI.commandlineRepeat7 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat7",
        x = x2, y = y7,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat7:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat7:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 6, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE8 -> REPEAT -> TABWINDOW2  (repeatCommand7)
	-------------------------------------------------------
	GUI.commandlineRepeat8 = GUI.commandlineRepeat8 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat8",
        x = x2, y = y8,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat8:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat8:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 7, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE9 -> REPEAT -> TABWINDOW2  (repeatCommand8)
	-------------------------------------------------------
	GUI.commandlineRepeat9 = GUI.commandlineRepeat9 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat9",
        x = x2, y = y9,
        width = width1, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat9:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat9:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandEvent", {number = 8, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )













    -- CREATE COMMANDLINE10 -> REPEAT -> TABWINDOW2  (repeatCommandAmount1)
	-------------------------------------------------------
	GUI.commandlineRepeat10 = GUI.commandlineRepeat10 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat10",
        x = x3, y = y2,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat10:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat10:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 1, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE11 -> REPEAT -> TABWINDOW2  (repeatCommandAmount2)
	-------------------------------------------------------
	GUI.commandlineRepeat11 = GUI.commandlineRepeat11 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat11",
        x = x3, y = y3,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat11:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat11:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 2, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE12 -> REPEAT -> TABWINDOW2  (repeatCommandAmount3)
	-------------------------------------------------------
	GUI.commandlineRepeat12 = GUI.commandlineRepeat12 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat12",
        x = x3, y = y4,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat12:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat12:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 3, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE13 -> REPEAT -> TABWINDOW2  (repeatCommandAmount4)
	-------------------------------------------------------
	GUI.commandlineRepeat13 = GUI.commandlineRepeat13 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat13",
        x = x3, y = y5,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat13:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat13:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 4, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE14 -> REPEAT -> TABWINDOW2  (repeatCommandAmount5)
	-------------------------------------------------------
	GUI.commandlineRepeat14 = GUI.commandlineRepeat14 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat14",
        x = x3, y = y6,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat14:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat14:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 5, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE15 -> REPEAT -> TABWINDOW2  (repeatCommandAmount6)
	-------------------------------------------------------
	GUI.commandlineRepeat15 = GUI.commandlineRepeat15 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat15",
        x = x3, y = y7,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat15:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat15:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 6, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE16 -> REPEAT -> TABWINDOW2  (repeatCommandAmount7)
	-------------------------------------------------------
	GUI.commandlineRepeat16 = GUI.commandlineRepeat16 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat16",
        x = x3, y = y8,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat16:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat16:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 7, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



    -- CREATE COMMANDLINE17 -> REPEAT -> TABWINDOW2  (repeatCommandAmount8)
	-------------------------------------------------------
	GUI.commandlineRepeat17 = GUI.commandlineRepeat17 or
    Geyser.CommandLine:new({
        name = "commandlineRepeat17",
        x = x3, y = y9,
        width = 35, height = 28,
    }, GUI.containerRepeatBox)

    GUI.commandlineRepeat17:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineRepeat17:setAction(
    function(command)
        Events.raiseEvent("setRepeatCommandAmountEvent", {number = 8, save = true, input = command})
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    end
    )



-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------



	-- CREATE BUTTON1 -> REPEAT -> TABWINDOW2  (forward button)
	-----------------------------------------------------------
	GUI.buttonRepeat1 = GUI.buttonRepeat1 or
		Geyser.Label:new({
			name = "buttonRepeat1",
			x = 149, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerRepeatBox)

	GUI.buttonRepeat1:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonRepeat1", "<center><span style='font-size: 24pt;'>&#9654;</span></center>")
	GUI.buttonRepeat1:setToolTip("Go to next repeat set",Status.tooltipTime)
	GUI.buttonRepeat1:setClickCallback("buttonRepeat1_click")

	function buttonRepeat1_click()
		GUI.buttonRepeat1:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonRepeat1:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("setRepeatCurrentNumberEvent", "up")
--		Allocs.setAllocsCurrentNumber("up")
	end



	-- CREATE BUTTON2 -> REPEAT -> TABWINDOW2  (back button)
	-----------------------------------------------------------
	GUI.buttonRepeat2 = GUI.buttonRepeat2 or
		Geyser.Label:new({
			name = "buttonRepeat2",
			x = 95, y = 10,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerRepeatBox)

	GUI.buttonRepeat2:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonRepeat2", "<center><span style='font-size: 24pt;'>&#9664;</span></center>")
	GUI.buttonRepeat2:setToolTip("Go to previous repeat set",Status.tooltipTime)
	GUI.buttonRepeat2:setClickCallback("buttonRepeat2_click")

	function buttonRepeat2_click()
		GUI.buttonRepeat2:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonRepeat2:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("setRepeatCurrentNumberEvent", "down")
--		Allocs.setAllocsCurrentNumber("down")
	end



    -- CREATE BUTTON3 -> REPEAT -> TABWINDOW2  (run button)
	-----------------------------------------------------------
	GUI.buttonRepeat3 = GUI.buttonRepeat3 or
    Geyser.Label:new({
        name = "buttonRepeat3",
        x = -235, y = 10,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.buttonRepeat3:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonRepeat3", "<center><span style='font-size: 20pt;'>&#x1F504;</span></center>")
    GUI.buttonRepeat3:setToolTip("Automatically run repeat set on full concentration",Status.tooltipTime)
    GUI.buttonRepeat3:setClickCallback("buttonRepeat3_click")

    function buttonRepeat3_click()
        GUI.buttonRepeat3:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
    --		Allocs.setAllocsCurrentNumber("down")
    end



    -- CREATE BUTTON4 -> REPEAT -> TABWINDOW2  (run once button)
	-----------------------------------------------------------
	GUI.buttonRepeat4 = GUI.buttonRepeat4 or
    Geyser.Label:new({
        name = "buttonRepeat4",
        x = -180, y = 10,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.buttonRepeat4:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonRepeat4", "<center><span style='font-size: 20pt;'>&#128258;</span></center>")
    GUI.buttonRepeat4:setToolTip("Run repeat set one time",Status.tooltipTime)
    GUI.buttonRepeat4:setClickCallback("buttonRepeat4_click")

    function buttonRepeat4_click()
        GUI.buttonRepeat4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveRepeatSettingsEvent", {type = "run"})
    end



    -- CREATE BUTTON5 -> REPEAT -> TABWINDOW2  (save button)
	-----------------------------------------------------------
	GUI.buttonRepeat5 = GUI.buttonRepeat5 or
    Geyser.Label:new({
        name = "buttonRepeat5",
        x = -125, y = 10,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonRepeat5", "<center><span style='font-size: 22pt;'>&#128190;</span></center>")
    GUI.buttonRepeat5:setToolTip("Save this repeat set",Status.tooltipTime)
    GUI.buttonRepeat5:setClickCallback("buttonRepeat5_click")

    function buttonRepeat5_click()
        GUI.buttonRepeat5:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat5:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("saveRepeatSettingsEvent", {type = ""})
    end



    -- CREATE BUTTON6 -> REPEAT -> TABWINDOW2  (sort button)
	-----------------------------------------------------------
	GUI.buttonRepeat6 = GUI.buttonRepeat6 or
    Geyser.Label:new({
        name = "buttonRepeat6",
        x = -70, y = 10,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.buttonRepeat6:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonRepeat6", "<center><span style='font-size: 22pt;'>&#128288;</span></center>")
    GUI.buttonRepeat6:setToolTip("Sort sets alphabetically by set name",Status.tooltipTime)
    GUI.buttonRepeat6:setClickCallback("buttonRepeat6_click")

    function buttonRepeat6_click()
        GUI.buttonRepeat6:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonRepeat6:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("setRepeatOrderEvent", {type = "set"})
    end



-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------



	-- CREATE TEXTBOX1 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat1 = GUI.textboxRepeat1 or
		Geyser.Label:new({
			name = "textboxRepeat1",
			x = x1-95, y = y1+6,
			fontSize = 11,
			width = 97,
			height = 17,
			color = "black"
		}, GUI.containerRepeatBox)

	GUI.textboxRepeat1:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxRepeat1", "<yellow>SET NAME")
	GUI.textboxRepeat1:setToolTip("The name for this repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX2 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat2 = GUI.textboxRepeat2 or
        Geyser.Label:new({
            name = "textboxRepeat2",
            x = x2-32, y = y2+6,
            fontSize = 11,
            width = 35,
            height = 17,
            color = "black"
        }, GUI.containerRepeatBox)

    GUI.textboxRepeat2:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat2", "<yellow>1")
    GUI.textboxRepeat2:setToolTip("Command #1 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX3 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat3 = GUI.textboxRepeat3 or
    Geyser.Label:new({
        name = "textboxRepeat3",
        x = x2-32, y = y3+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat3:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat3", "<yellow>2")
    GUI.textboxRepeat3:setToolTip("Command #2 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX4 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat4 = GUI.textboxRepeat4 or
    Geyser.Label:new({
        name = "textboxRepeat4",
        x = x2-32, y = y4+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat4:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat4", "<yellow>3")
    GUI.textboxRepeat4:setToolTip("Command #3 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX5 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat5 = GUI.textboxRepeat5 or
    Geyser.Label:new({
        name = "textboxRepeat5",
        x = x2-32, y = y5+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat5:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat5", "<yellow>4")
    GUI.textboxRepeat5:setToolTip("Command #4 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX6 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat6 = GUI.textboxRepeat6 or
    Geyser.Label:new({
        name = "textboxRepeat6",
        x = x2-32, y = y6+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat6:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat6", "<yellow>5")
    GUI.textboxRepeat6:setToolTip("Command #5 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX7 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat7 = GUI.textboxRepeat7 or
    Geyser.Label:new({
        name = "textboxRepeat7",
        x = x2-32, y = y7+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat7:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat7", "<yellow>6")
    GUI.textboxRepeat7:setToolTip("Command #6 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX8 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat8 = GUI.textboxRepeat8 or
    Geyser.Label:new({
        name = "textboxRepeat8",
        x = x2-32, y = y8+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat8:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat8", "<yellow>7")
    GUI.textboxRepeat8:setToolTip("Command #7 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX9 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat9 = GUI.textboxRepeat9 or
    Geyser.Label:new({
        name = "textboxRepeat9",
        x = x2-32, y = y9+6,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat9:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat9", "<yellow>8")
    GUI.textboxRepeat9:setToolTip("Command #8 in repeat set",Status.tooltipTime)



    -- CREATE TEXTBOX10 -> REPEAT -> TABWINDOW2  (CURRENT SET NUMBER)
	-------------------------------------------------------
	GUI.textboxRepeat10 = GUI.textboxRepeat10 or
    Geyser.Label:new({
        name = "textboxRepeat10",
        x = 15, y = 18,
        fontSize = 11,
        width = 80,
        height = 40,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat10:setStyleSheet(StyleTextBlue:getCSS())
    GUI.textboxRepeat10:setToolTip("Repeat set number",Status.tooltipTime)













    -- CREATE TEXTBOX11 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat11 = GUI.textboxRepeat11 or
    Geyser.Label:new({
        name = "textboxRepeat11",
        x = -40, y = y2+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat11:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat11", "<yellow>X")
    GUI.textboxRepeat11:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX12 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat12 = GUI.textboxRepeat12 or
    Geyser.Label:new({
        name = "textboxRepeat12",
        x = -40, y = y3+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat12:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat12", "<yellow>X")
    GUI.textboxRepeat12:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX13 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat13 = GUI.textboxRepeat13 or
    Geyser.Label:new({
        name = "textboxRepeat13",
        x = -40, y = y4+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat13:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat13", "<yellow>X")
    GUI.textboxRepeat13:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX14 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat14 = GUI.textboxRepeat14 or
    Geyser.Label:new({
        name = "textboxRepeat14",
        x = -40, y = y5+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat14:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat14", "<yellow>X")
    GUI.textboxRepeat14:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX15 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat15 = GUI.textboxRepeat15 or
    Geyser.Label:new({
        name = "textboxRepeat15",
        x = -40, y = y6+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat15:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat15", "<yellow>X")
    GUI.textboxRepeat15:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX16 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat16 = GUI.textboxRepeat16 or
    Geyser.Label:new({
        name = "textboxRepeat16",
        x = -40, y = y7+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat16:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat16", "<yellow>X")
    GUI.textboxRepeat16:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX17 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat17 = GUI.textboxRepeat17 or
    Geyser.Label:new({
        name = "textboxRepeat17",
        x = -40, y = y8+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat17:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat17", "<yellow>X")
    GUI.textboxRepeat17:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)



    -- CREATE TEXTBOX18 -> REPEAT -> TABWINDOW2
	-------------------------------------------------------
	GUI.textboxRepeat18 = GUI.textboxRepeat18 or
    Geyser.Label:new({
        name = "textboxRepeat18",
        x = -40, y = y9+8,
        fontSize = 11,
        width = 35,
        height = 17,
        color = "black"
    }, GUI.containerRepeatBox)

    GUI.textboxRepeat18:setStyleSheet(StyleTextBlue:getCSS())
    cecho("textboxRepeat18", "<yellow>X")
    GUI.textboxRepeat18:setToolTip("Number of times to repeat command (0-99)",Status.tooltipTime)


    
end

return repeatbox