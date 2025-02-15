improvebox = {}

function createImproveBox()



-- CREATE IMPROVE BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerImproveBox = GUI.containerImproveBox or
	Geyser.MiniConsole:new({
		name = "ImproveBox",
		x = 8, y = 8,
		fontSize = Status.fontSizeImproves,

		width = "100%-16",
		height = "100%-16",
		color = "black"
	}, GUI.tabwindow2.IMPROVEScenter)

end

return improvebox
