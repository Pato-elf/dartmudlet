allocsbox = {}

function createAllocsBox()

-- CREATE ALLOCS BOX -> TABWINDOW2
-----------------------------------------------------------
GUI.containerAllocsBox = GUI.containerAllocsBox or
	Geyser.Label:new({
		name = "AllocsBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow2.ALLOCScenter)

GUI.containerAllocsBox:setStyleSheet(StyleBoxBlue:getCSS())

echo("AllocsBox", Info.showUnderConstruction())

end

return allocsbox
