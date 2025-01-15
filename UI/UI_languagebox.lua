languagebox = {}


function createLanguageBox()


    local x1        = 10
    local x2        = 23
    local x3        = -274
    local x4        = -200
    local x5        = -120

    local y1        = 10
    local y2        = 20
    local y3        = 55
    local y4        = 80
    local y5        = 86
    local y6        = 110
    local y7        = 134
    local y8        = 158
    local y9        = 182
    local y10       = 206
    local y11       = 230

    local width1    = 240
    local width2    = 95
    local width3    = 64
    local width4    = 100

    local tooltip_language1     = "Recite lyrics from bardic songs"
    local tooltip_language2     = "Recite lines from the epic poem Beowulf"
    local tooltip_language3     = "Recite medieval proverbs and wisdom"
    local tooltip_language4     = "Recite from a list of nature metaphors"
    local tooltip_language5     = "Recite various rituals, proclamations, and oaths"
    local tooltip_language6     = "Recite lines from the Squire's Tale (Canterbury Tales)"
    local tooltip_language7     = "Current line number"
    local tooltip_language8     = "Number of lines in text"
    local tooltip_language9     = "Total lines recited"
    local tooltip_language10    = "Grand total of lines recited"
    local tooltip_language11    = "Language to train (must be a known language)"
    local tooltip_language12    = "Reset current line numbers"
    local tooltip_language13    = "Turn language trainer on/off"



-- CREATE LANGUAGE BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerLanguageBox = GUI.containerLanguageBox or
Geyser.Label:new({
    name = "LanguageBox",
    x = 0, y = 0,
    fontSize = 10,
    width = "100%",
    height = "100%",
    color = "black"
}, GUI.tabwindow1.LANGUAGEcenter)

GUI.containerLanguageBox:setStyleSheet(StyleBoxBlue:getCSS())



--echo("LanguageBox", Info.showUnderConstruction())




