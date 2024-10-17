whobox = {}

function createWhoBox()

-- CREATE WHO BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerWhoBox = GUI.containerWhoBox or
	Geyser.MiniConsole:new({
		name = "WhoBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow1.WHOcenter)

end

return whobox
