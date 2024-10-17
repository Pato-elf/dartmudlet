levelsbox = {}

function createLevelsBox()

-- CREATE LEVELS BOX -> TABWINDOW1
-----------------------------------------------------------
GUI.containerLevelsBox = GUI.containerLevelsBox or
	Geyser.Label:new({
		name = "LevelsBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow1.LEVELScenter)

GUI.containerLevelsBox:setStyleSheet(StyleBoxLevels:getCSS())

echo("LevelsBox", Info.showQuickLevels())

end

return levelsbox