-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------





	-- CREATE TEXTBOX1 -> LANGUAGE -> TABWINDOW1
	-------------------------------------------------------
	GUI.textboxLanguage1 = GUI.textboxLanguage1 or
		Geyser.Label:new({
			name = "textboxLanguage1",
			x = x2, y = y5,
			fontSize = 11,
			width = width1,
			height = 24,
			color = "black"
		}, GUI.containerLanguageBox)

	GUI.textboxLanguage1:setStyleSheet(StyleTextYellowLarge:getCSS())
	cecho("textboxLanguage1", "<yellow>"..Status.languageTitle1)
	GUI.textboxLanguage1:setToolTip(tooltip_language1,Status.tooltipTime)



    -- CREATE TEXTBOX2 -> LANGUAGE -> TABWINDOW1
	-------------------------------------------------------
	GUI.textboxLanguage2 = GUI.textboxLanguage2 or
    Geyser.Label:new({
        name = "textboxLanguage2",
        x = x2, y = y6,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage2:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxLanguage2", "<yellow>"..Status.languageTitle2)
    GUI.textboxLanguage2:setToolTip(tooltip_language2,Status.tooltipTime)



    -- CREATE TEXTBOX3 -> LANGUAGE -> TABWINDOW1
	-------------------------------------------------------
	GUI.textboxLanguage3 = GUI.textboxLanguage3 or
    Geyser.Label:new({
        name = "textboxLanguage3",
        x = x2, y = y7,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage3:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxLanguage3", "<yellow>"..Status.languageTitle3)
    GUI.textboxLanguage3:setToolTip(tooltip_language3,Status.tooltipTime)



    -- CREATE TEXTBOX4 -> LANGUAGE -> TABWINDOW1
	-------------------------------------------------------
	GUI.textboxLanguage4 = GUI.textboxLanguage4 or
    Geyser.Label:new({
        name = "textboxLanguage4",
        x = x2, y = y8,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage4:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxLanguage4", "<yellow>"..Status.languageTitle4)
    GUI.textboxLanguage4:setToolTip(tooltip_language4,Status.tooltipTime)



    -- CREATE TEXTBOX5 -> LANGUAGE -> TABWINDOW1
	-------------------------------------------------------
	GUI.textboxLanguage5 = GUI.textboxLanguage5 or
    Geyser.Label:new({
        name = "textboxLanguage5",
        x = x2, y = y9,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage5:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxLanguage5", "<yellow>"..Status.languageTitle5)
    GUI.textboxLanguage5:setToolTip(tooltip_language5,Status.tooltipTime)



    -- CREATE TEXTBOX6 -> LANGUAGE -> TABWINDOW1
	-------------------------------------------------------
	GUI.textboxLanguage6 = GUI.textboxLanguage6 or
    Geyser.Label:new({
        name = "textboxLanguage6",
        x = x2, y = y10,
        fontSize = 11,
        width = width1,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage6:setStyleSheet(StyleTextYellowLarge:getCSS())
    cecho("textboxLanguage6", "<yellow>"..Status.languageTitle6)
    GUI.textboxLanguage6:setToolTip(tooltip_language6,Status.tooltipTime)










    -- CREATE TEXTBOX7 -> LANGUAGE -> TABWINDOW1 (current line text 1)
	-------------------------------------------------------
	GUI.textboxLanguage7 = GUI.textboxLanguage7 or
    Geyser.Label:new({
        name = "textboxLanguage7",
        x = x3, y = y5,
        fontSize = 13,
        width = width2,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage7:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage7:echo(Status.languageLine1.."/","yellow","r")
    GUI.textboxLanguage7:setToolTip(tooltip_language7,Status.tooltipTime)



    -- CREATE TEXTBOX8 -> LANGUAGE -> TABWINDOW1 (current line text 2)
	-------------------------------------------------------
	GUI.textboxLanguage8 = GUI.textboxLanguage8 or
    Geyser.Label:new({
        name = "textboxLanguage8",
        x = x3, y = y6,
        fontSize = 13,
        width = width2,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage8:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage8:echo(Status.languageLine1.."/","yellow","r")
    GUI.textboxLanguage8:setToolTip(tooltip_language7,Status.tooltipTime)



    -- CREATE TEXTBOX9 -> LANGUAGE -> TABWINDOW1 (current line text 3)
	-------------------------------------------------------
	GUI.textboxLanguage9 = GUI.textboxLanguage9 or
    Geyser.Label:new({
        name = "textboxLanguage9",
        x = x3, y = y7,
        fontSize = 13,
        width = width2,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage9:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage9:echo(Status.languageLine3.."/","yellow","r")
    GUI.textboxLanguage9:setToolTip(tooltip_language7,Status.tooltipTime)



    -- CREATE TEXTBOX10 -> LANGUAGE -> TABWINDOW1 (current line text 4)
	-------------------------------------------------------
	GUI.textboxLanguage10 = GUI.textboxLanguage10 or
    Geyser.Label:new({
        name = "textboxLanguage10",
        x = x3, y = y8,
        fontSize = 13,
        width = width2,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage10:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage10:echo(Status.languageLine4.."/","yellow","r")
    GUI.textboxLanguage10:setToolTip(tooltip_language7,Status.tooltipTime)



    -- CREATE TEXTBOX11 -> LANGUAGE -> TABWINDOW1 (current line text 5)
	-------------------------------------------------------
	GUI.textboxLanguage11 = GUI.textboxLanguage11 or
    Geyser.Label:new({
        name = "textboxLanguage11",
        x = x3, y = y9,
        fontSize = 13,
        width = width2,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage11:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage11:echo(Status.languageLine5.."/","yellow","r")
    GUI.textboxLanguage11:setToolTip(tooltip_language7,Status.tooltipTime)



    -- CREATE TEXTBOX12 -> LANGUAGE -> TABWINDOW1 (current line text 6)
	-------------------------------------------------------
	GUI.textboxLanguage12 = GUI.textboxLanguage12 or
    Geyser.Label:new({
        name = "textboxLanguage12",
        x = x3, y = y10,
        fontSize = 13,
        width = width2,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage12:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage12:echo(Status.languageLine6.."/","yellow","r")
    GUI.textboxLanguage12:setToolTip(tooltip_language7,Status.tooltipTime)










    -- CREATE TEXTBOX13 -> LANGUAGE -> TABWINDOW1 (total lines text 1)
	-------------------------------------------------------
	GUI.textboxLanguage13 = GUI.textboxLanguage13 or
    Geyser.Label:new({
        name = "textboxLanguage13",
        x = x4, y = y5,
        fontSize = 13,
        width = width3,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage13:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage13:echo(Status.languageSize1,"yellow","r")
    GUI.textboxLanguage13:setToolTip(tooltip_language8,Status.tooltipTime)



    -- CREATE TEXTBOX14 -> LANGUAGE -> TABWINDOW1 (total lines text 2)
	-------------------------------------------------------
	GUI.textboxLanguage14 = GUI.textboxLanguage14 or
    Geyser.Label:new({
        name = "textboxLanguage14",
        x = x4, y = y6,
        fontSize = 13,
        width = width3,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage14:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage14:echo(Status.languageSize2,"yellow","r")
    GUI.textboxLanguage14:setToolTip(tooltip_language8,Status.tooltipTime)



    -- CREATE TEXTBOX15 -> LANGUAGE -> TABWINDOW1 (total lines text 3)
	-------------------------------------------------------
	GUI.textboxLanguage15 = GUI.textboxLanguage15 or
    Geyser.Label:new({
        name = "textboxLanguage15",
        x = x4, y = y7,
        fontSize = 13,
        width = width3,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage15:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage15:echo(Status.languageSize3,"yellow","r")
    GUI.textboxLanguage15:setToolTip(tooltip_language8,Status.tooltipTime)



    -- CREATE TEXTBOX16 -> LANGUAGE -> TABWINDOW1 (total lines text 4)
	-------------------------------------------------------
	GUI.textboxLanguage16 = GUI.textboxLanguage16 or
    Geyser.Label:new({
        name = "textboxLanguage16",
        x = x4, y = y8,
        fontSize = 13,
        width = width3,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage16:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage16:echo(Status.languageSize4,"yellow","r")
    GUI.textboxLanguage16:setToolTip(tooltip_language8,Status.tooltipTime)



    -- CREATE TEXTBOX17 -> LANGUAGE -> TABWINDOW1 (total lines text 5)
	-------------------------------------------------------
	GUI.textboxLanguage17 = GUI.textboxLanguage17 or
    Geyser.Label:new({
        name = "textboxLanguage17",
        x = x4, y = y9,
        fontSize = 13,
        width = width3,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage17:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage17:echo(Status.languageSize5,"yellow","r")
    GUI.textboxLanguage17:setToolTip(tooltip_language8,Status.tooltipTime)



    -- CREATE TEXTBOX18 -> LANGUAGE -> TABWINDOW1 (total lines text 6)
	-------------------------------------------------------
	GUI.textboxLanguage18 = GUI.textboxLanguage18 or
    Geyser.Label:new({
        name = "textboxLanguage18",
        x = x4, y = y10,
        fontSize = 13,
        width = width3,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage18:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage18:echo(Status.languageSize6,"yellow","r")
    GUI.textboxLanguage18:setToolTip(tooltip_language8,Status.tooltipTime)










    -- CREATE TEXTBOX19 -> LANGUAGE -> TABWINDOW1 (total counter text 1)
	-------------------------------------------------------
	GUI.textboxLanguage19 = GUI.textboxLanguage19 or
    Geyser.Label:new({
        name = "textboxLanguage19",
        x = x5, y = y5,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage19:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage19:echo(Status.languageTotal1,"yellow","r")
    GUI.textboxLanguage19:setToolTip(tooltip_language9,Status.tooltipTime)



    -- CREATE TEXTBOX20 -> LANGUAGE -> TABWINDOW1 (total counter text 2)
	-------------------------------------------------------
	GUI.textboxLanguage20 = GUI.textboxLanguage20 or
    Geyser.Label:new({
        name = "textboxLanguage20",
        x = x5, y = y6,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage20:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage20:echo(Status.languageTotal2,"yellow","r")
    GUI.textboxLanguage20:setToolTip(tooltip_language9,Status.tooltipTime)



    -- CREATE TEXTBOX21 -> LANGUAGE -> TABWINDOW1 (total counter text 3)
	-------------------------------------------------------
	GUI.textboxLanguage21 = GUI.textboxLanguage21 or
    Geyser.Label:new({
        name = "textboxLanguage21",
        x = x5, y = y7,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage21:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage21:echo(Status.languageTotal3,"yellow","r")
    GUI.textboxLanguage21:setToolTip(tooltip_language9,Status.tooltipTime)



    -- CREATE TEXTBOX22 -> LANGUAGE -> TABWINDOW1 (total counter text 4)
	-------------------------------------------------------
	GUI.textboxLanguage22 = GUI.textboxLanguage22 or
    Geyser.Label:new({
        name = "textboxLanguage22",
        x = x5, y = y8,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage22:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage22:echo(Status.languageTotal4,"yellow","r")
    GUI.textboxLanguage22:setToolTip(tooltip_language9,Status.tooltipTime)



    -- CREATE TEXTBOX23 -> LANGUAGE -> TABWINDOW1 (total counter text 5)
	-------------------------------------------------------
	GUI.textboxLanguage23 = GUI.textboxLanguage23 or
    Geyser.Label:new({
        name = "textboxLanguage23",
        x = x5, y = y9,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage23:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage23:echo(Status.languageTotal5,"yellow","r")
    GUI.textboxLanguage23:setToolTip(tooltip_language9,Status.tooltipTime)



    -- CREATE TEXTBOX24 -> LANGUAGE -> TABWINDOW1 (total counter text 6)
	-------------------------------------------------------
	GUI.textboxLanguage24 = GUI.textboxLanguage24 or
    Geyser.Label:new({
        name = "textboxLanguage24",
        x = x5, y = y10,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage24:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage24:echo(Status.languageTotal6,"yellow","r")
    GUI.textboxLanguage24:setToolTip(tooltip_language9,Status.tooltipTime)










    -- CREATE TEXTBOX25 -> LANGUAGE -> TABWINDOW1 (total counter all text)
	-------------------------------------------------------
	GUI.textboxLanguage25 = GUI.textboxLanguage25 or
    Geyser.Label:new({
        name = "textboxLanguage25",
        x = x5, y = y11,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage25:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage25:echo("0","yellow","r")
    GUI.textboxLanguage25:setToolTip(tooltip_language10,Status.tooltipTime)



    -- CREATE TEXTBOX26 -> LANGUAGE -> TABWINDOW1 (horizontal line)
	-------------------------------------------------------
	GUI.textboxLanguage26 = GUI.textboxLanguage26 or
    Geyser.Label:new({
        name = "textboxLanguage26",
        x = 1, y = y4,
        fontSize = 13,
        width = "100%",
        height = 1,
        color = "white"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage26:setStyleSheet(StyleHorizontalLine:getCSS())



    -- CREATE TEXTBOX27 -> LANGUAGE -> TABWINDOW1 (total header)
	-------------------------------------------------------
	GUI.textboxLanguage27 = GUI.textboxLanguage27 or
    Geyser.Label:new({
        name = "textboxLanguage27",
        x = x5, y = y3,
        fontSize = 13,
        width = width4,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage27:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage27:echo("TOTAL","yellow","r")
    GUI.textboxLanguage27:setToolTip(tooltip_language10,Status.tooltipTime)



    -- CREATE TEXTBOX28 -> LANGUAGE -> TABWINDOW1 (lines header)
	-------------------------------------------------------
	GUI.textboxLanguage28 = GUI.textboxLanguage28 or
    Geyser.Label:new({
        name = "textboxLanguage28",
        x = x3-10, y = y3,
        fontSize = 13,
        width = width4+20,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage28:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage28:echo("NUM/LINES","yellow","r")
    GUI.textboxLanguage28:setToolTip(tooltip_language9,Status.tooltipTime)



    -- CREATE TEXTBOX29 -> LANGUAGE -> TABWINDOW1 (language tag)
	-------------------------------------------------------
	GUI.textboxLanguage29 = GUI.textboxLanguage29 or
    Geyser.Label:new({
        name = "textboxLanguage29",
        x = -330, y = y2+1,
        fontSize = 13,
        width = width4+10,
        height = 24,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.textboxLanguage29:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxLanguage29:echo("LANGUAGE","yellow","r")
    GUI.textboxLanguage29:setToolTip(tooltip_language11,Status.tooltipTime)




-------------------------------------------------------------------------------
-- COMMAND LINES
-------------------------------------------------------------------------------



	-- CREATE COMMANDLINE1 -> LANGUAGE -> TABWINDOW1  (languageName)
	-------------------------------------------------------
	GUI.commandlineLanguage1 = GUI.commandlineLanguage1 or
    Geyser.CommandLine:new({
        name = "commandlineLanguage1",
        x = -221, y = y2-1,
        width = 205, height = 28,
    }, GUI.containerLanguageBox)

    GUI.commandlineLanguage1:setStyleSheet(StyleCommandLine:getCSS())

    GUI.commandlineLanguage1:setAction(
    function(command)
        Events.raiseEvent("setLanguageTypeEvent", {save = true, input = command})
    end
    )






-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------



	-- CREATE BUTTON1 -> LANGUAGE -> TABWINDOW1 (on/off)
	-----------------------------------------------------------
	GUI.buttonLanguage1 = GUI.buttonLanguage1 or
		Geyser.Label:new({
			name = "buttonLanguage1",
			x = x1, y = y1,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerLanguageBox)

	GUI.buttonLanguage1:setStyleSheet(StyleButtonDarkGrey:getCSS())
	echo("buttonLanguage1", "<center>LANGUAGE OFF</center>")
	GUI.buttonLanguage1:setToolTip(tooltip_language13,Status.tooltipTime)
	GUI.buttonLanguage1:setClickCallback("ButtonLanguage1_click")

	function ButtonLanguage1_click()
        Events.raiseEvent("setLanguageActiveEvent")
	end



    -- CREATE BUTTON2 -> LANGUAGE -> TABWINDOW1 (reset stats)
	-----------------------------------------------------------
	GUI.buttonLanguage2 = GUI.buttonLanguage2 or
    Geyser.Label:new({
        name = "buttonLanguage2",
        x = x4+31, y = y3,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage2:setStyleSheet(StyleButtonExtraSmallLightGrey:getCSS())
    echo("buttonLanguage2", "<center><span style='font-size: 9pt; color: green;'>&#x274C;</span></center>")
    GUI.buttonLanguage2:setToolTip(tooltip_language12,Status.tooltipTime)
    GUI.buttonLanguage2:setClickCallback("ButtonLanguage2_click")

    function ButtonLanguage2_click()
        GUI.buttonLanguage2:setStyleSheet(StyleButtonExtraSmallPaleBlue:getCSS())
        tempTimer(0.15, function() GUI.buttonLanguage2:setStyleSheet(StyleButtonExtraSmallLightGrey:getCSS()) end)
        Events.raiseEvent("setLanguageResetEvent")
    end



    -- CREATE BUTTON3 -> LANGUAGE -> TABWINDOW1  (recite button 1)
	-----------------------------------------------------------
	GUI.buttonLanguage3 = GUI.buttonLanguage3 or
    Geyser.Label:new({
        name = "buttonLanguage3",
        x = x1, y = y5,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage3:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonLanguage3:setToolTip(tooltip_language1,Status.tooltipTime)
    GUI.buttonLanguage3:setClickCallback("buttonLanguage3_click")

    function buttonLanguage3_click()
        Events.raiseEvent("setLanguageContentEvent", {number = 1})
    end



    -- CREATE BUTTON4 -> LANGUAGE -> TABWINDOW1  (recite button 2)
	-----------------------------------------------------------
	GUI.buttonLanguage4 = GUI.buttonLanguage4 or
    Geyser.Label:new({
        name = "buttonLanguage4",
        x = x1, y = y6,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage4:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonLanguage4:setToolTip(tooltip_language2,Status.tooltipTime)
    GUI.buttonLanguage4:setClickCallback("buttonLanguage4_click")

    function buttonLanguage4_click()
        Events.raiseEvent("setLanguageContentEvent", {number = 2})
    end



    -- CREATE BUTTON5 -> LANGUAGE -> TABWINDOW1  (recite button 3)
	-----------------------------------------------------------
	GUI.buttonLanguage5 = GUI.buttonLanguage5 or
    Geyser.Label:new({
        name = "buttonLanguage5",
        x = x1, y = y7,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage5:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonLanguage5:setToolTip(tooltip_language3,Status.tooltipTime)
    GUI.buttonLanguage5:setClickCallback("buttonLanguage5_click")

    function buttonLanguage5_click()
        Events.raiseEvent("setLanguageContentEvent", {number = 3})
    end



    -- CREATE BUTTON6 -> LANGUAGE -> TABWINDOW1  (recite button 4)
	-----------------------------------------------------------
	GUI.buttonLanguage6 = GUI.buttonLanguage6 or
    Geyser.Label:new({
        name = "buttonLanguage6",
        x = x1, y = y8,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage6:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonLanguage6:setToolTip(tooltip_language4,Status.tooltipTime)
    GUI.buttonLanguage6:setClickCallback("buttonLanguage6_click")

    function buttonLanguage6_click()
        Events.raiseEvent("setLanguageContentEvent", {number = 4})
    end



    -- CREATE BUTTON7 -> LANGUAGE -> TABWINDOW1  (recite button 5)
	-----------------------------------------------------------
	GUI.buttonLanguage7 = GUI.buttonLanguage7 or
    Geyser.Label:new({
        name = "buttonLanguage7",
        x = x1, y = y9,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage7:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonLanguage7:setToolTip(tooltip_language5,Status.tooltipTime)
    GUI.buttonLanguage7:setClickCallback("buttonLanguage7_click")

    function buttonLanguage7_click()
        Events.raiseEvent("setLanguageContentEvent", {number = 5})
    end



    -- CREATE BUTTON8 -> LANGUAGE -> TABWINDOW1  (recite button 6)
	-----------------------------------------------------------
	GUI.buttonLanguage8 = GUI.buttonLanguage8 or
    Geyser.Label:new({
        name = "buttonLanguage8",
        x = x1, y = y10,
        fontSize = 14,
        width = 23,
        height = 23,
        color = "black"
    }, GUI.containerLanguageBox)

    GUI.buttonLanguage8:setStyleSheet(StyleButtonSmallLightGrey:getCSS())
    GUI.buttonLanguage8:setToolTip(tooltip_language6,Status.tooltipTime)
    GUI.buttonLanguage8:setClickCallback("buttonLanguage8_click")

    function buttonLanguage8_click()
        Events.raiseEvent("setLanguageContentEvent", {number = 6})
    end



end

return languagebox