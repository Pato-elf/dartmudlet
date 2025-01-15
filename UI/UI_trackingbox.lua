trackingbox = {}


function createTrackingBox()


    local x1    = -298
    local x2    = -360
    local x3    = -240
    local x4    = -118

    local y1    = 14
    local y2    = 100
    local y3    = 124
    local y4    = 180
    local y5    = 129
    local y6    = 152
    local y7    = 185
    local y8    = -40





    local tooltip_tracking1     = "Turn tracking on/off"
    local tooltip_tracking2     = "Reset tracking stats"
    local tooltip_tracking3     = "Who is being tracked"
    local tooltip_tracking4     = "Number of improves tracked"
    local tooltip_tracking5     = "Number of improves per minute"
    local tooltip_tracking6     = "Number of improves per hour"
    local tooltip_tracking7     = "Combined total between player and pet improves"




-- CREATE TRACKING BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerTrackingBox = GUI.containerTrackingBox or
Geyser.Label:new({
    name = "TrackingBox",
    x = 0, y = 0,
    fontSize = 10,
    width = "100%",
    height = "100%",
    color = "black"
}, GUI.tabwindow1.TRACKINGcenter)

GUI.containerTrackingBox:setStyleSheet(StyleBoxBlue:getCSS())

--echo("TrackingBox", Info.showUnderConstruction())








