castingbox = {}


function createCastingBox()


	local x1	= 10
    local x2    = 250
    local x3    = 305
    local x4    = 360
	local x5	= 415
	local x6    = -306
	local x7	= 80
	local x8	= -400

    local y1    = 10
	local y2	= 51
	local y3	= 92
	local y5    = 150
	local y6    = 180
	local y7    = 210
	local y8    = 240
	--local y9	= 270
	--local y10	= 300
	--local y11	= 330

	local w1	= 290
	local w2	= 45

	local tooltip_casting1	= "Jump back by 10 spells"
	local tooltip_casting2	= "Go to previous spell"
	local tooltip_casting3	= "Go to next spell"
	local tooltip_casting4	= "Jump forward by 10 spells"
	local tooltip_casting5  = "Turn autocast system on/off"
	local tooltip_casting6	= "Reset the autocast stats"
	local tooltip_casting7	= "Save the current autocast settings"
	local tooltip_casting8	= "Full name of the spell to practice"
	local tooltip_casting9	= "Arguments to use while practicing spell"
	local tooltip_casting10	= "Notes about practicing this spell"
	local tooltip_casting11	= "Send a command of your choice after each cast\nLeave blank if not needed"





-- CREATE CASTING BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerCastingBox = GUI.containerCastingBox or
Geyser.Label:new({
    name = "CastingBox",
    x = 0, y = 0,
    fontSize = 10,
    width = "100%",
    height = "100%",
    color = "black"
}, GUI.tabwindow2.CASTINGcenter)

GUI.containerCastingBox:setStyleSheet(StyleBoxBlue:getCSS())



--echo("CastingBox", Info.showUnderConstruction())









