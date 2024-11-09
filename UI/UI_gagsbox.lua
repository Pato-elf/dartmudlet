gagsbox = {}


function createGagsBox()

    local x1        = 10
    local x2        = 23

    local y1        = 20
    local y2        = 44
    local y3        = 68
    local y4        = 92
    local y5        = 116
    local y6        = 140
    local y7        = 164

    local y9        = 212

    local width1    = 265

    local tooltip_gags1 = "Gags empty lines and prompts (Recommended On)"
    local tooltip_gags2 = "Gags the majority of emotes from pets"
    local tooltip_gags3 = "Gags many emotes from wild creatures"
    local tooltip_gags4 = "Gags emotes and chatter from many citzens around Gilmore and Soriktos"
    local tooltip_gags5 = "Gags emotes and chatter from trainers like Nazir and Ambrosius"
    local tooltip_gags6 = "Gags emotes and chatter from common sparring partners like Ruffians and Pells"
    local tooltip_gags7 = "Gags some channelling messages such as failed channels and \"Gossamar strand\" text"
    local tooltip_gags8 = "Toggle AntiSpam system on|off (Recommended Off unless needed)"


-- CREATE GAGS BOX -> TABWINDOW3
-----------------------------------------------------------
GUI.containerGagsBox = GUI.containerGagsBox or
	Geyser.Label:new({
		name = "GagsBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow3.GAGScenter)

GUI.containerGagsBox:setStyleSheet(StyleBoxBlue:getCSS())






-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------





	-- CREATE TEXTBOX1 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags1 = GUI.textboxGags1 or
		Geyser.Label:new({
			name = "textboxGags1",
			x = x2, y = y1,
			fontSize = 11,
			width = width1,
			height = 24,
			color = "black"
		}, GUI.containerGagsBox)

	GUI.textboxGags1:setStyleSheet(StyleTextYellowLarge:getCSS())
	cecho("textboxGags1", "<yellow>Gag empty lines/prompts")
	GUI.textboxGags1:setToolTip(tooltip_gags1,Status.tooltipTime)



    -- CREATE TEXTBOX2 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags2 = GUI.textboxGags2 or
    Geyser.Label:new({
        name = "textboxGags2",
        x = x2, y = y2,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags2:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags2", "<yellow>Gag pet emotes")
    GUI.textboxGags2:setToolTip(tooltip_gags2,Status.tooltipTime)



    -- CREATE TEXTBOX3 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags3 = GUI.textboxGags3 or
    Geyser.Label:new({
        name = "textboxGags3",
        x = x2, y = y3,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags3:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags3", "<yellow>Gag creature emotes")
    GUI.textboxGags3:setToolTip(tooltip_gags3,Status.tooltipTime)



    -- CREATE TEXTBOX4 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags4 = GUI.textboxGags4 or
    Geyser.Label:new({
        name = "textboxGags4",
        x = x2, y = y4,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags4:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags4", "<yellow>Gag citizen emotes")
    GUI.textboxGags4:setToolTip(tooltip_gags4,Status.tooltipTime)



    -- CREATE TEXTBOX5 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags5 = GUI.textboxGags5 or
    Geyser.Label:new({
        name = "textboxGags5",
        x = x2, y = y5,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags5:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags5", "<yellow>Gag trainer emotes")
    GUI.textboxGags5:setToolTip(tooltip_gags5,Status.tooltipTime)



    -- CREATE TEXTBOX6 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags6 = GUI.textboxGags6 or
    Geyser.Label:new({
        name = "textboxGags6",
        x = x2, y = y6,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags6:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags6", "<yellow>Gag sparring emotes")
    GUI.textboxGags6:setToolTip(tooltip_gags6,Status.tooltipTime)



    -- CREATE TEXTBOX7 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags7 = GUI.textboxGags7 or
    Geyser.Label:new({
        name = "textboxGags7",
        x = x2, y = y7,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags7:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags7", "<yellow>Gag misc channel text")
    GUI.textboxGags7:setToolTip(tooltip_gags7,Status.tooltipTime)



    -- CREATE TEXTBOX8 -> GAGS -> TABWINDOW3
	-------------------------------------------------------
	GUI.textboxGags8 = GUI.textboxGags8 or
    Geyser.Label:new({
        name = "textboxGags8",
        x = x2, y = y9,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.textboxGags8:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxGags8", "<yellow>AntiSpam")
    GUI.textboxGags8:setToolTip(tooltip_gags8,Status.tooltipTime)




-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------





    -- CREATE BUTTON1 -> GAGS -> TABWINDOW3  (gag button 1)
	-----------------------------------------------------------
	GUI.buttonGags1 = GUI.buttonGags1 or
    Geyser.Label:new({
        name = "buttonGags1",
        x = x1, y = y1,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags1:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
    GUI.buttonGags1:setToolTip(tooltip_gags1,Status.tooltipTime)
    GUI.buttonGags1:setClickCallback("buttonGags1_click")

    function buttonGags1_click()
        Events.raiseEvent("setGagPromptsEvent", {number = 1})
    end



    -- CREATE BUTTON2 -> GAGS -> TABWINDOW3  (gag button 2)
	-----------------------------------------------------------
	GUI.buttonGags2 = GUI.buttonGags2 or
    Geyser.Label:new({
        name = "buttonGags2",
        x = x1, y = y2,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags2:setStyleSheet(StyleButtonSmallPaleGreen:getCSS())
    GUI.buttonGags2:setToolTip(tooltip_gags2,Status.tooltipTime)
    GUI.buttonGags2:setClickCallback("buttonGags2_click")

    function buttonGags2_click()
        Events.raiseEvent("setGagPetsEvent", {number = 2})
    end



    -- CREATE BUTTON3 -> GAGS -> TABWINDOW3  (gag button 3)
	-----------------------------------------------------------
	GUI.buttonGags3 = GUI.buttonGags3 or
    Geyser.Label:new({
        name = "buttonGags3",
        x = x1, y = y3,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonGags3:setToolTip(tooltip_gags3,Status.tooltipTime)
    GUI.buttonGags3:setClickCallback("buttonGags3_click")

    function buttonGags3_click()
        Events.raiseEvent("setGagCreaturesEvent", {number = 3})
    end



    -- CREATE BUTTON4 -> GAGS -> TABWINDOW3  (gag button 4)
	-----------------------------------------------------------
	GUI.buttonGags4 = GUI.buttonGags4 or
    Geyser.Label:new({
        name = "buttonGags4",
        x = x1, y = y4,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonGags4:setToolTip(tooltip_gags4,Status.tooltipTime)
    GUI.buttonGags4:setClickCallback("buttonGags4_click")

    function buttonGags4_click()
        Events.raiseEvent("setGagCitizensEvent", {number = 4})
    end



    -- CREATE BUTTON5 -> GAGS -> TABWINDOW3  (gag button 5)
	-----------------------------------------------------------
	GUI.buttonGags5 = GUI.buttonGags5 or
    Geyser.Label:new({
        name = "buttonGags5",
        x = x1, y = y5,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonGags5:setToolTip(tooltip_gags5,Status.tooltipTime)
    GUI.buttonGags5:setClickCallback("buttonGags5_click")

    function buttonGags5_click()
        Events.raiseEvent("setGagTrainersEvent", {number = 5})
    end



    -- CREATE BUTTON6 -> GAGS -> TABWINDOW3  (gag button 6)
	-----------------------------------------------------------
	GUI.buttonGags6 = GUI.buttonGags6 or
    Geyser.Label:new({
        name = "buttonGags6",
        x = x1, y = y6,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonGags6:setToolTip(tooltip_gags6,Status.tooltipTime)
    GUI.buttonGags6:setClickCallback("buttonGags6_click")

    function buttonGags6_click()
        Events.raiseEvent("setGagSparringEvent", {number = 6})
    end



    -- CREATE BUTTON7 -> GAGS -> TABWINDOW3  (gag button 7)
	-----------------------------------------------------------
	GUI.buttonGags7 = GUI.buttonGags7 or
    Geyser.Label:new({
        name = "buttonGags7",
        x = x1, y = y7,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonGags7:setToolTip(tooltip_gags7,Status.tooltipTime)
    GUI.buttonGags7:setClickCallback("buttonGags7_click")

    function buttonGags7_click()
        Events.raiseEvent("setGagChannelsEvent", {number = 7})
    end



    -- CREATE BUTTON8 -> GAGS -> TABWINDOW3  (gag button 8)
	-----------------------------------------------------------
	GUI.buttonGags8 = GUI.buttonGags8 or
    Geyser.Label:new({
        name = "buttonGags8",
        x = x1, y = y9,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerGagsBox)

    GUI.buttonGags8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonGags8:setToolTip(tooltip_gags8,Status.tooltipTime)
    GUI.buttonGags8:setClickCallback("buttonGags8_click")

    function buttonGags8_click()
        Events.raiseEvent("setAntiSpamButtonEvent", {number = 8})
    end


end

return gagsbox