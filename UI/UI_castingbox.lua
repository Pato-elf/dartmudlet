castingbox = {}


function createCastingBox()


    local x1    = 10
    local x2    = 65
    local x3    = 120
    local x4    = 175


    local y1    = 10



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



echo("CastingBox", Info.showUnderConstruction())




-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------








    -- CREATE BUTTON1 -> CASTING -> TABWINDOW2  (far back button)
	-----------------------------------------------------------
	GUI.buttonCasting1 = GUI.buttonCasting1 or
		Geyser.Label:new({
			name = "buttonCasting1",
			x = x1, y = y1,
			fontSize = 14,
			width = 60,
			height = 60,
			color = "black"
		}, GUI.containerCastingBox)

	GUI.buttonCasting1:setStyleSheet(StyleButtonLightGrey:getCSS())
	echo("buttonCasting1", "<center><span style='font-size: 25pt;'>&#9664;&#9664;</span></center>")
	GUI.buttonCasting1:setToolTip("Jump back by 10 spells",Status.tooltipTime)
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
        x = x2, y = y1,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerCastingBox)

    GUI.buttonCasting2:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonCasting2", "<center><span style='font-size: 25pt;'>&#9664;</span></center>")
    GUI.buttonCasting2:setToolTip("Go to previous spell",Status.tooltipTime)
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
        x = x3, y = y1,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerCastingBox)

    GUI.buttonCasting3:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonCasting3", "<center><span style='font-size: 25pt;'>&#9654;</span></center>")
    GUI.buttonCasting3:setToolTip("Go to next spell",Status.tooltipTime)
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
        x = x4, y = y1,
        fontSize = 14,
        width = 60,
        height = 60,
        color = "black"
    }, GUI.containerCastingBox)

    GUI.buttonCasting4:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonCasting4", "<center><span style='font-size: 25pt;'>&#9654;&#9654;</span></center>")
    GUI.buttonCasting4:setToolTip("Jump forward by 10 spells",Status.tooltipTime)
    GUI.buttonCasting4:setClickCallback("buttonCasting4_click")

    function buttonCasting4_click()
        GUI.buttonCasting4:setStyleSheet(StyleButtonPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonCasting4:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        --Events.raiseEvent("setRepeatCurrentNumberEvent", "up")
    end




end

return castingbox