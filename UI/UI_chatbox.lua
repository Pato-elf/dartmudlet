chatbox = {}

function createChatBox()

-- CREATE CHATHOLDER BOX -> TABWINDOW4
-----------------------------------------------------------
GUI.containerChatholderBox = GUI.containerChatholderBox or
	Geyser.Label:new({
		name = "ChatholderBox",
		x = 0, y = 0,
		fontSize = 10,
		width = "100%",
		height = "100%",
		color = "black"
	}, GUI.tabwindow4.CHATcenter)


GUI.containerChatholderBox:setStyleSheet([[
		QLabel{
			color: black;
			background-color: black;
			margin: 9px;
		}
]])



	-- CREATE CHAT BOX -> CHATHOLDER -> TABWINDOW4
	-----------------------------------------------------------
	GUI.containerChatBox = GUI.containerChatBox or
		Geyser.MiniConsole:new({
			name = "ChatBox",
			autoWrap = true,
			x = 9, y = 9,
			fontSize = Status.fontSizeChat,
			width = -9,
			height = -9,
			color = "black"
		}, GUI.containerChatholderBox)

end

return chatbox