-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------










	-- CREATE TEXTBOX1 -> CASTING -> TABWINDOW2 (spell name box)
	-------------------------------------------------------
	GUI.textboxCasting1 = GUI.textboxCasting1 or
		Geyser.Label:new({
			name = "textboxCasting1",
			x = x8, y = y5+6,
			fontSize = 11,
			width = 100,
			height = 17,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.textboxCasting1:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxCasting1", "<yellow>FULL NAME")
	GUI.textboxCasting1:setToolTip(tooltip_casting8,Status.tooltipTime)



	-- CREATE TEXTBOX2 -> CASTING -> TABWINDOW2 (arguments box)
	-------------------------------------------------------
	GUI.textboxCasting2 = GUI.textboxCasting2 or
		Geyser.Label:new({
			name = "textboxCasting2",
			x = x8, y = y6+6,
			fontSize = 11,
			width = 100,
			height = 17,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.textboxCasting2:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxCasting2", "<yellow>ARGUMENTS")
	GUI.textboxCasting2:setToolTip(tooltip_casting9,Status.tooltipTime)



	-- CREATE TEXTBOX3 -> CASTING -> TABWINDOW2 (notes box)
	-------------------------------------------------------
	GUI.textboxCasting3 = GUI.textboxCasting3 or
		Geyser.Label:new({
			name = "textboxCasting3",
			x = x8, y = y7+6,
			fontSize = 11,
			width = 100,
			height = 17,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.textboxCasting3:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxCasting3", "<yellow>NOTES")
	GUI.textboxCasting3:setToolTip(tooltip_casting10,Status.tooltipTime)



	-- CREATE TEXTBOX4 -> CASTING -> TABWINDOW2 (addon box)
	-------------------------------------------------------
	GUI.textboxCasting4 = GUI.textboxCasting4 or
		Geyser.Label:new({
			name = "textboxCasting4",
			x = x8, y = y8+6,
			fontSize = 11,
			width = 100,
			height = 17,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.textboxCasting4:setStyleSheet(StyleTextBlue:getCSS())
	cecho("textboxCasting4", "<yellow>ADDON CMD")
	GUI.textboxCasting4:setToolTip(tooltip_casting11,Status.tooltipTime)









-------------------------------------------------------------------------------
-- COMMAND LINES
-------------------------------------------------------------------------------









 	-- CREATE COMMANDLINE1 -> CASTING -> TABWINDOW2 (spell)
	-------------------------------------------------------
	GUI.commandlineCasting1 = GUI.commandlineCasting1 or
    Geyser.CommandLine:new({
        name = "commandlineCasting1",
        x = x6, y = y5,
        width = w1, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting1:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting1:setAction(
        function(command)
            Events.raiseEvent("setAutocastSpellEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE2 -> CASTING -> TABWINDOW2 (power)
	-------------------------------------------------------
	GUI.commandlineCasting2 = GUI.commandlineCasting2 or
    Geyser.CommandLine:new({
        name = "commandlineCasting2",
        x = x7, y = y5,
        width = w2, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting2:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting2:setAction(
        function(command)
            Events.raiseEvent("setAutocastPowerEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE3 -> CASTING -> TABWINDOW2 (adjust down)
	-------------------------------------------------------
	GUI.commandlineCasting3 = GUI.commandlineCasting3 or
    Geyser.CommandLine:new({
        name = "commandlineCasting3",
        x = x7, y = y6,
        width = w2, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting3:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting3:setAction(
        function(command)
            Events.raiseEvent("setAutocastAdjustDownEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE4 -> CASTING -> TABWINDOW2 (adjust up)
	-------------------------------------------------------
	GUI.commandlineCasting4 = GUI.commandlineCasting4 or
    Geyser.CommandLine:new({
        name = "commandlineCasting4",
        x = x7, y = y7,
        width = w2, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting4:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting4:setAction(
        function(command)
            Events.raiseEvent("setAutocastAdjustUpEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE5 -> CASTING -> TABWINDOW2 (arguments)
	-------------------------------------------------------
	GUI.commandlineCasting5 = GUI.commandlineCasting5 or
    Geyser.CommandLine:new({
        name = "commandlineCasting5",
        x = x6, y = y6,
        width = w1, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting5:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting5:setAction(
        function(command)
            Events.raiseEvent("setAutocastArgsEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE6 -> CASTING -> TABWINDOW2 (notes)
	-------------------------------------------------------
	GUI.commandlineCasting6 = GUI.commandlineCasting6 or
    Geyser.CommandLine:new({
        name = "commandlineCasting6",
        x = x6, y = y7,
        width = w1, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting6:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting6:setAction(
        function(command)
            --Events.raiseEvent("setAutocastAdjustUpEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE7 -> CASTING -> TABWINDOW2 (channel amt)
	-------------------------------------------------------
	GUI.commandlineCasting7 = GUI.commandlineCasting7 or
    Geyser.CommandLine:new({
        name = "commandlineCasting7",
        x = x7, y = y8,
        width = w2, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting7:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting7:setAction(
        function(command)
            Events.raiseEvent("setAutocastChannelAmtEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )



	-- CREATE COMMANDLINE8 -> CASTING -> TABWINDOW2 (addon command)
	-------------------------------------------------------
	GUI.commandlineCasting8 = GUI.commandlineCasting8 or
    Geyser.CommandLine:new({
        name = "commandlineCasting8",
        x = x6, y = y8,
        width = w1, height = 28,
    }, GUI.containerCastingBox)

    GUI.commandlineCasting8:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineCasting8:setAction(
        function(command)
            Events.raiseEvent("setAutocastChannelAmtEvent", {input = command})
			GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
			tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        end
    )









-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------










    -- CREATE BUTTON1 -> CASTING -> TABWINDOW2  (far back button)
	-----------------------------------------------------------
	GUI.buttonCasting1 = GUI.buttonCasting1 or
		Geyser.Label:new({
			name = "buttonCasting1",
			x = x2, y = y2,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.buttonCasting1:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonCasting1", "<center><span style='font-size: 25pt;'>&#9664;&#9664;</span></center>")
	GUI.buttonCasting1:setToolTip(tooltip_casting1,Status.tooltipTime)
	GUI.buttonCasting1:setClickCallback("buttonCasting1_click")

	function buttonCasting1_click()
		GUI.buttonCasting1:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonCasting1:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        --Events.raiseEvent("setRepeatCurrentNumberEvent", "up")
	end



    -- CREATE BUTTON2 -> CASTING -> TABWINDOW2  (back button)
	-----------------------------------------------------------
	GUI.buttonCasting2 = GUI.buttonCasting2 or
    Geyser.Label:new({
        name = "buttonCasting2",
        x = x3, y = y2,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerCastingBox)

    GUI.buttonCasting2:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonCasting2", "<center><span style='font-size: 25pt;'>&#9664;</span></center>")
    GUI.buttonCasting2:setToolTip(tooltip_casting2,Status.tooltipTime)
    GUI.buttonCasting2:setClickCallback("buttonCasting2_click")

    function buttonCasting2_click()
        GUI.buttonCasting2:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonCasting2:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        --Events.raiseEvent("setRepeatCurrentNumberEvent", "up")
    end



    -- CREATE BUTTON3 -> CASTING -> TABWINDOW2  (next button)
	-----------------------------------------------------------
	GUI.buttonCasting3 = GUI.buttonCasting3 or
    Geyser.Label:new({
        name = "buttonCasting3",
        x = x4, y = y2,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerCastingBox)

    GUI.buttonCasting3:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonCasting3", "<center><span style='font-size: 25pt;'>&#9654;</span></center>")
    GUI.buttonCasting3:setToolTip(tooltip_casting3,Status.tooltipTime)
    GUI.buttonCasting3:setClickCallback("buttonCasting3_click")

    function buttonCasting3_click()
        GUI.buttonCasting3:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonCasting3:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        --Events.raiseEvent("setRepeatCurrentNumberEvent", "up")
    end



    -- CREATE BUTTON4 -> CASTING -> TABWINDOW2  (jump forward button)
	-----------------------------------------------------------
	GUI.buttonCasting4 = GUI.buttonCasting4 or
    Geyser.Label:new({
        name = "buttonCasting4",
        x = x5, y = y2,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerCastingBox)

    GUI.buttonCasting4:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonCasting4", "<center><span style='font-size: 25pt;'>&#9654;&#9654;</span></center>")
    GUI.buttonCasting4:setToolTip(tooltip_casting4,Status.tooltipTime)
    GUI.buttonCasting4:setClickCallback("buttonCasting4_click")

    function buttonCasting4_click()
        GUI.buttonCasting4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonCasting4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        --Events.raiseEvent("setRepeatCurrentNumberEvent", "up")
    end



	-- CREATE BUTTON5 -> CASTING -> TABWINDOW2 (autocast on/off)
	-----------------------------------------------------------
	GUI.buttonCasting5 = GUI.buttonCasting5 or
		Geyser.Label:new({
			name = "buttonCasting5",
			x = x1, y = y1,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.buttonCasting5:setStyleSheet(StyleButtonDarkGrey:getCSS())
	echo("buttonCasting5", "<center>AUTOCAST OFF</center>")
	GUI.buttonCasting5:setToolTip(tooltip_casting5,Status.tooltipTime)
	GUI.buttonCasting5:setClickCallback("ButtonCasting5_click")

	function ButtonCasting5_click()
		Events.raiseEvent("setAutocastActiveEvent")
	end



	-- CREATE BUTTON6 -> CASTING -> TABWINDOW2 (reset stats)
	-----------------------------------------------------------
	GUI.buttonCasting6 = GUI.buttonCasting6 or
		Geyser.Label:new({
			name = "buttonCasting6",
			x = x1, y = y2,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.buttonCasting6:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonCasting6", "<center>RESET STATS</center>")
	GUI.buttonCasting6:setToolTip(tooltip_casting6,Status.tooltipTime)
	GUI.buttonCasting6:setClickCallback("ButtonCasting6_click")

	function ButtonCasting6_click()
		GUI.buttonCasting6:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonCasting6:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		--Events.raiseEvent("setAutocastActiveEvent")
	end



	-- CREATE BUTTON7 -> CASTING -> TABWINDOW2 (save settings)
	-----------------------------------------------------------
	GUI.buttonCasting7 = GUI.buttonCasting7 or
		Geyser.Label:new({
			name = "buttonCasting7",
			x = x1, y = y3,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonCasting7", "<center>SAVE SETTINGS</center>")
	GUI.buttonCasting7:setToolTip(tooltip_casting7,Status.tooltipTime)
	GUI.buttonCasting7:setClickCallback("ButtonCasting7_click")

	function ButtonCasting7_click()
		GUI.buttonCasting7:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonCasting7:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
		--Events.raiseEvent("saveChannelSettingsEvent", {input = ""})
	end


end

return castingbox