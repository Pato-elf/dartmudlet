locationbox = {}



function createLocationBox()

-- CREATE LOCATION BOX -> TABWINDOW5
-----------------------------------------------------------
GUI.containerLocationBox = GUI.containerLocationBox or
	Geyser.Label:new({
		name    = "LocationBox",
		x       = 5,
        y       = 5,
		width   = "100%-10",
		height  = "100%-10",
		color   = "black"
	}, GUI.tabwindow5.LOCATIONcenter)

    GUI.containerLocationBox:setStyleSheet([[qproperty-alignment: 'AlignBottom';]])



-- CREATE LOCATION BORDER BOX -> TABWINDOW5
-----------------------------------------------------------
GUI.containerLocationBorderBox = GUI.containerLocationBorderBox or
	Geyser.Label:new({
        name    = "LocationBorderBox",
        x       = 0,
        y       = 0,
        width   = "100%",
        height  = "100%",
        color   = "black"
    }, GUI.tabwindow5.LOCATIONcenter)

GUI.containerLocationBorderBox:setStyleSheet([[
    QLabel{
        background-color: black;
        margin: 0px 0px 0px 0px;
        background-color: rgba(0, 0, 0, 0);
        border-radius: 14px;
        border: 5px solid rgb(0, 0, 192);
    }
]])



end

return locationbox