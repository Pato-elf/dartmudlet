improvebox = {}

function createImproveBox()

-- CREATE IMPROVE BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerImproveBox = GUI.containerImproveBox or
	Geyser.MiniConsole:new({
		name = "ImproveBox",
		x = 12, y = 10,
		fontSize = 10,
		width = "96%",
		height = "93%",
		color = "black"
	}, GUI.tabwindow2.IMPROVEScenter)

end

return improvebox
