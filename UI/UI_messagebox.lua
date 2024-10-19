messagebox = {}

function createMessageBox()

-- CREATE MESSAGE BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerMessageBox = GUI.containerMessageBox or
	Geyser.MiniConsole:new({
		name = "MessageBox",
		x = 12, y = 10,
		fontSize = Status.fontSizeMessage,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow2.MESSAGEcenter)

end

return messagebox
