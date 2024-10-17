helpbox = {}

function createHelpBox()

-- CREATE HELP BOX -> TABWINDOW3
-----------------------------------------------------------
GUI.containerHelpBox = GUI.containerHelpBox or
	Geyser.Label:new({
		name = "HelpBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow3.HELPcenter)

GUI.containerHelpBox:setStyleSheet(StyleBoxHelp:getCSS())

echo("HelpBox", Info.showQuickHelp())

end

return helpbox