-------------------------------------------------------------------------------
-- TEXT BOXES
-------------------------------------------------------------------------------







	-- CREATE TRACKING TEXTBOX1 -> TRACKING -> TABWINDOW1  (tracking display)
	-------------------------------------------------------
	GUI.textboxTracking1 = GUI.textboxTracking1 or
		Geyser.Label:new({
			name = "textboxTracking1",
			x = x1, y = y1,
			fontSize = 14,
			width = 290,
			height = 80,
			color = "black"
		}, GUI.containerTrackingBox)

	GUI.textboxTracking1:setStyleSheet(StyleTextMagentaXXLarge:getCSS())
    cecho("textboxTracking1", "00:00:00")



    -- CREATE TEXTBOX2 -> TRACKING -> TABWINDOW1 (horizontal line)
	-------------------------------------------------------
	GUI.textboxTracking2 = GUI.textboxTracking2 or
    Geyser.Label:new({
        name = "textboxTracking2",
        x = 1, y = y3,
        fontSize = 13,
        width = "100%",
        height = 1,
        color = "white"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking2:setStyleSheet(StyleHorizontalLine:getCSS())



    -- CREATE TEXTBOX3 -> TRACKING -> TABWINDOW1 (horizontal line 2)
	-------------------------------------------------------
	GUI.textboxTracking3 = GUI.textboxTracking3 or
    Geyser.Label:new({
        name = "textboxTracking3",
        x = 1, y = y4,
        fontSize = 13,
        width = "100%",
        height = 1,
        color = "white"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking3:setStyleSheet(StyleHorizontalLine:getCSS())












    -- CREATE TEXTBOX4 -> TRACKING -> TABWINDOW1 (NAME HEADER)
	-------------------------------------------------------
	GUI.textboxTracking4 = GUI.textboxTracking4 or
    Geyser.Label:new({
        name = "textboxTracking4",
        x = 0, y = y2,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking4:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking4:echo("NAME","yellow","l")
    GUI.textboxTracking4:setToolTip(tooltip_tracking3,Status.tooltipTime)



    -- CREATE TEXTBOX5 -> TRACKING -> TABWINDOW1 (IMPS HEADER)
	-------------------------------------------------------
	GUI.textboxTracking5 = GUI.textboxTracking5 or
    Geyser.Label:new({
        name = "textboxTracking5",
        x = x2 , y = y2,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking5:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking5:echo("IMPS","yellow","r")
    GUI.textboxTracking5:setToolTip(tooltip_tracking4,Status.tooltipTime)



    -- CREATE TEXTBOX6 -> TRACKING -> TABWINDOW1 (IMPS/MIN HEADER)
	-------------------------------------------------------
	GUI.textboxTracking6 = GUI.textboxTracking6 or
    Geyser.Label:new({
        name = "textboxTracking6",
        x = x3 , y = y2,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking6:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking6:echo("IMPS/MIN","yellow","r")
    GUI.textboxTracking6:setToolTip(tooltip_tracking5,Status.tooltipTime)



    -- CREATE TEXTBOX7 -> TRACKING -> TABWINDOW1 (IMPS/HR HEADER)
	-------------------------------------------------------
	GUI.textboxTracking7 = GUI.textboxTracking7 or
    Geyser.Label:new({
        name = "textboxTracking7",
        x = x4 , y = y2,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking7:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking7:echo("IMPS/HR","yellow","r")
    GUI.textboxTracking7:setToolTip(tooltip_tracking6,Status.tooltipTime)












    -- CREATE TEXTBOX8 -> TRACKING -> TABWINDOW1 (player name)
	-------------------------------------------------------
	GUI.textboxTracking8 = GUI.textboxTracking8 or
    Geyser.Label:new({
        name = "textboxTracking8",
        x = 0, y = y5,
        fontSize = 13,
        width = 150,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking8:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking8:echo("Playername","yellow","l")
    GUI.textboxTracking8:setToolTip(tooltip_tracking3,Status.tooltipTime)



    -- CREATE TEXTBOX9 -> TRACKING -> TABWINDOW1 (player improves)
	-------------------------------------------------------
	GUI.textboxTracking9 = GUI.textboxTracking9 or
    Geyser.Label:new({
        name = "textboxTracking9",
        x = x2, y = y5,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking9:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking9:echo("0","yellow","r")
    GUI.textboxTracking9:setToolTip(tooltip_tracking4,Status.tooltipTime)



    -- CREATE TEXTBOX10 -> TRACKING -> TABWINDOW1 (player imps/min)
	-------------------------------------------------------
	GUI.textboxTracking10 = GUI.textboxTracking10 or
    Geyser.Label:new({
        name = "textboxTracking10",
        x = x3, y = y5,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking10:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking10:echo("0.0","yellow","r")
    GUI.textboxTracking10:setToolTip(tooltip_tracking5,Status.tooltipTime)



    -- CREATE TEXTBOX11 -> TRACKING -> TABWINDOW1 (player imps/hour)
	-------------------------------------------------------
	GUI.textboxTracking11 = GUI.textboxTracking11 or
    Geyser.Label:new({
        name = "textboxTracking11",
        x = x4, y = y5,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking11:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking11:echo("0.0","yellow","r")
    GUI.textboxTracking11:setToolTip(tooltip_tracking6,Status.tooltipTime)



    -- CREATE TEXTBOX12 -> TRACKING -> TABWINDOW1 (pets name)
	-------------------------------------------------------
	GUI.textboxTracking12 = GUI.textboxTracking12 or
    Geyser.Label:new({
        name = "textboxTracking12",
        x = 0, y = y6,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking12:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking12:echo("Pets","yellow","l")
    GUI.textboxTracking12:setToolTip(tooltip_tracking3,Status.tooltipTime)



    -- CREATE TEXTBOX13 -> TRACKING -> TABWINDOW1 (pets improves)
	-------------------------------------------------------
	GUI.textboxTracking13 = GUI.textboxTracking13 or
    Geyser.Label:new({
        name = "textboxTracking13",
        x = x2, y = y6,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking13:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking13:echo("0","yellow","r")
    GUI.textboxTracking13:setToolTip(tooltip_tracking4,Status.tooltipTime)



    -- CREATE TEXTBOX14 -> TRACKING -> TABWINDOW1 (pets imps/min)
	-------------------------------------------------------
	GUI.textboxTracking14 = GUI.textboxTracking14 or
    Geyser.Label:new({
        name = "textboxTracking14",
        x = x3, y = y6,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking14:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking14:echo("0.0","yellow","r")
    GUI.textboxTracking14:setToolTip(tooltip_tracking5,Status.tooltipTime)



    -- CREATE TEXTBOX15 -> TRACKING -> TABWINDOW1 (pets imps/hour)
	-------------------------------------------------------
	GUI.textboxTracking15 = GUI.textboxTracking15 or
    Geyser.Label:new({
        name = "textboxTracking15",
        x = x4, y = y6,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking15:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking15:echo("0.0","yellow","r")
    GUI.textboxTracking15:setToolTip(tooltip_tracking6,Status.tooltipTime)










    -- CREATE TEXTBOX16 -> TRACKING -> TABWINDOW1 (total header)
	-------------------------------------------------------
	GUI.textboxTracking16 = GUI.textboxTracking16 or
    Geyser.Label:new({
        name = "textboxTracking16",
        x = 0, y = y7,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking16:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking16:echo("TOTAL","yellow","l")
    GUI.textboxTracking16:setToolTip(tooltip_tracking7,Status.tooltipTime)



    -- CREATE TEXTBOX17 -> TRACKING -> TABWINDOW1 (total improves)
	-------------------------------------------------------
	GUI.textboxTracking17 = GUI.textboxTracking17 or
    Geyser.Label:new({
        name = "textboxTracking17",
        x = x2, y = y7,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking17:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking17:echo("0","yellow","r")
    GUI.textboxTracking17:setToolTip(tooltip_tracking7,Status.tooltipTime)



    -- CREATE TEXTBOX18 -> TRACKING -> TABWINDOW1 (total improves/min)
	-------------------------------------------------------
	GUI.textboxTracking18 = GUI.textboxTracking18 or
    Geyser.Label:new({
        name = "textboxTracking18",
        x = x3, y = y7,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking18:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking18:echo("0.0","yellow","r")
    GUI.textboxTracking18:setToolTip(tooltip_tracking7,Status.tooltipTime)



    -- CREATE TEXTBOX19 -> TRACKING -> TABWINDOW1 (total improves/hour)
	-------------------------------------------------------
	GUI.textboxTracking19 = GUI.textboxTracking19 or
    Geyser.Label:new({
        name = "textboxTracking19",
        x = x4, y = y7,
        fontSize = 13,
        width = 110,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking19:setStyleSheet(StyleTextYellowLarge:getCSS())
    GUI.textboxTracking19:echo("0.0","yellow","r")
    GUI.textboxTracking19:setToolTip(tooltip_tracking7,Status.tooltipTime)



    -- CREATE TEXTBOX20 -> TRACKING -> TABWINDOW1 (help text)
	-------------------------------------------------------
	GUI.textboxTracking20 = GUI.textboxTracking20 or
    Geyser.Label:new({
        name = "textboxTracking20",
        x = 0, y = y8,
        fontSize = 10,
        width = 400,
        height = 24,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.textboxTracking20:setStyleSheet(StyleTextBlue:getCSS())
    GUI.textboxTracking20:echo("/track &lt;name&gt; to see detailed stats","yellow","l")









-------------------------------------------------------------------------------
-- BUTTONS
-------------------------------------------------------------------------------









	-- CREATE TRACKING BUTTON1 -> TRACKING -> TABWINDOW1 (tracking on/off)
	-----------------------------------------------------------
	GUI.buttonTracking1 = GUI.buttonTracking1 or
		Geyser.Label:new({
			name = "buttonTracking1",
			x = 10, y = 10,
			fontSize = 14,
			width = 190,
			height = 46,
			color = "black"
		}, GUI.containerTrackingBox)

	GUI.buttonTracking1:setStyleSheet(StyleButtonDarkGrey:getCSS())
	echo("buttonTracking1", "<center>TRACKING OFF</center>")
	GUI.buttonTracking1:setToolTip(tooltip_tracking1,Status.tooltipTime)
	GUI.buttonTracking1:setClickCallback("ButtonTracking1_click")

	function ButtonTracking1_click()
        Events.raiseEvent("setTrackingActiveEvent")
	end



    -- CREATE TRACKING BUTTON2 -> TRACKING -> TABWINDOW1 (reset settings)
	-----------------------------------------------------------
	GUI.buttonTracking2 = GUI.buttonTracking2 or
    Geyser.Label:new({
        name = "buttonTracking2",
        x = 10, y = 51,
        fontSize = 14,
        width = 190,
        height = 46,
        color = "black"
    }, GUI.containerTrackingBox)

    GUI.buttonTracking2:setStyleSheet(StyleButtonLightGrey:getCSS())
    echo("buttonTracking2", "<center>RESET TRACKING</center>")
    GUI.buttonTracking2:setToolTip(tooltip_tracking2,Status.tooltipTime)
    GUI.buttonTracking2:setClickCallback("ButtonTracking2_click")

    function ButtonTracking2_click()
		GUI.buttonTracking2:setStyleSheet(StyleButtonPaleBlue:getCSS())
		tempTimer(0.15, function() GUI.buttonTracking2:setStyleSheet(StyleButtonLightGrey:getCSS()) end)
        Events.raiseEvent("setTrackingResetEvent")
	end



end

return trackingbox