whobox = {}

function createWhoBox()

-- CREATE WHO BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerWhoBox = GUI.containerWhoBox or
	Geyser.MiniConsole:new({
		name = "WhoBox",
		x = 8, y = 8,
		fontSize = Status.fontSizeWho,
		width = "100%-16",
		height = "100%-16",
		color = "black"
	}, GUI.tabwindow1.WHOcenter)

end

return whobox
