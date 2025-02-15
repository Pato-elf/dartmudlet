messagebox = {}



function createMessageBox()

-- CREATE MESSAGE BOX -> TABWINDOW5
-----------------------------------------------------------
GUI.containerMessageBox = GUI.containerMessageBox or
	Geyser.MiniConsole:new({
		name = "MessageBox",
		x = 8, y = 8,
		fontSize = Status.fontSizeMessage,
		width = "100%-16",
		height = "100%-16",
		color = "black"
	}, GUI.tabwindow5.MESSAGEcenter)

end

return messagebox